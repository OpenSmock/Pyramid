Class {
	#name : #PyramidBusiness,
	#superclass : #Object,
	#instVars : [
		'selection',
		'presenter',
		'history',
		'pipeline',
		'executor',
		'logger'
	],
	#category : #'Pyramid-Business'
}

{ #category : #initialization }
PyramidBusiness >> initialize [

	presenter := PyEditorPresenter new.

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
PyramidBusiness >> selection [
	^ selection
]
