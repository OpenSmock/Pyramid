Class {
	#name : #PyramidGradientPaintInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'stopsInput',
		'radialButton',
		'linearButton',
		'whenValueChangedDo',
		'startInput',
		'radiusInput',
		'centerInput',
		'endInput'
	],
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #accessing }
PyramidGradientPaintInputPresenter >> centerInput [

	^ centerInput
]

{ #category : #initialization }
PyramidGradientPaintInputPresenter >> defaultLayout [

	| labelSize |
	labelSize := 50.

	^ SpBoxLayout newVertical
		  spacing: 0;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: (SpBoxLayout newVertical
						    spacing: 8;
						    add: self linearButton height: 24;
						    add: (SpBoxLayout newHorizontal
								     spacing: 4;
								     vAlignCenter;
								     add: '  start' width: labelSize;
								     add: self startInput;
								     yourself)
						    height: 24;
						    add: (SpBoxLayout newHorizontal
								     spacing: 4;
								     vAlignCenter;
								     add: '  end' width: labelSize;
								     add: self endInput;
								     yourself)
						    height: 24;
						    yourself);
				   add: (SpBoxLayout newVertical
						    spacing: 8;
						    add: self radialButton height: 24;
						    add: (SpBoxLayout newHorizontal
								     spacing: 4;
								     vAlignCenter;
								     add: '  center' width: labelSize;
								     add: self centerInput;
								     yourself)
						    height: 24;
						    add: (SpBoxLayout newHorizontal
								     spacing: 4;
								     vAlignCenter;
								     add: '  radius' width: labelSize;
								     add: self radiusInput;
								     yourself)
						    height: 24;
						    add: SpNullPresenter new height: 24;
						    yourself);
				   yourself)
		  expand: false;
		  add: self stopsInput;
		  "height: 250"yourself
]

{ #category : #accessing }
PyramidGradientPaintInputPresenter >> endInput [

	^ endInput
]

{ #category : #initialization }
PyramidGradientPaintInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :paint |  ].
	centerInput := PyramidPointInputPresenter new value: 0 @ 0; yourself.
	startInput := PyramidPointInputPresenter new value: 0 @ 0; yourself.
	endInput := PyramidPointInputPresenter new value: 1 @ 0; yourself.
	radiusInput := PyramidNumberInputPresenter new value: 50; yourself.
	stopsInput := PyramidStopsInputPresenter new whenValueChangedDo: [
		              :stops | self whenValueChangedDo value: self value ].
	radialButton := SpRadioButtonPresenter new
		                label: 'Radial';
		                whenActivatedDo: [
			                self whenValueChangedDo value: self value ];
		                yourself.
	linearButton := SpRadioButtonPresenter new
		                label: 'Linear';
		                whenActivatedDo: [
			                self whenValueChangedDo value: self value ];
		                yourself.
	linearButton associatedRadioButtons: { radialButton }
]

{ #category : #accessing }
PyramidGradientPaintInputPresenter >> linearButton [

	^ linearButton
]

{ #category : #accessing }
PyramidGradientPaintInputPresenter >> radialButton [

	^ radialButton
]

{ #category : #accessing }
PyramidGradientPaintInputPresenter >> radiusInput [
^ radiusInput
]

{ #category : #accessing }
PyramidGradientPaintInputPresenter >> startInput [ 

^ startInput. 
]

{ #category : #accessing }
PyramidGradientPaintInputPresenter >> stopsInput [

	^ stopsInput
]

{ #category : #initialization }
PyramidGradientPaintInputPresenter >> value [

	self linearButton state ifTrue: [
		^ BlLinearGradientPaint new
			  start: self startInput value;
			  end: self endInput value;
			  stops: self stopsInput value;
			  yourself ].
	^ BlRadialGradientPaint new
		  center: self centerInput value;
		  radius: self radiusInput value;
		  stops: self stopsInput value;
		  yourself
]

{ #category : #initialization }
PyramidGradientPaintInputPresenter >> value: aBlGradientPaint [

	| temp |
	temp := self whenValueChangedDo.
	self whenValueChangedDo: [ :something |  ].
	aBlGradientPaint selectOnGradientPaintInput: self.
	self whenValueChangedDo: temp
]

{ #category : #accessing }
PyramidGradientPaintInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidGradientPaintInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
