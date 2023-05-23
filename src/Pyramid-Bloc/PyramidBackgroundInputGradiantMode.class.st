Class {
	#name : #PyramidBackgroundInputGradiantMode,
	#superclass : #SpPresenter,
	#instVars : [
		'buttonRadial',
		'buttonLinear',
		'linearDirection',
		'radialPosition',
		'radialRadius'
	],
	#category : #'Pyramid-Bloc-custom-specs'
}

{ #category : #accessing }
PyramidBackgroundInputGradiantMode >> buttonLinear [
^ buttonLinear
]

{ #category : #accessing }
PyramidBackgroundInputGradiantMode >> buttonRadial [

	^ buttonRadial
]

{ #category : #private }
PyramidBackgroundInputGradiantMode >> defaultLayout [

	^ self defaultLayoutLinear
]

{ #category : #private }
PyramidBackgroundInputGradiantMode >> defaultLayoutLinear [

	^ self defaultLayoutSelection
		  add: (SpBoxLayout newHorizontal
				   add: 'Direction' width: 72;
				   add: self linearDirection;
				   yourself) height: 26;
		  add: SpNullPresenter new height: 26;
		  yourself
]

{ #category : #private }
PyramidBackgroundInputGradiantMode >> defaultLayoutRadial [

	^ self defaultLayoutSelection
		  add: (SpBoxLayout newHorizontal
				   add: 'Position' width: 72;
				   add: self radialPosition;
				   yourself) height: 26;
		  add: (SpBoxLayout newHorizontal
				   add: 'Radius' width: 72;
				   add: self radialRadius;
				   yourself) height: 26;
		  yourself
]

{ #category : #private }
PyramidBackgroundInputGradiantMode >> defaultLayoutSelection [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpBoxLayout newHorizontal
				   add: self buttonLinear;
				   add: self buttonRadial;
				   yourself);
		  yourself
]

{ #category : #'initialization - deprecated' }
PyramidBackgroundInputGradiantMode >> initializePresenter [

	buttonRadial := SpRadioButtonPresenter new
		                label: 'Radial';
		                yourself.
	buttonLinear := SpRadioButtonPresenter new
		                label: 'Linear';
		                yourself.
	buttonLinear associatedRadioButtons: { buttonRadial }.
	buttonLinear whenActivatedDo: [ self updateLayout ].
	buttonLinear whenDeactivatedDo: [ self updateLayout ].

	radialRadius := PyramidNumberPresenter new.
	linearDirection := PyramidPointPresenter new.
	radialPosition := PyramidPointPresenter new
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputGradiantMode >> linearDirection [

	^ linearDirection
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputGradiantMode >> makeLinearPaintWithStops: anArray [

	^ BlLinearGradientPaint new
		  stops: anArray;
		  start: 0 @ 0;
		  end: self linearDirection point;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputGradiantMode >> makePaintWithStops: aStopsArray [

	self buttonLinear state
		ifTrue: [ ^ self makeLinearPaintWithStops: aStopsArray ]
		ifFalse: [ ^ self makeRadialPaintWithStops: aStopsArray ]
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputGradiantMode >> makeRadialPaintWithStops: anArray [

	^ (BlRadialGradientPaint new
			           stops: anArray;
			           center: self radialPosition point;
			           radius: self radialRadius number;
			           yourself)
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputGradiantMode >> radialPosition [

	^ radialPosition
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputGradiantMode >> radialRadius [

	^ radialRadius
]

{ #category : #private }
PyramidBackgroundInputGradiantMode >> updateLayout [
	self buttonLinear state ifTrue: [ self layout: self defaultLayoutLinear ] ifFalse: [ self layout: self defaultLayoutRadial ]
]
