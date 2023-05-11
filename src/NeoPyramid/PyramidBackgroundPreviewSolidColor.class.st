Class {
	#name : #PyramidBackgroundPreviewSolidColor,
	#superclass : #SpPresenter,
	#instVars : [
		'morphPresenter',
		'morphColor',
		'morphTag'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundPreviewSolidColor >> backgroundMorph [

	| morph littleOne littleOneExtent position isPrimaryColor |
	morph := Morph new
		         extent: self width @ self height;
		         yourself.
	littleOneExtent := self width / self numberOfSquaresHorizontal
	                   @ (self height / self numberOfSquaresVertical).
	position := 0 @ 0.
	isPrimaryColor := true.
	self numberOfSquares timesRepeat: [
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
		position x + 1 < self numberOfSquaresHorizontal
			ifTrue: [ position := position x + 1 @ position y ]
			ifFalse: [
				position := 0 @ (position y + 1).
				self numberOfSquares even ifTrue: [
					isPrimaryColor := isPrimaryColor not ] ].
		isPrimaryColor := isPrimaryColor not ].
	^ morph
]

{ #category : #accessing }
PyramidBackgroundPreviewSolidColor >> backgroundPrimary [

	^ Color white adjustBrightness: -0.15
]

{ #category : #accessing }
PyramidBackgroundPreviewSolidColor >> backgroundSecond [

	^ Color black adjustBrightness: 0.15
]

{ #category : #accessing }
PyramidBackgroundPreviewSolidColor >> color: aColor [

	self morphColor color: aColor
]

{ #category : #layout }
PyramidBackgroundPreviewSolidColor >> defaultLayout [ 

	^ SpBoxLayout newVertical add: self morphPresenter; yourself
]

{ #category : #accessing }
PyramidBackgroundPreviewSolidColor >> height [

	^ 24
]

{ #category : #initialization }
PyramidBackgroundPreviewSolidColor >> initializePresenters [

	| morphBack |
	morphColor := Morph new
		              extent: self width @ self height;
		              color: Color transparent;
		              yourself.
	morphTag := self tagMorph.

	morphBack := self backgroundMorph.
	morphBack addMorph: morphColor.
	morphBack addMorph: morphTag.


	morphPresenter := SpMorphPresenter new
		                  morph: morphBack;
		                  yourself
]

{ #category : #accessing }
PyramidBackgroundPreviewSolidColor >> morphColor [

	^ morphColor
]

{ #category : #accessing }
PyramidBackgroundPreviewSolidColor >> morphPresenter [
^morphPresenter
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPreviewSolidColor >> morphTag [
^ morphTag
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPreviewSolidColor >> numberOfSquares [

	^ self numberOfSquaresHorizontal * self numberOfSquaresVertical 
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPreviewSolidColor >> numberOfSquaresHorizontal [

	^ 80
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPreviewSolidColor >> numberOfSquaresVertical [

	^ 4
]

{ #category : #settings }
PyramidBackgroundPreviewSolidColor >> showError [

	self morphTag color: Color red.
	self morphTag borderColor: Color black
]

{ #category : #settings }
PyramidBackgroundPreviewSolidColor >> showOk [

	self morphTag color: Color transparent.
	self morphTag borderColor: Color transparent
]

{ #category : #settings }
PyramidBackgroundPreviewSolidColor >> showWarning [

	self morphTag color: Color orange.
	self morphTag borderColor: Color black
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPreviewSolidColor >> tagMorph [

	| size |
	size := ((self height min: self width)) asPoint.
	^ Morph new
		  extent: size;
		  borderWidth: 1;
		  color: Color transparent;
		  yourself
]

{ #category : #accessing }
PyramidBackgroundPreviewSolidColor >> width [

	^ 480
]
