Class {
	#name : #PyramidRemoveSelectionCommand,
	#superclass : #PyramidEditorCommand,
	#instVars : [
		'mementoInverse'
	],
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidRemoveSelectionCommand >> getValueFor: anElementOfSelection [

	^ nil
]

{ #category : #'as yet unclassified' }
PyramidRemoveSelectionCommand >> mementoFor: anElement withArguments: aFakeRoots onRoots: aRealRoots [

	(aFakeRoots includes: anElement) ifTrue: [
		^ PyramidCommandMemento new
			  command: PyramidRemoveFromCollectionCommand new;
			  target: aRealRoots;
			  arguments: anElement;
			  yourself ].
	^ PyramidCommandMemento new
		  command: PyramidRemoveChildrenCommand new;
		  target: anElement parent;
		  arguments: anElement;
		  yourself
]

{ #category : #accessing }
PyramidRemoveSelectionCommand >> mementoInverse [

	^ mementoInverse
]

{ #category : #accessing }
PyramidRemoveSelectionCommand >> mementoInverse: anObject [

	mementoInverse := anObject
]

{ #category : #'as yet unclassified' }
PyramidRemoveSelectionCommand >> mementoInvertedFor: anElement withArguments: aRoots [

	(aRoots includes: anElement) ifTrue: [
		^ PyramidCommandMemento new
			  command: PyramidRemoveFromCollectionCommand new commandInverse;
			  target: aRoots;
			  arguments: anElement;
			  yourself ].
	^ PyramidCommandMemento new
		  command: PyramidRemoveChildrenCommand new commandInverse;
		  target: anElement parent;
		  arguments: anElement ;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidRemoveSelectionCommand >> saveStatesOf: aCollection with: aRoots [
	"We ignore the state recovery for the redo, we will force the inverse of the undo state."

	| visitor |
	visitor := PyramidMementoInverser new.
	^ self mementoInverse accept: visitor.
]

{ #category : #'as yet unclassified' }
PyramidRemoveSelectionCommand >> saveStatesWithCommandInverseOf: aCollection with: aRoots [

	| mementos finalMemento |
	mementos := aCollection asArray collect: [ :anElement |
		            self mementoInvertedFor: anElement withArguments: aRoots ].
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
PyramidRemoveSelectionCommand >> setValueFor: anElementOfSelection with: aRoot [

	(aRoot includes: anElementOfSelection) ifTrue: [
		aRoot remove: anElementOfSelection.
		^ self ].
	anElementOfSelection parent removeChild: anElementOfSelection
]
