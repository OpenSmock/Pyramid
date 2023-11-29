Class {
	#name : #PyramidSpCodeObjectInteractionModel,
	#superclass : #SpCodeInteractionModel,
	#instVars : [
		'projectModel'
	],
	#category : #'Pyramid-plugin-selection'
}

{ #category : #accessing }
PyramidSpCodeObjectInteractionModel >> doItReceiver [

	self projectModel selection ifEmpty: [ ^ self projectModel roots ].
	self projectModel selection size = 1 ifTrue: [
		^ self projectModel selection first ].
	^ self projectModel selection
]

{ #category : #accessing }
PyramidSpCodeObjectInteractionModel >> doItReceiverString [

	self projectModel selection ifEmpty: [
		^ 'roots (use #Collection methods)' ].
	self projectModel selection size = 1 ifTrue: [ ^ 'a single element' ].
	^ 'a collection of <1p> elements' expandMacrosWith:
		  self projectModel selection size
]

{ #category : #testing }
PyramidSpCodeObjectInteractionModel >> isScripting [

	^ true
]

{ #category : #accessing }
PyramidSpCodeObjectInteractionModel >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidSpCodeObjectInteractionModel >> projectModel: aPyramidActiveProject [

	projectModel := aPyramidActiveProject
]
