Class {
	#name : #PyramidBackgroundInputGradiant,
	#superclass : #PyramidBackgroundAbstractPaintInput,
	#instVars : [
		'modeSelector',
		'stopsColor'
	],
	#category : #'Pyramid-Bloc-custom-specs-background'
}

{ #category : #layout }
PyramidBackgroundInputGradiant >> defaultLayout [

	| defaultLayout |
	defaultLayout := SpBoxLayout newVertical
		                 spacing: 4;
		                 add: self modeSelector expand: false;
		                 yourself.
	self stopsColor stopsSize < self maximumStopsBeforeScroll
		ifTrue: [
			defaultLayout add: self stopsColor expand: false.
			defaultLayout add: SpNullPresenter new expand: true ]
		ifFalse: [
			defaultLayout
				add: (SpScrollableLayout new
						 child: self stopsColor;
						 yourself)
				height: self maximumHeight ].
	^ defaultLayout
]

{ #category : #'initialization - deprecated' }
PyramidBackgroundInputGradiant >> initializePresenters [

	modeSelector := PyramidBackgroundInputGradiantMode new.
	stopsColor := PyramidBackgroundInputGradiantColor new
		              whenStopsChangedDo: [ self updateLayout. self whenSubmitDo value: self paint ];
		              yourself
]

{ #category : #accessing }
PyramidBackgroundInputGradiant >> maximumHeight [

	^ 250
]

{ #category : #accessing }
PyramidBackgroundInputGradiant >> maximumStopsBeforeScroll [

	^ 6
]

{ #category : #accessing }
PyramidBackgroundInputGradiant >> modeSelector [
^ modeSelector
]

{ #category : #accessing }
PyramidBackgroundInputGradiant >> paint [

	| stopsArray |
	stopsArray := self stopsColor asStopsArray.
	^ self modeSelector makePaintWithStops: stopsArray
]

{ #category : #accessing }
PyramidBackgroundInputGradiant >> stopsColor [

	^ stopsColor
]

{ #category : #private }
PyramidBackgroundInputGradiant >> updateLayout [

	self layout: self defaultLayout
]
