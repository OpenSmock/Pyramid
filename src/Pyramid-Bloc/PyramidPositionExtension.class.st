Class {
	#name : #PyramidPositionExtension,
	#superclass : #Object,
	#traits : 'TPyramidSpaceExtension + TPyramidEditorExtension',
	#classTraits : 'TPyramidSpaceExtension classTrait + TPyramidEditorExtension classTrait',
	#instVars : [
		'display',
		'scaleFactor',
		'position'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #accessing }
PyramidPositionExtension >> display [

	^ display.
]

{ #category : #initialization }
PyramidPositionExtension >> initialize [

	scaleFactor := 1.
	position := (0 @ 0).
	display := position asRopedText asElement.
	display
		id: 'position';
		background: Color white;
		zIndex: 1;
		padding: (BlInsets all: 3)
]

{ #category : #displaying }
PyramidPositionExtension >> installOn: aBuilder [

	self builder: aBuilder.

	self elementAtEvents addEventHandler: (BlEventHandler
			 on: BlMouseMoveEvent
			 do: [ :evt |
				 position := (evt position - self currentTransformTranslation / scaleFactor) rounded.
				 self display text: position asRopedText ]).
	self elementAtDisplaysAddons addChild: self display
]

{ #category : #accessing }
PyramidPositionExtension >> position [

	^ position
]

{ #category : #accessing }
PyramidPositionExtension >> scaleFactor [

	^ scaleFactor
]

{ #category : #accessing }
PyramidPositionExtension >> scaleFactor: aScale [
	
	scaleFactor := aScale
]
