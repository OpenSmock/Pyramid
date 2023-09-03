Class {
	#name : #PyramidRemoveSelectedElementsCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#instVars : [
		'mementoInverse'
	],
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidRemoveSelectedElementsCommand >> getValueFor: anElementOfSelection [

	^ nil
]

{ #category : #'as yet unclassified' }
PyramidRemoveSelectedElementsCommand >> mementoFor: anElement withArguments: anArgument [

	(anArgument includes: anElement) ifTrue: [
		^ PyramidCommandMemento new
			  command: PyramidRemoveFromCollectionCommand new commandInverse;
			  target: anArgument;
			  arguments: anElement;
			  yourself ].
	^ PyramidCommandMemento new
		  command: PyramidRemoveChildCommand new commandInverse;
		  target: anElement parent;
		  arguments: anElement;
		  yourself
]

{ #category : #accessing }
PyramidRemoveSelectedElementsCommand >> mementoInverse [

	^ mementoInverse
]

{ #category : #accessing }
PyramidRemoveSelectedElementsCommand >> mementoInverse: anObject [

	mementoInverse := anObject
]

{ #category : #'as yet unclassified' }
PyramidRemoveSelectedElementsCommand >> saveStatesOf: aCollection with: aRoots [
	"We ignore the state recovery for the redo, we will force the inverse of the undo state."

	^ self mementoInverse accept: PyramidMementoInverser new.
]

{ #category : #'as yet unclassified' }
PyramidRemoveSelectedElementsCommand >> saveStatesWithCommandInverseOf: aCollection with: aRoots [

	| mementos finalMemento |
	mementos := aCollection asArray collect: [ :anElement |
		            self mementoFor: anElement withArguments: aRoots ].
	finalMemento := mementos size = 1
		                ifTrue: [ mementos first ]
		                ifFalse: [
			                PyramidCompositeMemento new
				                mementos: mementos;
				                yourself ].
	self mementoInverse: finalMemento.
	^ finalMemento
]

{ #category : #'as yet unclassified' }
PyramidRemoveSelectedElementsCommand >> setValueFor: aBlElementToRemove with: aRoot [
	"Remove the element from its parent"

	"When the parent is the root"
	(aRoot includes: aBlElementToRemove) ifTrue: [
		aRoot remove: aBlElementToRemove.
		^ self 
	].

	"When the parent is not the root"
	aBlElementToRemove hasParent ifFalse:[ ^ self ].
	aBlElementToRemove parent removeChild: aBlElementToRemove
]
