Class {
	#name : #PyramidBackgroundGradiantStopModel,
	#superclass : #Object,
	#instVars : [
		'number',
		'color',
		'next'
	],
	#category : #'Pyramid-plugin-properties-custom'
}

{ #category : #'as yet unclassified' }
PyramidBackgroundGradiantStopModel >> collectOn: aCollection [

	aCollection add: self number -> self color.
	self next ifNotNil: [ self next collectOn: aCollection ].
	
]

{ #category : #accessing }
PyramidBackgroundGradiantStopModel >> color [

	^ color
]

{ #category : #accessing }
PyramidBackgroundGradiantStopModel >> color: anObject [

	color := anObject
]

{ #category : #accessing }
PyramidBackgroundGradiantStopModel >> next [

	^ next
]

{ #category : #accessing }
PyramidBackgroundGradiantStopModel >> next: aStop [

	next := aStop
]

{ #category : #accessing }
PyramidBackgroundGradiantStopModel >> number [

	^ number
]

{ #category : #accessing }
PyramidBackgroundGradiantStopModel >> number: anObject [

	number := anObject
]

{ #category : #accessing }
PyramidBackgroundGradiantStopModel >> size [

	self next ifNil: [ ^ 1 ] ifNotNil: [ ^ 1 + self next size ]
]
