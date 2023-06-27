Class {
	#name : #PyramidPaintInputPresenter,
	#superclass : #PyramidBackgroundAbstractBackgroundInput,
	#instVars : [
		'buttonColor',
		'buttonGradient',
		'inputSolid',
		'inputGradient',
		'whenSubmitDo'
	],
	#category : #'Pyramid-Bloc-custom-specs-paint'
}

{ #category : #accessing }
PyramidPaintInputPresenter >> background [

	^ BlBackground paint: self paint
]

{ #category : #accessing }
PyramidPaintInputPresenter >> buttonColor [

	^ buttonColor
]

{ #category : #accessing }
PyramidPaintInputPresenter >> buttonGradient [

	^ buttonGradient
]

{ #category : #layout }
PyramidPaintInputPresenter >> defaultLayout [

	^ self defaultLayoutSolid
]

{ #category : #layout }
PyramidPaintInputPresenter >> defaultLayoutGradient [

	^ self defaultLayoutSelector
		add: self inputGradient;
		yourself
]

{ #category : #layout }
PyramidPaintInputPresenter >> defaultLayoutSelector [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpBoxLayout newHorizontal
				   add: self buttonColor;
				   add: self buttonGradient;
				   yourself) expand: false;
		  yourself
]

{ #category : #layout }
PyramidPaintInputPresenter >> defaultLayoutSolid [

	^ self defaultLayoutSelector
		  add: self inputSolid expand: false;
		  add: SpNullPresenter new expand: true;
		  yourself
]

{ #category : #'initialization - deprecated' }
PyramidPaintInputPresenter >> initializePresenters [

	buttonColor := SpRadioButtonPresenter new
		               label: 'Solid color';
		               yourself.
	buttonGradient := SpRadioButtonPresenter new
		                  label: 'Gradient';
		                  yourself.
	buttonColor associatedRadioButtons: { buttonGradient }.
	buttonColor whenActivatedDo: [ self updateLayout ].
	buttonColor whenDeactivatedDo: [ self updateLayout ].

	inputSolid := PyramidColorInputPresenter new whenSubmitDo: [:paint | self whenSubmitDo value: paint ]; yourself.
	inputGradient := PyramidPaintInputGradiant new whenSubmitDo: [:paint | self whenSubmitDo value: paint ]; yourself.
]

{ #category : #accessing }
PyramidPaintInputPresenter >> inputGradient [

	^ inputGradient
]

{ #category : #accessing }
PyramidPaintInputPresenter >> inputSolid [

	^ inputSolid
]

{ #category : #accessing }
PyramidPaintInputPresenter >> paint [

	self buttonColor state
		  ifTrue: [ ^ self inputSolid paint ]
		  ifFalse: [ ^ self inputGradient paint ]
]

{ #category : #initialization }
PyramidPaintInputPresenter >> setDefaultPaint: aPaint [

	aPaint pyramidModalDefaultPaint: self
]

{ #category : #private }
PyramidPaintInputPresenter >> updateLayout [

	self buttonColor state
		ifTrue: [ self layout: self defaultLayoutSolid ]
		ifFalse: [ self layout: self defaultLayoutGradient ]
]

{ #category : #accessing }
PyramidPaintInputPresenter >> whenSubmitDo [

	whenSubmitDo ifNil: [ whenSubmitDo := [ :paint | ] ].
	^ whenSubmitDo
]

{ #category : #accessing }
PyramidPaintInputPresenter >> whenSubmitDo: aBlock [

	whenSubmitDo:= aBlock
]
