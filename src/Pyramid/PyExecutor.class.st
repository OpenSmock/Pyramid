Class {
	#name : #PyExecutor,
	#superclass : #Object,
	#instVars : [
		'history'
	],
	#category : #'Pyramid-test'
}

{ #category : #'as yet unclassified' }
PyExecutor >> doAndRecord: aCommand on: anElement [

	aCommand save: anElement on: history.
	aCommand executeOn: anElement
]

{ #category : #'as yet unclassified' }
PyExecutor >> initialize [

	history := OrderedCollection new
]

{ #category : #'as yet unclassified' }
PyExecutor >> undo [

	history ifEmpty: [ ^self ].
	history removeLast restore
]
