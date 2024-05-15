Class {
	#name : 'PyramidChildrenCommand',
	#superclass : 'PyramidAbstractBlocCommand',
	#category : 'Pyramid-Bloc-plugin-bloc',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc'
}

{ #category : 'testing' }
PyramidChildrenCommand class >> isAbstract [

	^ self == PyramidChildrenCommand
]

{ #category : 'as yet unclassified' }
PyramidChildrenCommand >> getValueFor: aBlElement [

	^ nil
]

{ #category : 'as yet unclassified' }
PyramidChildrenCommand >> saveStatesOf: aCollection withCommand: aCommand withArguments: anArguments [

	| mementos |
	mementos := aCollection asArray collect: [ :each |
		            PyramidCommandMemento new
			            command: aCommand;
			            target: each;
			            arguments: anArguments;
			            yourself ].
	mementos size = 1 ifTrue: [ ^ mementos first ].
	^ PyramidCompositeMemento new
		  mementos: mementos;
		  yourself
]
