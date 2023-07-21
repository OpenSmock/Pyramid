Class {
	#name : #NeoPyramidGradientPaintInputPresenter,
	#superclass : #NeoPyramidInputPresenter,
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
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #accessing }
NeoPyramidGradientPaintInputPresenter >> centerInput [

	^ centerInput
]

{ #category : #initialization }
NeoPyramidGradientPaintInputPresenter >> defaultLayout [

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
NeoPyramidGradientPaintInputPresenter >> endInput [

	^ endInput
]

{ #category : #initialization }
NeoPyramidGradientPaintInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :paint |  ].
	centerInput := PyramidPointInputPresenter new value: 0 @ 0; yourself.
	startInput := PyramidPointInputPresenter new value: 0 @ 0; yourself.
	endInput := PyramidPointInputPresenter new value: 1 @ 0; yourself.
	radiusInput := PyramidNumberInputPresenter new value: 50; yourself.
	stopsInput := NeoPyramidStopsInputPresenter new whenValueChangedDo: [
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
NeoPyramidGradientPaintInputPresenter >> linearButton [

	^ linearButton
]

{ #category : #accessing }
NeoPyramidGradientPaintInputPresenter >> radialButton [

	^ radialButton
]

{ #category : #accessing }
NeoPyramidGradientPaintInputPresenter >> radiusInput [
^ radiusInput
]

{ #category : #accessing }
NeoPyramidGradientPaintInputPresenter >> startInput [ 

^ startInput. 
]

{ #category : #accessing }
NeoPyramidGradientPaintInputPresenter >> stopsInput [

	^ stopsInput
]

{ #category : #initialization }
NeoPyramidGradientPaintInputPresenter >> value [

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
NeoPyramidGradientPaintInputPresenter >> value: aBlGradientPaint [

	| temp |
	temp := self whenValueChangedDo.
	self whenValueChangedDo: [ :something |  ].
	aBlGradientPaint selectOnGradientPaintInput: self.
	self whenValueChangedDo: temp
]

{ #category : #accessing }
NeoPyramidGradientPaintInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
NeoPyramidGradientPaintInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
