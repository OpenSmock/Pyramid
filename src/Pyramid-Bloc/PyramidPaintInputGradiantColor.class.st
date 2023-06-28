Class {
	#name : #PyramidPaintInputGradiantColor,
	#superclass : #SpPresenter,
	#instVars : [
		'stopManager',
		'whenStopsChangedDo'
	],
	#category : #'Pyramid-Bloc-custom-specs-paint'
}

{ #category : #accessing }
PyramidPaintInputGradiantColor >> addNewColorAt: aStop [

	self stopManager addStopNextTo: aStop.
	self layout: self defaultLayout.
	self whenStopsChangedDo value
]

{ #category : #adding }
PyramidPaintInputGradiantColor >> addStop: aStop to: aLayout withPrevious: aPreviousStop [

	| inputColor inputNumber removeButton |
	inputColor := PyramidColorInputPresenter new
		              whenSubmitDo: [ :c |
			              self updateStopColor: aStop withColor: c ];
						  color: aStop color;
		              yourself.
	inputNumber := SpTextInputFieldPresenter new
		               text: aStop number asFloat printString;
		               yourself.

	(self stopManager first = aStop or: [ self stopManager last = aStop ])
		ifTrue: [
			inputNumber editable: false.
			aLayout add: (SpBoxLayout newHorizontal
					 spacing: 4;
					 add: inputNumber width: 96;
					 add: inputColor expand: true).
			 ] ifFalse: [ removeButton := SpButtonPresenter new
		                icon: (self iconNamed: #delete);
		                action: [ self removeNextStop: aPreviousStop ];
		                yourself.
	inputNumber whenSubmitDo: [ :text |
		self
			updateStopNumber: aStop
			withText: text
			withPrevious: aPreviousStop ].
	aLayout add: (SpBoxLayout newHorizontal
			 spacing: 4;
			 add: removeButton width: 24;
			 add: inputNumber width: 72;
			 add: inputColor expand: true) ]
	
]

{ #category : #adding }
PyramidPaintInputGradiantColor >> addStopButton: aStop to: aLayout [

	| button |
	button := SpButtonPresenter new
		          icon: (self iconNamed: #add);
		          action: [
			          self
				          addNewColorAt: aStop ];
		          yourself.
	aLayout add: button
]

{ #category : #accessing }
PyramidPaintInputGradiantColor >> asStopsArray [

	^ self stopManager asStopsArray
]

{ #category : #layout }
PyramidPaintInputGradiantColor >> defaultLayout [

	| defaultLayout stop previousStop |
	defaultLayout := SpBoxLayout newVertical
		                 spacing: 4;
		                 yourself.
	stop := self stopManager first.
	self addStop: stop to: defaultLayout withPrevious: nil.
	[ stop next isNotNil ] whileTrue: [
		previousStop := stop.
		stop := stop next.
		self addStopButton: previousStop to: defaultLayout.
		self addStop: stop to: defaultLayout withPrevious: previousStop ].
	^ defaultLayout
]

{ #category : #'as yet unclassified' }
PyramidPaintInputGradiantColor >> getNumberFrom: aString [

	| cleanString |
	cleanString := aString withoutPrefix: '0'.
	cleanString := cleanString withoutPrefix: '.'.
	(cleanString allSatisfy: [ :each | each isDigit ]) ifFalse: [ ^ -1 ].
	^ ('0.', cleanString) asNumber
]

{ #category : #removing }
PyramidPaintInputGradiantColor >> removeNextStop: aStop [


	self stopManager removeNextStop: aStop.
	self layout: self defaultLayout.
	self whenStopsChangedDo value
]

{ #category : #accessing }
PyramidPaintInputGradiantColor >> stopManager [

	stopManager ifNil: [ stopManager := PyramidPaintGradiantStopsManager new ].
	^ stopManager
]

{ #category : #accessing }
PyramidPaintInputGradiantColor >> stopManager: aStopManager [

	stopManager := aStopManager
]

{ #category : #'as yet unclassified' }
PyramidPaintInputGradiantColor >> stopsSize [

	^ self stopManager stopsSize
]

{ #category : #'as yet unclassified' }
PyramidPaintInputGradiantColor >> updateStopColor: aStop withColor: aColor [

	aStop color: aColor
]

{ #category : #'as yet unclassified' }
PyramidPaintInputGradiantColor >> updateStopNumber: aStop withText: aString withPrevious: aPreviousStop [

	| number |
	number := self getNumberFrom: aString.
	(number <= 0 or: [ number >= 1 ]) ifTrue: [
		self layout: self defaultLayout.
		^ self ].
	aStop number: number.
	self stopManager correctStopOrderOf: aStop withPrevious: aPreviousStop.
	self layout: self defaultLayout
]

{ #category : #accessing }
PyramidPaintInputGradiantColor >> whenStopsChangedDo [

	^ whenStopsChangedDo 
]

{ #category : #accessing }
PyramidPaintInputGradiantColor >> whenStopsChangedDo: aBlock [

	whenStopsChangedDo := aBlock
]
