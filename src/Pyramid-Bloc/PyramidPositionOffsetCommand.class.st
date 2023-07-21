Class {
	#name : #PyramidPositionOffsetCommand,
	#superclass : #PyramidBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidPositionOffsetCommand >> getValueFor: aBlElement [

	^ aBlElement constraints position
]

{ #category : #'as yet unclassified' }
PyramidPositionOffsetCommand >> saveStatesOf: aCollection withCommand: aCommand withArguments: anArguments [

	| mementos |
	mementos := aCollection collect: [ :each |
		            PyramidCommandMemento new
			            command: PyramidPositionCommand new;
			            target: each;
			            arguments: (self getValueFor: each);
			            yourself ].
	mementos size = 1 ifTrue: [ ^ mementos first ].
	^ PyramidCompositeMemento new
		  mementos: mementos;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPositionOffsetCommand >> setValueFor: aBlElement with: anArgument [

	anArgument isPoint ifFalse: [ ^ self ].
	aBlElement constraints position:
		anArgument + aBlElement constraints position.
		aBlElement requestParentLayout
]
