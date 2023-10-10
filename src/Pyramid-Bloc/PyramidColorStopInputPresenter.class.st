Class {
	#name : #PyramidColorStopInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'colorInput',
		'stopInput'
	],
	#category : 'Pyramid-Bloc-plugin-bloc'
}

{ #category : #accessing }
PyramidColorStopInputPresenter >> colorInput [

	^ colorInput
]

{ #category : #layout }
PyramidColorStopInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self stopInput width: 40;
			add: '|' expand: false;
		  add: self colorInput;
		  yourself
]

{ #category : #initialization }
PyramidColorStopInputPresenter >> initializePresenters [

	colorInput := PyramidColorInputSingleLineWithPickupButtonPresenter new.
	stopInput := PyramidNumberInputPresenter new
]

{ #category : #accessing }
PyramidColorStopInputPresenter >> stopInput [

	^ stopInput
]

{ #category : #'as yet unclassified' }
PyramidColorStopInputPresenter >> value [

	| color |
	color := self colorInput value.
	color isColor ifFalse: [ ^ color ].
	(self stopInput value between: 0 and: 1) ifFalse: [self stopInput value: self stopInput value rounded]. 
	^ self stopInput value -> self colorInput value
]

{ #category : #'as yet unclassified' }
PyramidColorStopInputPresenter >> value: anAssociation [

	anAssociation isAssociation ifFalse: [
		self colorInput value: PyramidUnknowState new ].
	self stopInput value: anAssociation key asNumber.
	self colorInput value: anAssociation value
]

{ #category : #'as yet unclassified' }
PyramidColorStopInputPresenter >> whenValueChangedDo: aBlock [

	self colorInput whenValueChangedDo: [ :e | aBlock value: self value ].
	self stopInput whenValueChangedDo: [ :e | aBlock value: self value ]
]
