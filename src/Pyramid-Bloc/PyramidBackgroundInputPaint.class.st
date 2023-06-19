Class {
	#name : #PyramidBackgroundInputPaint,
	#superclass : #PyramidBackgroundAbstractBackgroundInput,
	#instVars : [
		'buttonColor',
		'buttonGradient',
		'inputSolid',
		'inputGradient',
		'whenSubmitDo'
	],
	#category : #'Pyramid-Bloc-custom-specs-background'
}

{ #category : #accessing }
PyramidBackgroundInputPaint >> background [

	^ BlBackground paint: self paint
]

{ #category : #accessing }
PyramidBackgroundInputPaint >> buttonColor [

	^ buttonColor
]

{ #category : #accessing }
PyramidBackgroundInputPaint >> buttonGradient [

	^ buttonGradient
]

{ #category : #layout }
PyramidBackgroundInputPaint >> defaultLayout [

	^ self defaultLayoutSolid
]

{ #category : #layout }
PyramidBackgroundInputPaint >> defaultLayoutGradient [

	^ self defaultLayoutSelector
		add: self inputGradient;
		yourself
]

{ #category : #layout }
PyramidBackgroundInputPaint >> defaultLayoutSelector [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpBoxLayout newHorizontal
				   add: self buttonColor;
				   add: self buttonGradient;
				   yourself) expand: false;
		  yourself
]

{ #category : #layout }
PyramidBackgroundInputPaint >> defaultLayoutSolid [

	^ self defaultLayoutSelector
		  add: self inputSolid expand: false;
		  add: SpNullPresenter new expand: true;
		  yourself
]

{ #category : #'initialization - deprecated' }
PyramidBackgroundInputPaint >> initializePresenters [

	buttonColor := SpRadioButtonPresenter new
		               label: 'Solid color';
		               yourself.
	buttonGradient := SpRadioButtonPresenter new
		                  label: 'Gradient';
		                  yourself.
	buttonColor associatedRadioButtons: { buttonGradient }.
	buttonColor whenActivatedDo: [ self updateLayout ].
	buttonColor whenDeactivatedDo: [ self updateLayout ].

	inputSolid := PyramidBackgroundInputSolidColor new whenSubmitDo: [:paint | self whenSubmitDo value: paint ]; yourself.
	inputGradient := PyramidBackgroundInputGradiant new whenSubmitDo: [:paint | self whenSubmitDo value: paint ]; yourself.
]

{ #category : #accessing }
PyramidBackgroundInputPaint >> inputGradient [

	^ inputGradient
]

{ #category : #accessing }
PyramidBackgroundInputPaint >> inputSolid [

	^ inputSolid
]

{ #category : #accessing }
PyramidBackgroundInputPaint >> paint [

	self buttonColor state
		  ifTrue: [ ^ self inputSolid paint ]
		  ifFalse: [ ^ self inputGradient paint ]
]

{ #category : #initialization }
PyramidBackgroundInputPaint >> setDefaultPaint: aPaint [

	aPaint pyramidModalDefaultPaint: self
]

{ #category : #private }
PyramidBackgroundInputPaint >> updateLayout [

	self buttonColor state
		ifTrue: [ self layout: self defaultLayoutSolid ]
		ifFalse: [ self layout: self defaultLayoutGradient ]
]

{ #category : #accessing }
PyramidBackgroundInputPaint >> whenSubmitDo [

	whenSubmitDo ifNil: [ whenSubmitDo := [ :paint | ] ].
	^ whenSubmitDo
]

{ #category : #accessing }
PyramidBackgroundInputPaint >> whenSubmitDo: aBlock [

	whenSubmitDo:= aBlock
]
