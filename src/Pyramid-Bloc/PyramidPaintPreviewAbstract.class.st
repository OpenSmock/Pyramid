Class {
	#name : #PyramidPaintPreviewAbstract,
	#superclass : #SpPresenter,
	#instVars : [
		'morphPresenter',
		'morphTag',
		'morphBack'
	],
	#category : #'Pyramid-Bloc-custom-specs-paint'
}

{ #category : #accessing }
PyramidPaintPreviewAbstract >> backgroundMorph [

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
PyramidPaintPreviewAbstract >> backgroundPrimary [

	^ Color white adjustBrightness: -0.15
]

{ #category : #accessing }
PyramidPaintPreviewAbstract >> backgroundSecond [

	^ Color black adjustBrightness: 0.15
]

{ #category : #layout }
PyramidPaintPreviewAbstract >> defaultLayout [ 

	^ SpBoxLayout newVertical add: self morphPresenter; yourself
]

{ #category : #accessing }
PyramidPaintPreviewAbstract >> height [

	^ 24
]

{ #category : #initialization }
PyramidPaintPreviewAbstract >> initializePresenters [

	morphTag := self tagMorph.
	morphBack := self backgroundMorph.
	morphBack addMorph: morphTag.
	morphPresenter := SpMorphPresenter new
		                  morph: morphBack;
		                  yourself
]

{ #category : #accessing }
PyramidPaintPreviewAbstract >> morphPresenter [
^morphPresenter
]

{ #category : #'as yet unclassified' }
PyramidPaintPreviewAbstract >> morphTag [
^ morphTag
]

{ #category : #'as yet unclassified' }
PyramidPaintPreviewAbstract >> numberOfSquares [

	^ self numberOfSquaresHorizontal * self numberOfSquaresVertical 
]

{ #category : #'as yet unclassified' }
PyramidPaintPreviewAbstract >> numberOfSquaresHorizontal [

	^ 80
]

{ #category : #'as yet unclassified' }
PyramidPaintPreviewAbstract >> numberOfSquaresVertical [

	^ 4
]

{ #category : #settings }
PyramidPaintPreviewAbstract >> showError [

	self morphTag color: Color red.
	self morphTag borderColor: Color black
]

{ #category : #settings }
PyramidPaintPreviewAbstract >> showOk [

	self morphTag color: Color transparent.
	self morphTag borderColor: Color transparent
]

{ #category : #settings }
PyramidPaintPreviewAbstract >> showWarning [

	self morphTag color: Color orange.
	self morphTag borderColor: Color black
]

{ #category : #'as yet unclassified' }
PyramidPaintPreviewAbstract >> tagMorph [

	| size |
	size := ((self height min: self width)) asPoint.
	^ Morph new
		  extent: size;
		  borderWidth: 1;
		  color: Color transparent;
		  yourself
]

{ #category : #accessing }
PyramidPaintPreviewAbstract >> width [

	^ 480
]
