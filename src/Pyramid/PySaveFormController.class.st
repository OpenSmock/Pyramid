Class {
	#name : #PySaveFormController,
	#superclass : #Object,
	#instVars : [
		'validator',
		'model',
		'view'
	],
	#category : #'Pyramid-Plugin-Save'
}

{ #category : #accessing }
PySaveFormController >> model [
model ifNil: [ model := PySaveModel new ].
	^ model
]

{ #category : #'as yet unclassified' }
PySaveFormController >> radioUpdatedOnClassSide: aBoolean [

	aBoolean
		ifTrue: [ self model classSide ]
		ifFalse: [ self model instanceSide ].
	
	self view hideLabelMethod.
	self validateMethodDoNotOverride.
]

{ #category : #'as yet unclassified' }
PySaveFormController >> textUpdatedFromClass: aString [

	self model defaultClassName: aString.
	self view hideLabelClass.
	self validateClassExist.
	self view hideLabelMethod.
	self validateMethodDoNotOverride.
	self validateModelIsNotEmpty
]

{ #category : #'as yet unclassified' }
PySaveFormController >> textUpdatedFromMethod: aString [

	self model defaultMethodName: aString.
	self view hideLabelMethod.
	self validateMethodDoNotOverride.
	self validateModelIsNotEmpty
]

{ #category : #'as yet unclassified' }
PySaveFormController >> textUpdatedFromPackage: aString [

	self model defaultPackageName: aString.
	self view hideLabelPackage.
	self validatePackageExist.
	self validateModelIsNotEmpty
]

{ #category : #'as yet unclassified' }
PySaveFormController >> validateClassExist [

	[ self validator validateClassDoesExist: self model ]
		on: PySaveClassDontExistException
		do: [ self view showInfoClassWillBeCreated ]
]

{ #category : #'as yet unclassified' }
PySaveFormController >> validateMethodDoNotOverride [

	[ [ self validator validateOverridesMethod: self model ]
		on: PySaveOverridePyStonMethodException
		do: [ self view showInfoMethodWillOverride ] ] on: PySaveWillOverrideANotPystonMethodException
		do: [ self view showErrorMethodWillOverride ]
]

{ #category : #'as yet unclassified' }
PySaveFormController >> validateModelIsNotEmpty [

	[ self validator validatePackageIsNotEmpty: self model ]
		on: PySavePackageMissingError
		do: [ self view showErrorPackageMissing ].
		[ self validator validateClassIsNotEmpty: self model ]
		on: PySaveClassMissingError
		do: [ self view showErrorClassMissing ].
	[ self validator validateMethodIsNotEmpty: self model ]
		on: PySaveMethodMissingError
		do: [ self view showErrorMethodMissing ]
]

{ #category : #'as yet unclassified' }
PySaveFormController >> validatePackageExist [

	[ self validator validatePackageDoesExist: self model ]
		on: PySavePackageDontExistException
		do: [ self view showInfoPackageWillBeCreated ]
]

{ #category : #accessing }
PySaveFormController >> validator [

	validator ifNil: [ validator := PySaveValidator new ].
	^ validator
]

{ #category : #accessing }
PySaveFormController >> view [

	^ view
]

{ #category : #accessing }
PySaveFormController >> view: aPySaveFormView [

	view := aPySaveFormView
]
