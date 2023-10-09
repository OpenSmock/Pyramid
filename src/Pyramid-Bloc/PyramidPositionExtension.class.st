Class {
	#name : 'PyramidPositionExtension',
	#superclass : 'Object',
	#traits : 'TPyramidSpaceExtension + TPyramidEditorExtension',
	#classTraits : 'TPyramidSpaceExtension classTrait + TPyramidEditorExtension classTrait',
	#instVars : [
		'display'
	],
	#category : 'Pyramid-Bloc-plugin-space-extensions',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-space-extensions'
}

{ #category : 'accessing' }
PyramidPositionExtension >> display [

	^ display.
]

{ #category : 'initialization' }
PyramidPositionExtension >> initialize [

	display := (0 @ 0) asRopedText asElement.
	display
		background: Color white;
		zIndex: 1;
		padding: (BlInsets all: 3).
]

{ #category : 'displaying' }
PyramidPositionExtension >> installOn: aBuilder [

	self builder: aBuilder.

	self elementAtEvents when: BlMouseMoveEvent do: [ :evt |
		self display text:
			(evt position - self currentTransformTranslation) asRopedText ].
	self elementAtDisplay addChild: self display.
]
