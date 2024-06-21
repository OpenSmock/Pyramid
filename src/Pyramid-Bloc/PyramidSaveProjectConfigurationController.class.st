Class {
	#name : 'PyramidSaveProjectConfigurationController',
	#superclass : 'Object',
	#instVars : [
		'view',
		'saveModel',
		'verifier',
		'editorWindow'
	],
	#category : 'Pyramid-Bloc-plugin-save',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-save'
}

{ #category : 'tests' }
PyramidSaveProjectConfigurationController >> browseProjectClass [

	| class |
	class := self class environment classNamed:
		         self saveModel savingClassName.
	class ifNil: [
		UIManager default inform:
			'Class do not exist yet. It will be created the first time you saved it.'.
		^ self ].
	self saveModel isClassSide
		ifTrue: [
			Smalltalk tools browser
				openOnClass: class class
				selector: self saveModel savingMethodName ]
		ifFalse: [
			Smalltalk tools browser
				openOnClass: class
				selector: self saveModel savingMethodName ]
]

{ #category : 'accessing' }
PyramidSaveProjectConfigurationController >> editorWindow [

	^ editorWindow
]

{ #category : 'accessing' }
PyramidSaveProjectConfigurationController >> editorWindow: anObject [

	editorWindow := anObject
]

{ #category : 'testing' }
PyramidSaveProjectConfigurationController >> isSaved [

	self saveModel isSaved: true.
	self updateWindowTitle
]

{ #category : 'as yet unclassified' }
PyramidSaveProjectConfigurationController >> projectModel: aProjectModel [

	aProjectModel announcer
		when: PyramidElementsChangedEvent
		do: [ :evt | self updateSaveState: evt ]
		for: self.
	aProjectModel announcer
		when: PyramidFirstLevelElementsChangedEvent
		do: [ :evt | self updateSaveState: evt ]
		for: self.
]

{ #category : 'as yet unclassified' }
PyramidSaveProjectConfigurationController >> radioUpdatedOnClassSide: aBoolean [

	aBoolean
		ifTrue: [ self saveModel onClass ]
		ifFalse: [ self saveModel onInstance ].
	self updateView
]

{ #category : 'accessing' }
PyramidSaveProjectConfigurationController >> saveModel [

	saveModel ifNil: [ saveModel := PyramidSaveModel new ].
	^ saveModel
]

{ #category : 'accessing' }
PyramidSaveProjectConfigurationController >> saveModel: aPyramidSaveModel [

	saveModel := aPyramidSaveModel.
	self view saveModel: aPyramidSaveModel.
	self updateView
]

{ #category : 'as yet unclassified' }
PyramidSaveProjectConfigurationController >> textUpdatedFromClass: aString [

	self saveModel savingClassName: aString.
	self saveModel isSaved: false.
	self updateView
]

{ #category : 'as yet unclassified' }
PyramidSaveProjectConfigurationController >> textUpdatedFromMethod: aString [

	self saveModel savingMethodName: aString.
	self saveModel isSaved: false.
	self updateView
]

{ #category : 'as yet unclassified' }
PyramidSaveProjectConfigurationController >> textUpdatedFromPackage: aString [

	self saveModel savingPackageName: aString.
	self saveModel isSaved: false.
	self updateView
]

{ #category : 'as yet unclassified' }
PyramidSaveProjectConfigurationController >> updateSaveState: anEvent [

	self saveModel isSaved: false.
	self updateWindowTitle
]

{ #category : 'as yet unclassified' }
PyramidSaveProjectConfigurationController >> updateView [

	| errors |
	errors := self verifier allErrors: self saveModel.
	self view hideLabels.
	self view buttonBrowse enabled: errors isEmpty.
	errors do: [ :each | each showOn: self view ].
	self updateWindowTitleWithErrors: errors
]

{ #category : 'testing' }
PyramidSaveProjectConfigurationController >> updateWindowTitle [

	| errors |
	errors := self verifier allErrors: self saveModel.
	self updateWindowTitleWithErrors: errors
]

{ #category : 'as yet unclassified' }
PyramidSaveProjectConfigurationController >> updateWindowTitleWithErrors: aCollection [

	| title |
	self editorWindow ifNil: [ ^ self ].
	title := aCollection
		         ifNotEmpty: [ self editorWindow class defaultTitle ]
		         ifEmpty: [ self saveModel asTitleString ].
	self editorWindow title: title
]

{ #category : 'accessing' }
PyramidSaveProjectConfigurationController >> verifier [

	verifier ifNil: [
		verifier := PyramidSaveModelVerifier verifierNoErrorForInputsView ].
	^ verifier
]

{ #category : 'accessing' }
PyramidSaveProjectConfigurationController >> view [

	view ifNil: [
		view := PyramidSaveProjectConfigurationView new.
		view
			controller: self;
			saveModel: self saveModel ].
	^ view
]

{ #category : 'accessing' }
PyramidSaveProjectConfigurationController >> view: anObject [

	view := anObject
]
