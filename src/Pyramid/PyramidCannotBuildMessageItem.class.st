Class {
	#name : #PyramidCannotBuildMessageItem,
	#superclass : #PyramidMessageItem,
	#instVars : [
		'source',
		'because'
	],
	#category : #'Pyramid-views'
}

{ #category : #adding }
PyramidCannotBuildMessageItem >> addOnLayout: aLayout [

	aLayout add: (SpBoxLayout newHorizontal add: (SpLinkPresenter new label: self source class printString; action: [self source browse ]; yourself) expand: false; add: (self because printString); yourself)
]

{ #category : #accessing }
PyramidCannotBuildMessageItem >> because [

	^ because
]

{ #category : #accessing }
PyramidCannotBuildMessageItem >> because: anObject [

	because := anObject
]

{ #category : #accessing }
PyramidCannotBuildMessageItem >> source [

	^ source
]

{ #category : #accessing }
PyramidCannotBuildMessageItem >> source: anObject [

	source := anObject
]
