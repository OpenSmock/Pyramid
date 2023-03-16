Class {
	#name : #PyCommandBackground,
	#superclass : #PyCommand,
	#category : #'Pyramid-test2'
}

{ #category : #execution }
PyCommandBackground >> executeOn: aBlElement [

	aBlElement background: self arguments background
]

{ #category : #'as yet unclassified' }
PyCommandBackground >> stateOf: aBlElement for: aMemento [

	aMemento background: aBlElement background
]
