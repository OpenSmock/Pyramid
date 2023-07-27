Class {
	#name : #PyramidSaveProjectConfigurationController,
	#superclass : #Object,
	#instVars : [
		'view',
		'model',
		'verifier',
		'editorWindow'
	],
	#category : #'Pyramid-plugin-save'
}

{ #category : #tests }
PyramidSaveProjectConfigurationController >> browseProjectClass [

	| class |
	class := self class environment classNamed:
		         self model savingClassName.
	class ifNil: [ 
		UIManager default inform: 'Class do not exist yet. It will be created the first time you saved it.'.
		^ self ].
	self model isClassSide
		ifTrue: [
			Smalltalk tools browser
				openOnClass: class class
				selector: self model savingMethodName ]
		ifFalse: [
			Smalltalk tools browser
				openOnClass: class
				selector: self model savingMethodName ]
]

{ #category : #accessing }
PyramidSaveProjectConfigurationController >> editorWindow [

	^ editorWindow
]

{ #category : #accessing }
PyramidSaveProjectConfigurationController >> editorWindow: anObject [

	editorWindow := anObject
]

{ #category : #accessing }
PyramidSaveProjectConfigurationController >> model [

	model ifNil: [ model := PyramidSaveModel new ].
	^ model
]

{ #category : #accessing }
PyramidSaveProjectConfigurationController >> model: aPyramidSaveModel [

	model := aPyramidSaveModel.
	self view model: aPyramidSaveModel
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationController >> radioUpdatedOnClassSide: aBoolean [

	aBoolean
		ifTrue: [ self model onClass ]
		ifFalse: [ self model onInstance ]. self updateView
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationController >> textUpdatedFromClass: aString [

	self model savingClassName: aString.
	self updateView
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationController >> textUpdatedFromMethod: aString [

		self model savingMethodName: aString.
	self updateView
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationController >> textUpdatedFromPackage: aString [

	self model savingPackageName: aString.
	self updateView
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationController >> updateEditorWindow [

	| title |
	self editorWindow ifNil: [ ^ self ].
	title := self model asTitleString , ' | Pyramid'.
	self editorWindow title: title
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationController >> updateEditorWindowWithErrors: aCollection [

	| title |
	self editorWindow ifNil: [ ^ self ].
	 title :=  aCollection
		ifNotEmpty: [self editorWindow class defaultTitle ]
		ifEmpty: [ self model asTitleString , ' | Pyramid' ].
	self editorWindow title: title
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationController >> updateView [

	| errors |
	errors := self verifier allErrors: self model.
	self view hideLabels.
	self view buttonBrowse enabled: errors isEmpty.
	errors do: [ :each | each showOn: self view ].
	self updateEditorWindowWithErrors: errors
]

{ #category : #accessing }
PyramidSaveProjectConfigurationController >> verifier [

	verifier ifNil: [
		verifier := PyramidSaveModelVerifier verifierNoErrorForInputsView ].
	^ verifier
]

{ #category : #accessing }
PyramidSaveProjectConfigurationController >> view [

	view ifNil: [ view := PyramidSaveProjectConfigurationView new.
		view controller: self; model: self model ].
	^ view
]

{ #category : #accessing }
PyramidSaveProjectConfigurationController >> view: anObject [

	view := anObject
]
