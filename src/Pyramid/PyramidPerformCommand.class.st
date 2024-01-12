Class {
	#name : #PyramidPerformCommand,
	#superclass : #PyramidAutomaticCommand,
	#instVars : [
		'selector'
	],
	#category : #'Pyramid-commands'
}

{ #category : #'as yet unclassified' }
PyramidPerformCommand >> getValueFor: anObject [

	^ anObject perform: self selector asSymbol
]

{ #category : #accessing }
PyramidPerformCommand >> selector [

	^ selector
]

{ #category : #accessing }
PyramidPerformCommand >> selector: anObject [

	selector := anObject
]

{ #category : #'as yet unclassified' }
PyramidPerformCommand >> setValueFor: anObject with: anArgument [

	anObject perform: self selector asSymbol asMutator with: anArgument
]
