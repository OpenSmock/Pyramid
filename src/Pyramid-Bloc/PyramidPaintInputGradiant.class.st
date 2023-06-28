Class {
	#name : #PyramidPaintInputGradiant,
	#superclass : #SpPresenter,
	#instVars : [
		'modeSelector',
		'stopsColor',
		'whenSubmitDo'
	],
	#category : #'Pyramid-Bloc-custom-specs-paint'
}

{ #category : #layout }
PyramidPaintInputGradiant >> defaultLayout [

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
PyramidPaintInputGradiant >> initializePresenters [

	modeSelector := PyramidPaintInputGradiantMode new.
	stopsColor := PyramidPaintInputGradiantColor new
		              whenStopsChangedDo: [ self updateLayout. self whenSubmitDo value: self paint ];
		              yourself
]

{ #category : #accessing }
PyramidPaintInputGradiant >> maximumHeight [

	^ 250
]

{ #category : #accessing }
PyramidPaintInputGradiant >> maximumStopsBeforeScroll [

	^ 6
]

{ #category : #accessing }
PyramidPaintInputGradiant >> modeSelector [
^ modeSelector
]

{ #category : #accessing }
PyramidPaintInputGradiant >> paint [

	| stopsArray |
	stopsArray := self stopsColor asStopsArray.
	^ self modeSelector makePaintWithStops: stopsArray
]

{ #category : #accessing }
PyramidPaintInputGradiant >> stopsColor [

	^ stopsColor
]

{ #category : #private }
PyramidPaintInputGradiant >> updateLayout [

	self layout: self defaultLayout
]

{ #category : #accessing }
PyramidPaintInputGradiant >> whenSubmitDo [

	^ whenSubmitDo
]

{ #category : #accessing }
PyramidPaintInputGradiant >> whenSubmitDo: aBlock [

	whenSubmitDo := aBlock
]
