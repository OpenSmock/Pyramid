Class {
	#name : 'PyramidGenericCommand',
	#superclass : 'PyramidBlocTextCommand',
	#instVars : [
		'selector'
	],
	#category : 'Pyramid-Bloc-plugin-bloc-text',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-text'
}

{ #category : 'as yet unclassified' }
PyramidGenericCommand >> getValueFor: aBLElement [

	^ aBLElement perform: selector
]

{ #category : 'accessing' }
PyramidGenericCommand >> selector [

	^ selector
]

{ #category : 'accessing' }
PyramidGenericCommand >> selector: anObject [

	selector := anObject
]

{ #category : 'as yet unclassified' }
PyramidGenericCommand >> setValueFor: aBLElement with: aValue [

	aBLElement perform: selector asMutator with: aValue
]
