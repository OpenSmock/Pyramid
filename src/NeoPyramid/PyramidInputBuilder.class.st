Class {
	#name : #PyramidInputBuilder,
	#superclass : #Object,
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #'as yet unclassified' }
PyramidInputBuilder >> buildForElement: anElement withState: aState [

	
]

{ #category : #'as yet unclassified' }
PyramidInputBuilder >> buildForModel: aModel [

	| input |
	input := self inputClass new.
	aModel states ifEmpty: [ input noState. ^ self ].
	aModel states size = 1 ifTrue: [ input singleState: aModel states first. ^ self ].
	input multiStates: aModel states.
]

{ #category : #'as yet unclassified' }
PyramidInputBuilder >> buildForState: aState [

	
]
