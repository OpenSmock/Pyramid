Class {
	#name : #PyBusiness,
	#superclass : #Object,
	#instVars : [
		'selection',
		'pipeline',
		'roots',
		'plugins',
		'view',
		'restorationBlock'
	],
	#category : #'Pyramid-Business'
}

{ #category : #'as yet unclassified' }
PyBusiness class >> userdataKey [
	^ #PyramidEditorIsOpened
]

{ #category : #'as yet unclassified' }
PyBusiness >> defaultRoots [

	| e1 e2 e3 |
	e1 := BlElement new addChildren: {
			      BlElement new.
			      BlElement new.
			      BlElement new.
			      BlElement new }.
	e2 := BlElement new addChildren: {
			      BlElement new.
			      BlElement new.
			      BlElement new.
			      BlElement new }.
	e3 := BlElement new addChildren: {
			      (BlElement new addChildren: {
					       BlElement new.
					       BlElement new.
					       BlElement new.
					       BlElement new }).
			      (BlElement new addChildren: {
					       BlElement new.
					       BlElement new.
					       BlElement new.
					       BlElement new }).
			      (BlElement new addChildren: {
					       BlElement new.
					       BlElement new.
					       BlElement new.
					       BlElement new }).
			      (BlElement new addChildren: {
					       BlElement new.
					       BlElement new.
					       BlElement new.
					       BlElement new }) }.
	^ {
		  e1.
		  e2.
		  e3 }
]

{ #category : #accessing }
PyBusiness >> getPlugin: aPlugginClass [

	^ self plugins at: aPlugginClass

	
]

{ #category : #initialization }
PyBusiness >> initialize [

	self initializeRoots.
	self initializeSelection.
	self initializePipeline.
	self initializePlugins.
	self initializeView.
]

{ #category : #initialization }
PyBusiness >> initializePipeline [

	pipeline := PyPipeline new.
	pipeline selection: self selection.
]

{ #category : #initialization }
PyBusiness >> initializePlugins [

	| pluginLocator |
	pluginLocator := PyLocatorPlugins new.
	plugins := Dictionary new.
	pluginLocator pluginsClass do: [ :each |
		plugins at: each put: (each new
				 installOn: self;
				 yourself) ]
]

{ #category : #initialization }
PyBusiness >> initializeRoots [
	roots := PySelection new.
	roots addAll: self defaultRoots.
]

{ #category : #initialization }
PyBusiness >> initializeSelection [

	selection := PySelection new.
]

{ #category : #initialization }
PyBusiness >> initializeView [
	view := PyEditorPresenter new.
	view business: self
]

{ #category : #'instance creation' }
PyBusiness >> open [

	| window |
	window := self view open.
	window resize: 1024 @ 720.
	window title: 'Pyramid Editor'.
	window whenClosedDo: [ self whenWindowClosed ]
]

{ #category : #'instance creation' }
PyBusiness >> openOn: aBlElementOrACollection [

	| newRoots oldParent |
	newRoots := aBlElementOrACollection isCollection
		            ifTrue: [ aBlElementOrACollection ]
		            ifFalse: [ { aBlElementOrACollection } ].

	oldParent := (newRoots collect: [ :each | each parent ]) asSet
		             asArray.
	oldParent size == 1 ifFalse: [
		PyCanNotEditChildFromDifferentParentError signal:
			'You cannot edit child comming from different parent.' ].

	oldParent := oldParent first.
	oldParent ifNil: [
		self roots clearThenAddAll: newRoots.
		^ self open ].

	oldParent userData
		at: PyBusiness userdataKey
		ifPresent: [ :business |
		"PyEditorAlreadyOpenError signal: 'A PyEditor is open.'". ^ self ].

	newRoots do: [ :each |
		each parent ifNotNil: [ each parent removeChild: each ] ].
	self restorationBlock: [
		self roots elements do: [ :each |
			each parent removeChild: each.
			oldParent addChild: each ] ].

	self roots clearThenAddAll: newRoots.
	^ self open
]

{ #category : #'instance creation' }
PyBusiness >> openOn: anObject selector: aSelector [

	| saveModel newRoots |
	saveModel := (self getPlugin: PyPluginSave) saveModel.

	anObject isClass
		ifTrue: [
			saveModel defaultPackageName: anObject package name.
			saveModel defaultClassName: anObject name.
			saveModel defaultMethodName: aSelector.
			saveModel classSide ]
		ifFalse: [
			saveModel defaultPackageName: anObject class package name.
			saveModel defaultClassName: anObject class name.
			saveModel defaultMethodName: aSelector.
			saveModel instanceSide ].

	newRoots := BlSerializer materialize: (anObject perform: aSelector).
	self openOn: newRoots
]

{ #category : #accessing }
PyBusiness >> pipeline [
	^ pipeline
]

{ #category : #accessing }
PyBusiness >> plugins [
	^ plugins
]

{ #category : #'as yet unclassified' }
PyBusiness >> restorationBlock [

	restorationBlock ifNil: [ restorationBlock := [  ] ].
	^ restorationBlock
]

{ #category : #'as yet unclassified' }
PyBusiness >> restorationBlock: aBlock [

	restorationBlock := aBlock
]

{ #category : #accessing }
PyBusiness >> roots [
	^ roots
]

{ #category : #accessing }
PyBusiness >> selection [
	^ selection
]

{ #category : #accessing }
PyBusiness >> view [

	^ view
]

{ #category : #'as yet unclassified' }
PyBusiness >> whenWindowClosed [


	self restorationBlock value.
]
