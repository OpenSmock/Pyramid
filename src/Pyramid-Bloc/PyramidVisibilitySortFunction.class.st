Class {
	#name : #PyramidVisibilitySortFunction,
	#superclass : #SortFunction,
	#category : #'Pyramid-Bloc-utils'
}

{ #category : #evaluating }
PyramidVisibilitySortFunction >> collate: aFirstObject with: aSecondObject [
	"visible > hidden > gone"

	aFirstObject visibility = aSecondObject visibility ifTrue: [ ^ PyramidElevationSortFunction new
		  collate: aFirstObject
		  with: aSecondObject ].

	"visible"

	(aFirstObject visibility isVisible and: [
		 aSecondObject visibility isVisible not ]) ifTrue: [ ^ -1 ].
	(aSecondObject visibility isVisible and: [
		 aFirstObject visibility isVisible not ]) ifTrue: [ ^ 1 ].

	"hidden"
	(aFirstObject visibility isHidden and: [
		 aSecondObject visibility isGone ]) ifTrue: [ ^ -1 ].
	(aSecondObject visibility isHidden and: [
		 aFirstObject visibility isGone ]) ifTrue: [ ^ 1 ].

	"default"
	^ PyramidElevationSortFunction new
		  collate: aFirstObject
		  with: aSecondObject
]
