Class {
	#name : #PyramidConstraintsPresenterDeprecated,
	#superclass : #SpPresenter,
	#instVars : [
		'selectorInput',
		'valueInput',
		'model',
		'whenSubmitDo',
		'shouldTriggerAction'
	],
	#category : #'Pyramid-Bloc-custom-specs-constraints'
}

{ #category : #'as yet unclassified' }
PyramidConstraintsPresenterDeprecated class >> constraintsHorizontal [

	^ self new model: { PyramidConstraintsModel constraintsExactHorizontal . PyramidConstraintsModel constraintsFitContentHorizontal . PyramidConstraintsModel constraintsMatchParentHorizontal }; yourself
]

{ #category : #layout }
PyramidConstraintsPresenterDeprecated >> defaultLayout [

	^ SpBoxLayout newHorizontal spacing: 4; add: self selectorInput; add: self valueInput; yourself
]

{ #category : #initialization }
PyramidConstraintsPresenterDeprecated >> initializePresenters [

	shouldTriggerAction := true.
	selectorInput := SpDropListPresenter new
		                 display: [ :m | m title ];
		                 displayIcon: [ :m | m icon ];
		                 whenSelectedItemChangedDo: [ :new |
			                 new ifNotNil: [
					                 self layout
						                 replace: valueInput
						                 with: new associatedPresenter.
					                 valueInput := new associatedPresenter.
					                 self shouldTriggerAction ifTrue: [
							                 self whenSubmitDo value ] ] ];
		                 yourself.
	valueInput := SpNullPresenter new
]

{ #category : #accessing }
PyramidConstraintsPresenterDeprecated >> model [

	^ model
]

{ #category : #accessing }
PyramidConstraintsPresenterDeprecated >> model: aModel [

	model := aModel.
	self selectorInput items: aModel.
	aModel do: [ :each | each initializeBlock value: self ]
]

{ #category : #layout }
PyramidConstraintsPresenterDeprecated >> selectorInput [
^ selectorInput
]

{ #category : #accessing }
PyramidConstraintsPresenterDeprecated >> shouldTriggerAction [

	^ shouldTriggerAction
]

{ #category : #accessing }
PyramidConstraintsPresenterDeprecated >> shouldTriggerAction: aBool [

	shouldTriggerAction := aBool
]

{ #category : #'as yet unclassified' }
PyramidConstraintsPresenterDeprecated >> submit [

	self selectorInput selectedItem ifNil: [ ^ nil ].
	^ self selectorInput selectedItem block
]

{ #category : #'as yet unclassified' }
PyramidConstraintsPresenterDeprecated >> submit: aConstraints [

	self shouldTriggerAction: false.
	aConstraints pyramidSelectConstraintsOn: self.
	self shouldTriggerAction: true
]

{ #category : #layout }
PyramidConstraintsPresenterDeprecated >> valueInput [

	^ valueInput
]

{ #category : #enumerating }
PyramidConstraintsPresenterDeprecated >> whenSubmitDo [

	whenSubmitDo ifNil: [ whenSubmitDo := [  ] ].
	^ whenSubmitDo
]

{ #category : #enumerating }
PyramidConstraintsPresenterDeprecated >> whenSubmitDo: aBlock [

	whenSubmitDo:= aBlock
]
