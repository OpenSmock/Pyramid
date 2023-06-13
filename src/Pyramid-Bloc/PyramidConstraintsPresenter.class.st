Class {
	#name : #PyramidConstraintsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'valueInput',
		'whenSubmitDo',
		'selectorInputs',
		'shouldTriggerAction',
		'submit'
	],
	#category : #'Pyramid-Bloc-custom-specs-constraints'
}

{ #category : #'as yet unclassified' }
PyramidConstraintsPresenter class >> constraintsHorizontal [

	^ self new model: { PyramidConstraintsModel constraintsExactHorizontal . PyramidConstraintsModel constraintsFitContentHorizontal . PyramidConstraintsModel constraintsMatchParentHorizontal }; yourself
]

{ #category : #layout }
PyramidConstraintsPresenter >> defaultLayout [

	|defaultLayout|
	defaultLayout :=  SpBoxLayout newVertical
		  spacing: 4; yourself.
	self selectorInputs do: [  :each | defaultLayout add: (SpBoxLayout newHorizontal
		  spacing: 4;
		  add: each key;
		  add: each value associatedPresenter;
		  yourself) ].
	^ defaultLayout
]

{ #category : #accessing }
PyramidConstraintsPresenter >> defaultValue: aDefaultValue [

	shouldTriggerAction:= false.
	aDefaultValue pyramidSelectConstraintsOn: self.
	shouldTriggerAction:= true
]

{ #category : #initialization }
PyramidConstraintsPresenter >> initializePresenters [

	shouldTriggerAction := true.
	selectorInputs := OrderedCollection new.
	valueInput := SpNullPresenter new
]

{ #category : #accessing }
PyramidConstraintsPresenter >> model: aModel [

	self selectorInputs: (aModel collect: [ :each |
			 (SpRadioButtonPresenter new
				  label: each title;
				  yourself) -> each ]).
	self selectorInputs first key associatedRadioButtons:(
		self selectorInputs allButFirst collect: [ :each | each key ]).
	self selectorInputs do: [ :each |
		each key whenActivatedDo: [ self submit: each value ] ].

	aModel do: [ :each | each initializeBlock value: self ].
	self layout: self defaultLayout
]

{ #category : #layout }
PyramidConstraintsPresenter >> selectorInputs [

	^ selectorInputs
]

{ #category : #layout }
PyramidConstraintsPresenter >> selectorInputs: anObject [

	selectorInputs := anObject
]

{ #category : #'as yet unclassified' }
PyramidConstraintsPresenter >> submit [

	^ submit
]

{ #category : #'as yet unclassified' }
PyramidConstraintsPresenter >> submit: aModel [

	
	submit :=  aModel block.
	shouldTriggerAction ifTrue: [ self whenSubmitDo value].
]

{ #category : #layout }
PyramidConstraintsPresenter >> valueInput [

	^ valueInput
]

{ #category : #enumerating }
PyramidConstraintsPresenter >> whenSubmitDo [

	whenSubmitDo ifNil: [ whenSubmitDo := [  ] ].
	^ whenSubmitDo
]

{ #category : #enumerating }
PyramidConstraintsPresenter >> whenSubmitDo: aBlock [

	whenSubmitDo:= aBlock
]
