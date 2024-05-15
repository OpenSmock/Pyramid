Class {
	#name : 'PyramidElementIdSortFunction',
	#superclass : 'SortFunction',
	#category : 'Pyramid-Bloc-utils',
	#package : 'Pyramid-Bloc',
	#tag : 'utils'
}

{ #category : 'evaluating' }
PyramidElementIdSortFunction >> collate: anObject1 with: anObject2 [
	"visible > hidden > gone"

	anObject1 id = anObject2 id ifTrue: [ ^ 0 ].
	anObject1 id ifNil: [ ^ 1 ].
	anObject2 id ifNil: [ ^ -1 ].
	^ anObject1 id threeWayCompareTo: anObject2 id
]
