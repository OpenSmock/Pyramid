Class {
	#name : #PyBusiness,
	#superclass : #Object,
	#instVars : [
		'selection',
		'pipeline',
		'roots',
		'plugins',
		'view'
	],
	#category : #'Pyramid-Business'
}

{ #category : #'as yet unclassified' }
PyBusiness >> defaultRoots [

	^ {
		BlElement new.
		BlElement new.
		BlElement new.
		BlElement new }
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
	pipeline addWorkerFirst: PyCommandExecutor new.
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

	self view open
]

{ #category : #accessing }
PyBusiness >> pipeline [
	^ pipeline
]

{ #category : #accessing }
PyBusiness >> plugins [
	^ plugins
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
