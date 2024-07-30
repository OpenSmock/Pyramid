Class {
	#name : #PyramidSpCodeObjectInteractionModel,
	#superclass : #SpCodeScriptingInteractionModel,
	#instVars : [
		'projectModel'
	],
	#category : 'Pyramid-plugin-playground'
}

{ #category : #accessing }
PyramidSpCodeObjectInteractionModel >> doItReceiver [

	self projectModel selection ifEmpty: [
		^ self projectModel firstLevelElements ].
	self projectModel selection size = 1 ifTrue: [
		^ self projectModel selection first ].
	^ self projectModel selection asArray
]

{ #category : #'as yet unclassified' }
PyramidSpCodeObjectInteractionModel >> doItReceiverString [

	self projectModel selection ifEmpty: [
		^ 'the collection of first level elements' ].
	self projectModel selection size = 1 ifTrue: [
		^ 'the selected element' ].
	^ 'an array of <1p> selected elements' expandMacrosWith:
		  self projectModel selection size
]

{ #category : #'as yet unclassified' }
PyramidSpCodeObjectInteractionModel >> isScripting [

	^ true
]

{ #category : #accessing }
PyramidSpCodeObjectInteractionModel >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidSpCodeObjectInteractionModel >> projectModel: anObject [

	projectModel := anObject
]
