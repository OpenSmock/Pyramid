Class {
	#name : #NeoPyramidPositionOffsetCommand,
	#superclass : #NeoPyramidBlocCommand,
	#category : #'NeoPyramid-command'
}

{ #category : #'as yet unclassified' }
NeoPyramidPositionOffsetCommand >> getValueFor: aBlElement [

	^ aBlElement constraints position
]

{ #category : #'as yet unclassified' }
NeoPyramidPositionOffsetCommand >> saveStatesOf: aCollection withCommand: aCommand withArguments: anArguments [

	| mementos |
	mementos := aCollection collect: [ :each |
		            NeoPyramidCommandMemento new
			            command: NeoPyramidPositionCommand new;
			            target: each;
			            arguments: (self getValueFor: each);
			            yourself ].
	mementos size = 1 ifTrue: [ ^ mementos first ].
	^ NeoPyramidCompositeMemento new
		  mementos: mementos;
		  yourself
]

{ #category : #'as yet unclassified' }
NeoPyramidPositionOffsetCommand >> setValueFor: aBlElement with: anArgument [

	anArgument isPoint ifFalse: [ ^ self ].
	aBlElement constraints position:
		anArgument + aBlElement constraints position.
		aBlElement requestParentLayout
]
