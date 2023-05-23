Class {
	#name : #PyramidBackgroundInputGradiantColor,
	#superclass : #SpPresenter,
	#instVars : [
		'stopManager',
		'whenStopsChangedDo'
	],
	#category : #'Pyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundInputGradiantColor >> addNewColorAt: aStop [

	self stopManager addStopNextTo: aStop.
	self layout: self defaultLayout.
	self whenStopsChangedDo value
]

{ #category : #adding }
PyramidBackgroundInputGradiantColor >> addStop: aStop to: aLayout withPrevious: aPreviousStop [

	| inputColor inputNumber removeButton |
	inputColor := PyramidBackgroundInputSolidColor new
		              color: aStop color;
		              whenSubmitDo: [ :c |
			              self updateStopColor: aStop withColor: c ];
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
PyramidBackgroundInputGradiantColor >> addStopButton: aStop to: aLayout [

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
PyramidBackgroundInputGradiantColor >> asStopsArray [

	^ self stopManager asStopsArray
]

{ #category : #layout }
PyramidBackgroundInputGradiantColor >> defaultLayout [

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
PyramidBackgroundInputGradiantColor >> getNumberFrom: aString [

	| cleanString |
	cleanString := aString withoutPrefix: '0'.
	cleanString := cleanString withoutPrefix: '.'.
	(cleanString allSatisfy: [ :each | each isDigit ]) ifFalse: [ ^ -1 ].
	^ ('0.', cleanString) asNumber
]

{ #category : #removing }
PyramidBackgroundInputGradiantColor >> removeNextStop: aStop [


	self stopManager removeNextStop: aStop.
	self layout: self defaultLayout.
	self whenStopsChangedDo value
]

{ #category : #accessing }
PyramidBackgroundInputGradiantColor >> stopManager [

	stopManager ifNil: [ stopManager := PyramidBackgroundGradiantStopsManager new ].
	^ stopManager
]

{ #category : #accessing }
PyramidBackgroundInputGradiantColor >> stopManager: aStopManager [

	stopManager := aStopManager
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputGradiantColor >> stopsSize [

	^ self stopManager stopsSize
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputGradiantColor >> updateStopColor: aStop withColor: aColor [

	aStop color: aColor
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputGradiantColor >> updateStopNumber: aStop withText: aString withPrevious: aPreviousStop [

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
PyramidBackgroundInputGradiantColor >> whenStopsChangedDo [

	^ whenStopsChangedDo 
]

{ #category : #accessing }
PyramidBackgroundInputGradiantColor >> whenStopsChangedDo: aBlock [

	whenStopsChangedDo := aBlock
]
