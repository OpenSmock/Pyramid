Class {
	#name : #PyramidBackgroundGradiantStopsManager,
	#superclass : #Object,
	#instVars : [
		'first',
		'last'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #adding }
PyramidBackgroundGradiantStopsManager >> addStopNextTo: aPreviousStop [
self addStopNextTo: aPreviousStop withColor: aPreviousStop color

	
]

{ #category : #adding }
PyramidBackgroundGradiantStopsManager >> addStopNextTo: aPreviousStop withColor: aColor [

	| number |
	number := aPreviousStop number + aPreviousStop next number / 2..
	self
		addStopNextTo: aPreviousStop
		withColor: aColor
		withNumber: number
]

{ #category : #adding }
PyramidBackgroundGradiantStopsManager >> addStopNextTo: aPreviousStop withColor: aColor withNumber: aNumber [

	| stopToAdd |
	stopToAdd := PyramidBackgroundGradiantStopModel new
		             color: aColor;
		             number: aNumber;
		             yourself.
	stopToAdd next: aPreviousStop next.
	aPreviousStop next: stopToAdd.
]

{ #category : #'as yet unclassified' }
PyramidBackgroundGradiantStopsManager >> correctStopOrderOf: aStop withPrevious: aPreviousStop [

	| after before |
	aPreviousStop next: aStop next.
	before := self first.
	after := before next.
	[ after ~= self last and: [ aStop number > after number ] ]
		whileTrue: [
			before := after.
			after := after next ].
	aStop next: before next.
	before next: aStop
]

{ #category : #accessing }
PyramidBackgroundGradiantStopsManager >> first [

	^ first
]

{ #category : #initialization }
PyramidBackgroundGradiantStopsManager >> initialize [

	first := PyramidBackgroundGradiantStopModel new
		         color: Color white;
		         number: 0;
		         yourself.
	last := PyramidBackgroundGradiantStopModel new
		        color: Color black;
		        number: 1;
		        yourself.
	first next: last
]

{ #category : #accessing }
PyramidBackgroundGradiantStopsManager >> last [

	^ last
]
