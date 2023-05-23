Class {
	#name : #PyramidBackgroundPreviewAbstract,
	#superclass : #SpPresenter,
	#instVars : [
		'morphPresenter',
		'morphTag',
		'morphBack'
	],
	#category : #'Pyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundPreviewAbstract >> backgroundMorph [

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
PyramidBackgroundPreviewAbstract >> backgroundPrimary [

	^ Color white adjustBrightness: -0.15
]

{ #category : #accessing }
PyramidBackgroundPreviewAbstract >> backgroundSecond [

	^ Color black adjustBrightness: 0.15
]

{ #category : #layout }
PyramidBackgroundPreviewAbstract >> defaultLayout [ 

	^ SpBoxLayout newVertical add: self morphPresenter; yourself
]

{ #category : #accessing }
PyramidBackgroundPreviewAbstract >> height [

	^ 24
]

{ #category : #initialization }
PyramidBackgroundPreviewAbstract >> initializePresenters [

	morphTag := self tagMorph.
	morphBack := self backgroundMorph.
	morphBack addMorph: morphTag.
	morphPresenter := SpMorphPresenter new
		                  morph: morphBack;
		                  yourself
]

{ #category : #accessing }
PyramidBackgroundPreviewAbstract >> morphPresenter [
^morphPresenter
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPreviewAbstract >> morphTag [
^ morphTag
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPreviewAbstract >> numberOfSquares [

	^ self numberOfSquaresHorizontal * self numberOfSquaresVertical 
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPreviewAbstract >> numberOfSquaresHorizontal [

	^ 80
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPreviewAbstract >> numberOfSquaresVertical [

	^ 4
]

{ #category : #settings }
PyramidBackgroundPreviewAbstract >> showError [

	self morphTag color: Color red.
	self morphTag borderColor: Color black
]

{ #category : #settings }
PyramidBackgroundPreviewAbstract >> showOk [

	self morphTag color: Color transparent.
	self morphTag borderColor: Color transparent
]

{ #category : #settings }
PyramidBackgroundPreviewAbstract >> showWarning [

	self morphTag color: Color orange.
	self morphTag borderColor: Color black
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPreviewAbstract >> tagMorph [

	| size |
	size := ((self height min: self width)) asPoint.
	^ Morph new
		  extent: size;
		  borderWidth: 1;
		  color: Color transparent;
		  yourself
]

{ #category : #accessing }
PyramidBackgroundPreviewAbstract >> width [

	^ 480
]
