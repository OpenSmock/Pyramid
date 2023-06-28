Class {
	#name : #PyramidPaintGradiantStopsManager,
	#superclass : #Object,
	#instVars : [
		'first',
		'last'
	],
	#category : #'Pyramid-Bloc-custom-specs-paint'
}

{ #category : #adding }
PyramidPaintGradiantStopsManager >> addStopNextTo: aPreviousStop [
self addStopNextTo: aPreviousStop withColor: aPreviousStop color

	
]

{ #category : #adding }
PyramidPaintGradiantStopsManager >> addStopNextTo: aPreviousStop withColor: aColor [

	| number |
	number := aPreviousStop number + aPreviousStop next number / 2..
	self
		addStopNextTo: aPreviousStop
		withColor: aColor
		withNumber: number
]

{ #category : #adding }
PyramidPaintGradiantStopsManager >> addStopNextTo: aPreviousStop withColor: aColor withNumber: aNumber [

	| stopToAdd |
	stopToAdd := PyramidPaintGradiantStopModel new
		             color: aColor;
		             number: aNumber;
		             yourself.
	stopToAdd next: aPreviousStop next.
	aPreviousStop next: stopToAdd.
]

{ #category : #converting }
PyramidPaintGradiantStopsManager >> asStopsArray [

	| collection |
	collection := OrderedCollection new.
	self first collectOn: collection.
	^ collection asArray
]

{ #category : #'as yet unclassified' }
PyramidPaintGradiantStopsManager >> correctStopOrderOf: aStop withPrevious: aPreviousStop [

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
PyramidPaintGradiantStopsManager >> first [

	^ first
]

{ #category : #'instance creation' }
PyramidPaintGradiantStopsManager >> first: aNewFirst last: aNewLast [

	first := aNewFirst.
	last := aNewLast
]

{ #category : #'instance creation' }
PyramidPaintGradiantStopsManager >> from: aCollection [

	| firstToAdd lastToAdd current |
	firstToAdd := nil.
	lastToAdd := nil.
	aCollection do: [ :each |
		current := PyramidPaintGradiantStopModel new
			           number: each key;
			           color: each value;
			           yourself.
		firstToAdd ifNil: [ firstToAdd := current ].
		lastToAdd ifNotNil: [ lastToAdd next: current ].
		lastToAdd := current ].
	self first: firstToAdd last: lastToAdd
]

{ #category : #initialization }
PyramidPaintGradiantStopsManager >> initialize [

	first := PyramidPaintGradiantStopModel new
		         color: Color white;
		         number: 0;
		         yourself.
	last := PyramidPaintGradiantStopModel new
		        color: Color black;
		        number: 1;
		        yourself.
	first next: last
]

{ #category : #accessing }
PyramidPaintGradiantStopsManager >> last [

	^ last
]

{ #category : #removing }
PyramidPaintGradiantStopsManager >> removeNextStop: aStop [

aStop next: aStop next next.
]

{ #category : #'as yet unclassified' }
PyramidPaintGradiantStopsManager >> stopsSize [

	^ self first size
]
