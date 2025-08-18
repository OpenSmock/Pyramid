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
				"if the value is under 0.101 an display problem occured and the blue border of the workplace visually disapear"
				 self scaleFactor <= 0.1 ifTrue: [ self scaleFactor: 0.101 ].
				 position := (evt position - self currentTransformTranslation / self scaleFactor) rounded.
				 self display text: self position asRopedText ]).
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
