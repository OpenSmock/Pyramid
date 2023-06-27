Class {
	#name : #PyramidPaintGradiantStopModel,
	#superclass : #Object,
	#instVars : [
		'number',
		'color',
		'next'
	],
	#category : #'Pyramid-Bloc-custom-specs-paint'
}

{ #category : #'as yet unclassified' }
PyramidPaintGradiantStopModel >> collectOn: aCollection [

	aCollection add: self number -> self color.
	self next ifNotNil: [ self next collectOn: aCollection ].
	
]

{ #category : #accessing }
PyramidPaintGradiantStopModel >> color [

	^ color
]

{ #category : #accessing }
PyramidPaintGradiantStopModel >> color: anObject [

	color := anObject
]

{ #category : #accessing }
PyramidPaintGradiantStopModel >> next [

	^ next
]

{ #category : #accessing }
PyramidPaintGradiantStopModel >> next: aStop [

	next := aStop
]

{ #category : #accessing }
PyramidPaintGradiantStopModel >> number [

	^ number
]

{ #category : #accessing }
PyramidPaintGradiantStopModel >> number: anObject [

	number := anObject
]

{ #category : #accessing }
PyramidPaintGradiantStopModel >> size [

	self next ifNil: [ ^ 1 ] ifNotNil: [ ^ 1 + self next size ]
]
