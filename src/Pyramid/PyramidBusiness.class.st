Class {
	#name : #PyramidBusiness,
	#superclass : #Object,
	#instVars : [
		'selection',
		'presenter',
		'history',
		'pipeline',
		'executor',
		'logger',
		'roots'
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

{ #category : #initialization }
PyramidBusiness >> initialize [

	presenter := PyEditorPresenter new.
	roots := PyRoots new.
	roots addAll: self defaultRoots.

	selection := PySelection new.
	history := PyCommandHistory new.
	executor := PyCommandExecutor new.
	logger := PyCommandLogger new.
	pipeline := PyPipeline new.

	pipeline add: history.
	pipeline add: logger.
	pipeline add: executor.
	pipeline selection: selection.

	presenter business: self
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
