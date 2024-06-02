Class {
	#name : 'PyramidSpCodeObjectInteractionModel',
	#superclass : 'SpCodeInteractionModel',
	#instVars : [
		'projectModel'
	],
	#category : 'Pyramid-Tests-cases-plugin-playground',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-playground'
}

{ #category : 'accessing' }
PyramidSpCodeObjectInteractionModel >> doItReceiver [

	self projectModel selection ifEmpty: [ ^ self projectModel firstLevelElements ].
	self projectModel selection size = 1 ifTrue: [
		^ self projectModel selection first ].
	^ self projectModel selection
]

{ #category : 'accessing' }
PyramidSpCodeObjectInteractionModel >> doItReceiverString [

	self projectModel selection ifEmpty: [
		^ 'the collection of first level elements' ].
	self projectModel selection size = 1 ifTrue: [
		^ 'the selected element' ].
	^ 'an array of <1p> selected elements' expandMacrosWith:
		  self projectModel selection size
]

{ #category : 'testing' }
PyramidSpCodeObjectInteractionModel >> isScripting [

	^ true
]

{ #category : 'accessing' }
PyramidSpCodeObjectInteractionModel >> projectModel [

	^ projectModel
]

{ #category : 'accessing' }
PyramidSpCodeObjectInteractionModel >> projectModel: aPyramidActiveProject [

	projectModel := aPyramidActiveProject
]
