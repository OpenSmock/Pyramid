Class {
	#name : #PyramidBackgroundColorPreview,
	#superclass : #PyramidBackgroundPresenterElement,
	#instVars : [
		'morphPresenter',
		'morphLeft',
		'morphRight'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundColorPreview >> backgroundMorph [

	| morph littleOne littleOneExtent position isPrimaryColor |
	morph := Morph new
		         extent: self width @ self height;
		         yourself.
	littleOneExtent := self width / self numberOfSquares
	                   @ (self height / self numberOfSquares).
	position := 0 @ 0.
	isPrimaryColor := true.
	self numberOfSquares squared timesRepeat: [
		littleOne := Morph new
			             extent: littleOneExtent;
			             color: Color random;
			             position:
				             position x * littleOneExtent x
				             @ (position y * littleOneExtent y);
			             yourself.
		isPrimaryColor
			ifTrue: [ littleOne color: self backgroundPrimary ]
			ifFalse: [ littleOne color: self backgroundSecond ].
		morph addMorph: littleOne.
		position x + 1 < self numberOfSquares
			            ifTrue: [ position := position x + 1 @ position y ]
			            ifFalse: [
				            position := 0 @ (position y + 1).
				            self numberOfSquares even ifTrue: [
					            isPrimaryColor := isPrimaryColor not ] ].
		isPrimaryColor := isPrimaryColor not ].
	^ morph
]

{ #category : #accessing }
PyramidBackgroundColorPreview >> backgroundPrimary [

	^ Color white adjustBrightness: -0.15
]

{ #category : #accessing }
PyramidBackgroundColorPreview >> backgroundSecond [

	^ Color black adjustBrightness: 0.15
]

{ #category : #accessing }
PyramidBackgroundColorPreview >> color: aColor [

	self leftColor: aColor.
	self rightColor: aColor
]

{ #category : #layout }
PyramidBackgroundColorPreview >> defaultLayout [ 

	^ SpBoxLayout newVertical add: self morphPresenter; yourself
]

{ #category : #accessing }
PyramidBackgroundColorPreview >> height [

	^ 240
]

{ #category : #initialization }
PyramidBackgroundColorPreview >> initializePresenters [

	| morphBack halfWidth morphExtent |
	halfWidth := self width / 2.
	morphExtent := halfWidth @ self height.
	morphLeft := Morph new
		             extent: morphExtent;
						color: Color transparent;
		             yourself.
	morphRight := Morph new
		              extent: morphExtent;
		              position: halfWidth @ 0;
		color: Color transparent;
		              yourself.

	morphBack := self backgroundMorph.
	morphBack addMorph: morphLeft.
	morphBack addMorph: morphRight.

	morphPresenter := SpMorphPresenter new
		                  morph: morphBack;
		                  yourself
]

{ #category : #accessing }
PyramidBackgroundColorPreview >> leftColor: aColor [

	self morphLeft color: aColor
]

{ #category : #accessing }
PyramidBackgroundColorPreview >> morphLeft [

	^ morphLeft
]

{ #category : #accessing }
PyramidBackgroundColorPreview >> morphPresenter [
^morphPresenter
]

{ #category : #accessing }
PyramidBackgroundColorPreview >> morphRight [

	^ morphRight 
]

{ #category : #'as yet unclassified' }
PyramidBackgroundColorPreview >> numberOfSquares [

	^ 4
]

{ #category : #accessing }
PyramidBackgroundColorPreview >> rightColor: aColor [

	self morphRight color: aColor
]

{ #category : #accessing }
PyramidBackgroundColorPreview >> width [

	^ 240
]
