Class {
	#name : #PyramidBusiness,
	#superclass : #Object,
	#instVars : [
		'selection',
		'presenter',
		'pipeline',
		'executor',
		'roots',
		'plugins'
	],
	#category : #'Pyramid-Business'
}

{ #category : #'as yet unclassified' }
PyramidBusiness >> defaultRoots [

	^ {
		BlElement new.
		BlElement new.
		BlElement new.
		BlElement new }
]

{ #category : #accessing }
PyramidBusiness >> getPlugin: aPlugginClass [

	^ self plugins at: aPlugginClass

	
]

{ #category : #initialization }
PyramidBusiness >> initialize [

	roots := PySelection new.
	roots addAll: self defaultRoots.

	selection := PySelection new.
	executor := PyCommandExecutor new.

	pipeline := PyPipeline new.
	pipeline addWorker: executor.
	pipeline selection: selection.

	self initializePlugins.

	presenter := PyEditorPresenter new.
	presenter business: self
]

{ #category : #initialization }
PyramidBusiness >> initializePlugins [

	plugins := Dictionary new.
	TPyEditorPlugin users do: [ :each |
		plugins at: each put: (
		           each new
			           installOn: self;
			           yourself) ]
]

{ #category : #'instance creation' }
PyramidBusiness >> open [
	self presenter open.
]

{ #category : #accessing }
PyramidBusiness >> pipeline [
	^ pipeline
]

{ #category : #accessing }
PyramidBusiness >> plugins [
	^ plugins
]

{ #category : #accessing }
PyramidBusiness >> presenter [
	^ presenter
]

{ #category : #accessing }
PyramidBusiness >> roots [
	^ roots
]

{ #category : #accessing }
PyramidBusiness >> selection [
	^ selection
]
