Class {
	#name : #PyramidBackgroundPropertyInput,
	#superclass : #SpPresenter,
	#instVars : [
		'submitBlock',
		'preview',
		'button',
		'strategy'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #'api - text style' }
PyramidBackgroundPropertyInput >> background [

	self strategy background
]

{ #category : #'api - text style' }
PyramidBackgroundPropertyInput >> background: aBlBackground [

	self strategy: aBlBackground pyramidBackgroundStrategy
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> button [

	^ button
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> button: anObject [

	button := anObject
]

{ #category : #layout }
PyramidBackgroundPropertyInput >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self preview expand: true;
		  add: self button withConstraints: [ :c | c width: 24. c height: 24 ];
		  yourself
]

{ #category : #initialization }
PyramidBackgroundPropertyInput >> initializePresenters [

	preview := self strategy preview.
	button := self strategy button.
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> preview [

	^ preview
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> preview: anObject [

	preview := anObject
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> strategy [

	strategy ifNil: [
		strategy := PyramidBackgroundPropertyInputUnknownStrategy new ].
	^ strategy
]

{ #category : #'api - text style' }
PyramidBackgroundPropertyInput >> strategy: aStrategy [

	strategy := aStrategy.
	self layout replace: self button with: aStrategy button.
	self layout replace: self preview with: aStrategy preview.
	self button: aStrategy button.
	self preview: aStrategy preview
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> submitBlock [

	^ submitBlock
]

{ #category : #enumerating }
PyramidBackgroundPropertyInput >> whenSubmitDo: aBlock [

	submitBlock := aBlock
]
