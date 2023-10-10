Class {
	#name : 'PyramidWheelTransformExtension',
	#superclass : 'Object',
	#traits : 'TPyramidSpaceExtension + TPyramidEditorExtension + TPyramidKeyboardExtension',
	#classTraits : 'TPyramidSpaceExtension classTrait + TPyramidEditorExtension classTrait + TPyramidKeyboardExtension classTrait',
	#category : 'Pyramid-Bloc-plugin-space-extensions',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-space-extensions'
}

{ #category : 'displaying' }
PyramidWheelTransformExtension >> installOn: aBuilder [

	self builder: aBuilder.

	self elementAtEvents when: BlMouseWheelEvent do: [ :evt |
		| moveTo |
		moveTo := nil.
		self isNoKeyPressed ifTrue: [ moveTo := evt vector asPoint ].
		self isOnlyShiftKeyPressed ifTrue: [
			moveTo := evt vector asPoint leftRotated ].
		moveTo ifNotNil: [
			self elementAtTransforms transformDo: [ :t |
				t translateBy:
					moveTo * self wheelSpeed + self currentTransformTranslation ].
			self builder signalTransformationChanged ] ]
]

{ #category : 'as yet unclassified' }
PyramidWheelTransformExtension >> wheelSpeed [

	^ 10
]
