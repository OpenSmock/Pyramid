Class {
	#name : #NeoPyramidGradientPaintInputPresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'stopsInput',
		'radialButton',
		'linearButton',
		'whenValueChangedDo'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #initialization }
NeoPyramidGradientPaintInputPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: self radialButton;
				   add: self linearButton;
				   yourself)
		  height: 24;
		  add: self stopsInput height: 250;
		  yourself
]

{ #category : #initialization }
NeoPyramidGradientPaintInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :paint |  ].
	stopsInput := NeoPyramidStopsInputPresenter new whenValueChangedDo: [ :stops | self whenValueChangedDo value: self value].
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
NeoPyramidGradientPaintInputPresenter >> stopsInput [

	^ stopsInput
]

{ #category : #initialization }
NeoPyramidGradientPaintInputPresenter >> value [

	self linearButton state ifTrue: [ ^BlLinearGradientPaint horizontal stops: self stopsInput value ].
	^BlRadialGradientPaint new center: 0@0; radius: 100; stops: self stopsInput value
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
