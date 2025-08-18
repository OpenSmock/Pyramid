"
This slider is used by PyramidSpaceZoomPlugin.
"
Class {
	#name : #PyramidZoomSlider,
	#superclass : #PyramidSpaceZoomPlugin,
	#instVars : [
		'sliderContainer',
		'lineSlider',
		'blocToMove',
		'moveEvent',
		'scaleValue',
		'currentBlocSliderTranslation',
		'blockAction',
		'sliderLap',
		'sliderDefaultValue',
		'lineSliderWidth',
		'sliderWidth',
		'dragSlider',
		'sliderPaddingWidth',
		'sliderMinimumValue',
		'blTextScaleValue',
		'blTextScaleValueContainer'
	],
	#category : #'Pyramid-Bloc-plugin-space-zoom-move'
}

{ #category : #accessing }
PyramidZoomSlider >> blTextScaleValue: aScaleValue [

	blTextScaleValue text: ((aScaleValue*100) rounded asString , '%') asRopedText.
]

{ #category : #accessing }
PyramidZoomSlider >> blocToMoveZoomPosition: aScaleValue [

	| value | 
	value := ((aScaleValue -1) * 100.0).
	
	blocToMove transformDo: [ :t | t translateBy: value@0 ].
	self blTextScaleValue: aScaleValue.
]

{ #category : #helpers }
PyramidZoomSlider >> createSlider [ 
	
	^ self refreshSlider
]

{ #category : #accessing }
PyramidZoomSlider >> currentBlocSliderTranslation [

	^ currentBlocSliderTranslation
]

{ #category : #accessing }
PyramidZoomSlider >> currentBlocSliderTranslation: aPosition [

	currentBlocSliderTranslation := aPosition 
]

{ #category : #accessing }
PyramidZoomSlider >> dragSlider [
	
	^ dragSlider
]

{ #category : #accessing }
PyramidZoomSlider >> dragSlider: aBoolean [

	dragSlider := aBoolean
]

{ #category : #initialization }
PyramidZoomSlider >> initialize [

	self dragSlider: false.

	sliderWidth := 250.
	sliderDefaultValue := 100.
	sliderMinimumValue := 10.
	sliderPaddingWidth := 40.
	sliderLap := 10.

	blTextScaleValueContainer := BlElement new layout: BlFrameLayout new.
	blTextScaleValue := BlTextElement new.
	blTextScaleValue constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].
	blTextScaleValue text: (sliderDefaultValue rounded asString , '%') asRopedText.
	
	blTextScaleValueContainer addChild: blTextScaleValue.
]

{ #category : #accessing }
PyramidZoomSlider >> maxBlocMoveSliderLength [

	^ ((lineSliderWidth + (sliderPaddingWidth/2) ) - blocToMove position x / sliderLap) rounded * sliderLap @ 0
]

{ #category : #accessing }
PyramidZoomSlider >> minBlocMoveSliderLength [

	^ (((sliderPaddingWidth/2) - blocToMove position x) / sliderLap) rounded * sliderLap @ 0
]

{ #category : #'as yet unclassified' }
PyramidZoomSlider >> moveBlocSliderEvent [

	^ BlEventHandler
		  on: BlMouseMoveEvent
		  do: [ :evt |
			  self dragSlider: true.
			  evt primaryButtonPressed ifFalse: [
				  sliderContainer removeEventHandler: moveEvent.
				  self dragSlider: false ].

			  self currentBlocSliderTranslation:
				  (evt position x - sliderContainer position x
				   - (blocToMove position x + (blocToMove extent x/2)) / sliderLap) rounded * sliderLap @ 0.
			  blocToMove transformDo: [ :t | "Intervalle si inférieur à la taille max du slider (ligne) 
														et si supérieur à la taille minimum
				  Interval if less than slider max size (line) and if greater than minimum size"
				  self currentBlocSliderTranslation x < (lineSliderWidth - sliderDefaultValue + 1)
					  ifTrue: [
						  self currentBlocSliderTranslation x > ((sliderDefaultValue - sliderMinimumValue + 1) * -1)
							  ifTrue: [
								  t translateBy: self currentBlocSliderTranslation.
								  scaleValue := 1 + (self currentBlocSliderTranslation x / 100.0).
								  scaleValue < 0.1 ifTrue: [ scaleValue := self sliderMinScale ] ]
							  ifFalse: [
								  t translateBy: self minBlocMoveSliderLength.
								  scaleValue := self sliderMinScale ] ]
					  ifFalse: [
						  t translateBy: self maxBlocMoveSliderLength.
						  scaleValue := self sliderMaxScale ].
				  blockAction value: scaleValue.
				  blTextScaleValue text: ((scaleValue *100)rounded asString, '%') asRopedText. ].
			  evt consumed: true ]
]

{ #category : #'as yet unclassified' }
PyramidZoomSlider >> pourcentTextElement: aPositionX text: aValueOfText [

	^ (BlTextElement new
					 text:
						 (aValueOfText asString , '%')
							 asRopedText;
					 position: aPositionX * sliderLap + (sliderPaddingWidth / 4) @ 20)
]

{ #category : #'as yet unclassified' }
PyramidZoomSlider >> refreshSlider [

	| sliderContainerWidth nbLap cornerRadius nbLapUnderDefaultValue scaleValueForText |
	nbLapUnderDefaultValue := sliderDefaultValue - sliderMinimumValue / 10.
	lineSliderWidth := sliderWidth - sliderMinimumValue.
	sliderContainerWidth := sliderWidth + sliderPaddingWidth - sliderMinimumValue + 62.
	scaleValueForText := sliderMinimumValue.

	sliderContainer := BlElement new.
	sliderContainer
		id: 'zoomSlider';
		background: Color white;
		extent: sliderContainerWidth @ 35;
		position: 0 @ 0;
		zIndex: 1001.
	sliderContainer constraintsDo: [ :c |
		c frame horizontal alignLeft.
		c frame vertical alignBottom ].

	lineSlider := BlElement new.
	lineSlider
		extent: lineSliderWidth @ 2;
		position: sliderPaddingWidth / 2 @ 9;
		background: Color black.
		
	nbLap := lineSliderWidth / sliderLap.
	
	0 to: nbLap do: [ :i |
		| e |
		e := BlElement new.
		e
			background: Color gray;
			extent: 1 @ 10;
			position: i * sliderLap + (sliderPaddingWidth / 2) @ 5.
			
		i = 0
		ifTrue: [ sliderContainer addChild: (self pourcentTextElement: i text: (scaleValueForText)rounded).
			e
				background: Color blue;
				extent: 2 @ 10. ].
			
		scaleValueForText = 100 
		ifTrue: [ 
			sliderContainer addChild: (self pourcentTextElement: i text: (scaleValueForText)rounded).
			e
				background: Color blue;
				extent: 2 @ 10 ]
		ifFalse: [  
			(scaleValueForText / 50) isInteger ifTrue: [
				sliderContainer addChild: (self pourcentTextElement: i text: (scaleValueForText)rounded).
				e
					background: Color blue;
					extent: 2 @ 10 ] ].
		scaleValueForText := scaleValueForText + sliderLap.
		
		sliderContainer addChild: e ].

	cornerRadius := BlRoundedRectangleGeometry cornerRadii:
		                (BlCornerRadii new
			                 topLeft: 4;
			                 topRight: 4;
			                 bottomRight: 4;
			                 bottomLeft: 4).

	blocToMove := BlElement new.
	blocToMove
		background: Color red;
		geometry: cornerRadius;
		extent: 6 @ 15;
		position:
			sliderPaddingWidth / 2 + sliderDefaultValue - sliderMinimumValue
			- 3 @ 2.

	sliderContainer addEventHandler: (BlEventHandler
			 on: BlPrimaryMouseDownEvent
			 do: [ :evt |
				 self dragSlider ifFalse: [
					 moveEvent := self moveBlocSliderEvent.
					 sliderContainer addEventHandler: moveEvent ] ]).
			
	blTextScaleValueContainer position: (sliderContainerWidth - 57)@7.5.
	blTextScaleValueContainer extent: 50@20.
	blTextScaleValueContainer border: (BlBorder paint: Color black).

	sliderContainer addChild: lineSlider.
	sliderContainer addChild: blocToMove.
	sliderContainer addChild: blTextScaleValueContainer.

	^ sliderContainer
]

{ #category : #'as yet unclassified' }
PyramidZoomSlider >> scaledZoomValue: aScale [

	sliderWidth := (aScale*100)
]

{ #category : #accessing }
PyramidZoomSlider >> sliderLapScale [

	^ (sliderLap/100.0)
]

{ #category : #accessing }
PyramidZoomSlider >> sliderLapScale: aScaleValue [

	sliderLap := (aScaleValue*100)rounded.
]

{ #category : #'as yet unclassified' }
PyramidZoomSlider >> sliderMaxScale [

	^ (sliderWidth/100)
]

{ #category : #'as yet unclassified' }
PyramidZoomSlider >> sliderMinScale [
	"if the value is under 0.101 an display problem occured and the blue border of the workplace visually disapear"

	sliderMinimumValue <= 10 ifTrue: [ ^ 0.101 ].
	^ (sliderMinimumValue / 100)
]

{ #category : #accessing }
PyramidZoomSlider >> sliderMinimumValue [

	^ sliderMinimumValue
]

{ #category : #accessing }
PyramidZoomSlider >> sliderMinimumValue: aScaleValue [

	sliderMinimumValue := (aScaleValue*100)rounded
]

{ #category : #enumerating }
PyramidZoomSlider >> whenValueChangedDo: aBlock [

	blockAction := aBlock
]
