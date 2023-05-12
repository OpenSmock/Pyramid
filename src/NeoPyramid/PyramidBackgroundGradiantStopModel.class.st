Class {
	#name : #PyramidBackgroundGradiantStopModel,
	#superclass : #Object,
	#instVars : [
		'number',
		'color',
		'next'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

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
