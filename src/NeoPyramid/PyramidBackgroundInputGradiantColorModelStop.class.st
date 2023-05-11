Class {
	#name : #PyramidBackgroundInputGradiantColorModelStop,
	#superclass : #Object,
	#instVars : [
		'number',
		'color',
		'next'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundInputGradiantColorModelStop >> color [

	^ color
]

{ #category : #accessing }
PyramidBackgroundInputGradiantColorModelStop >> color: anObject [

	color := anObject
]

{ #category : #accessing }
PyramidBackgroundInputGradiantColorModelStop >> last [

	| model |
	model := self.
	[ model next isNotNil ] whileTrue: [ model := model next ].
^ model
]

{ #category : #accessing }
PyramidBackgroundInputGradiantColorModelStop >> next [

	^ next
]

{ #category : #accessing }
PyramidBackgroundInputGradiantColorModelStop >> next: aStop [

	next := aStop
]

{ #category : #accessing }
PyramidBackgroundInputGradiantColorModelStop >> number [

	^ number
]

{ #category : #accessing }
PyramidBackgroundInputGradiantColorModelStop >> number: anObject [

	number := anObject
]
