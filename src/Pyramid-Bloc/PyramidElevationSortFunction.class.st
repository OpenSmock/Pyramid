Class {
	#name : #PyramidElevationSortFunction,
	#superclass : #SortFunction,
	#category : 'Pyramid-Bloc-utils'
}

{ #category : #evaluating }
PyramidElevationSortFunction >> collate: aFirstObject with: aSecondObject [
	" res = zIndex - zIndex
if (res = 0) and (parent is same) and (parent not nil) then
	^ parent sibling order
else
	^ res
"

	| res |
	res := aFirstObject elevation elevation - aSecondObject elevation elevation.
	(res = 0 and: [
		 aFirstObject parent = aSecondObject parent and: [
			 aFirstObject parent isNotNil ] ]) ifTrue: [
		^ (aFirstObject parent childIndexOf: aFirstObject)
		  - (aFirstObject parent childIndexOf: aSecondObject) ].
	^ res
]
