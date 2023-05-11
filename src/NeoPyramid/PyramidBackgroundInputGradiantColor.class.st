Class {
	#name : #PyramidBackgroundInputGradiantColor,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'startColor',
		'endColor'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundInputGradiantColor >> addNewColorAt: aStop [

	| stopToAdd number |
	number := aStop number + aStop next number / 2.
	stopToAdd := PyramidBackgroundInputGradiantColorModelStop new
		             color: Color white;
		             number: number;
		             yourself.
	stopToAdd next: aStop next.
	aStop next: stopToAdd.
	self layout: self defaultLayout
]

{ #category : #adding }
PyramidBackgroundInputGradiantColor >> addStop: aStop to: aLayout [

	| inputColor inputNumber removeButton |
	inputColor := PyramidBackgroundInputSolidColor new
		              color: aStop color;
		              yourself.
	inputNumber := SpTextInputFieldPresenter new
		               text: aStop number asFloat printString;
		               yourself.
	removeButton := SpButtonPresenter new
		                icon: (self iconNamed: #delete);
		                yourself.
	aLayout add: (SpBoxLayout newHorizontal
			 spacing: 4;
			 add: inputNumber width: 50;
			 add: inputColor expand: true;
			 add: removeButton width: 24)
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

{ #category : #layout }
PyramidBackgroundInputGradiantColor >> defaultLayout [

	| defaultLayout stop previousStop |
	defaultLayout := SpBoxLayout newVertical
		                 spacing: 4;
		                 yourself.
	stop := self model.
	self addStop: stop to: defaultLayout.
	[ stop next isNotNil ] whileTrue: [
		previousStop := stop.
		stop := stop next.
		self addStopButton: previousStop to: defaultLayout.
		self addStop: stop to: defaultLayout ].
	^ defaultLayout
]

{ #category : #accessing }
PyramidBackgroundInputGradiantColor >> endColor [

	^ endColor
]

{ #category : #initialization }
PyramidBackgroundInputGradiantColor >> initializePresenters [

	startColor := PyramidBackgroundInputSolidColor new color: self model color.
	endColor := PyramidBackgroundInputSolidColor new color:
		            self model last color
]

{ #category : #accessing }
PyramidBackgroundInputGradiantColor >> model [

	model ifNil: [ model := PyramidBackgroundInputGradiantColorModelStop new color: Color white; number: 0; next: (PyramidBackgroundInputGradiantColorModelStop new color: Color black; number: 1; yourself); yourself ].
	^ model
]

{ #category : #accessing }
PyramidBackgroundInputGradiantColor >> model: anObject [

	model := anObject
]

{ #category : #accessing }
PyramidBackgroundInputGradiantColor >> startColor [

	^ startColor
]
