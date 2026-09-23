Class {
	#name : #PyramidDynamicResizeCommand,
	#superclass : #PyramidBasicConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #testing }
PyramidDynamicResizeCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
			  anObject size ]
]

{ #category : #history }
PyramidDynamicResizeCommand >> commandInverse [ 

	^ PyramidUndoDynamicResizeBlocCommand new
]

{ #category : #getter }
PyramidDynamicResizeCommand >> getValueFor: anObject [

	^ anObject extent
]

{ #category : #history }
PyramidDynamicResizeCommand >> saveStatesWithCommandInverseOf: aCollection with: arguments [
	| mementos |

	mementos := aCollection collect: [ :each |
		            PyramidCommandMemento new
			            command: self commandInverse;
			            target: each;
			            arguments: (self commandInverse getValueFor: each);
			            yourself ].
	mementos size = 1 ifTrue: [ ^ mementos first ].
	^ PyramidCompositeMemento new
		  mementos: mementos;
		  yourself
]

{ #category : #setter }
PyramidDynamicResizeCommand >> setValueFor: anObject with: anArgument [

	^ anObject constraintsDo: [ :c |
		  c horizontal exact: anArgument x.
		  c vertical exact: anArgument y ]
]
