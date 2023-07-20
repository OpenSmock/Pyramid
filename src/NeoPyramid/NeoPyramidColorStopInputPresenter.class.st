Class {
	#name : #NeoPyramidColorStopInputPresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'colorInput',
		'stopInput'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #accessing }
NeoPyramidColorStopInputPresenter >> colorInput [

	^ colorInput
]

{ #category : #layout }
NeoPyramidColorStopInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self stopInput width: 40;
			add: '|' expand: false;
		  add: self colorInput;
		  yourself
]

{ #category : #initialization }
NeoPyramidColorStopInputPresenter >> initializePresenters [

	colorInput := NeoPyramidColorInputSingleLinePresenter new.
	stopInput := PyramidNumberInputPresenter new
]

{ #category : #accessing }
NeoPyramidColorStopInputPresenter >> stopInput [

	^ stopInput
]

{ #category : #'as yet unclassified' }
NeoPyramidColorStopInputPresenter >> value [

	| color |
	color := self colorInput value.
	color isColor ifFalse: [ ^ color ].
	(self stopInput value between: 0 and: 1) ifFalse: [self stopInput value: self stopInput value rounded]. 
	^ self stopInput value -> self colorInput value
]

{ #category : #'as yet unclassified' }
NeoPyramidColorStopInputPresenter >> value: anAssociation [

	anAssociation isAssociation ifFalse: [
		self colorInput value: PyramidUnknowState new ].
	self stopInput value: anAssociation key asNumber.
	self colorInput value: anAssociation value
]

{ #category : #'as yet unclassified' }
NeoPyramidColorStopInputPresenter >> whenValueChangedDo: aBlock [

	self colorInput whenValueChangedDo: [ :e | aBlock value: self value ].
	self stopInput whenValueChangedDo: [ :e | aBlock value: self value ]
]
