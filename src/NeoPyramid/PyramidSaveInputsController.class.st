Class {
	#name : #PyramidSaveInputsController,
	#superclass : #Object,
	#instVars : [
		'view',
		'model',
		'verifier'
	],
	#category : #'NeoPyramid-plugin-save'
}

{ #category : #accessing }
PyramidSaveInputsController >> model [

	model ifNil: [ model := PyramidSaveModel new ].
	^ model
]

{ #category : #accessing }
PyramidSaveInputsController >> model: aPyramidSaveModel [

	model := aPyramidSaveModel.
	self view model: aPyramidSaveModel
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsController >> radioUpdatedOnClassSide: aBoolean [

	aBoolean
		ifTrue: [ self model onClass ]
		ifFalse: [ self model onInstance ]. self updateView
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsController >> textUpdatedFromClass: aString [

	self model savingClassName: aString.
	self updateView
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsController >> textUpdatedFromMethod: aString [

		self model savingMethodName: aString.
	self updateView
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsController >> textUpdatedFromPackage: aString [

	self model savingPackageName: aString.
	self updateView
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsController >> updateView [

	| errors |
	errors := self verifier allErrors: self model.
	self view hideLabels.
	errors do: [ :each | each showOn: self view ]
]

{ #category : #accessing }
PyramidSaveInputsController >> verifier [

	verifier ifNil: [
		verifier := PyramidSaveModelVerifier verifierNoErrorForInputsView ].
	^ verifier
]

{ #category : #accessing }
PyramidSaveInputsController >> view [

	view ifNil: [ view := PyramidSaveInputsView new.
		view controller: self; model: self model ].
	^ view
]

{ #category : #accessing }
PyramidSaveInputsController >> view: anObject [

	view := anObject
]
