Class {
	#name : 'PyramidPropertyPopupPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'buttonIndividual',
		'buttonGroup',
		'individualPresenters',
		'groupedPresenters',
		'name'
	],
	#category : 'Pyramid-property',
	#package : 'Pyramid',
	#tag : 'property'
}

{ #category : 'accessing' }
PyramidPropertyPopupPresenter >> buttonGroup [

	^ buttonGroup
]

{ #category : 'accessing' }
PyramidPropertyPopupPresenter >> buttonIndividual [

	^ buttonIndividual
]

{ #category : 'layout' }
PyramidPropertyPopupPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
]

{ #category : 'accessing' }
PyramidPropertyPopupPresenter >> groupedPresenters [

	^ groupedPresenters
]

{ #category : 'accessing' }
PyramidPropertyPopupPresenter >> groupedPresenters: anObject [

	groupedPresenters := anObject
]

{ #category : 'accessing' }
PyramidPropertyPopupPresenter >> individualPresenters [

	^ individualPresenters
]

{ #category : 'accessing' }
PyramidPropertyPopupPresenter >> individualPresenters: anObject [

	individualPresenters := anObject
]

{ #category : 'initialization - deprecated' }
PyramidPropertyPopupPresenter >> initializePresenters [

	individualPresenters := {  }.
	groupedPresenters := {  }.
	name := 'Unknow'.

	buttonIndividual := SpRadioButtonPresenter new
		                    label: 'Individual';
		                    yourself.
	buttonGroup := SpRadioButtonPresenter new
		               label: 'Group';
		               yourself.

	buttonIndividual associatedRadioButtons: { buttonGroup }.
	self buttonGroup click.
	buttonIndividual whenActivatedDo: [ self showIndividualPresenter ].
	buttonGroup whenActivatedDo: [ self showGroupPresenter ]
]

{ #category : 'as yet unclassified' }
PyramidPropertyPopupPresenter >> layoutWith: aCollection [

	| inputsLayout scroll |
	inputsLayout := SpBoxLayout newVertical
		                spacing: 4;
		                yourself.
	aCollection do: [ :each | inputsLayout add: each height: 24 ].
	inputsLayout add: ''.

	aCollection
		ifEmpty: [
			scroll := SpLabelPresenter new
				          label: 'nothing to see here';
				          yourself ]
		ifNotEmpty: [
			scroll := SpScrollableLayout new child: (SpPresenter new
					           layout: inputsLayout;
					           yourself) ].

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: (SpLabelPresenter new
						    label: self name;
						    displayBold: [ :t | true ];
						    yourself)
				   width: 150;
				   add: self buttonGroup width: 75;
				   add: self buttonIndividual width: 75;
				   yourself)
		  expand: false;
		  add: scroll height: 300;
		  yourself
]

{ #category : 'accessing' }
PyramidPropertyPopupPresenter >> name [

	^ name
]

{ #category : 'accessing' }
PyramidPropertyPopupPresenter >> name: anObject [

	name := anObject
]

{ #category : 'as yet unclassified' }
PyramidPropertyPopupPresenter >> name: aString grouped: groupedCollection individual: individualCollection [

	self name: aString.
	self individualPresenters: individualCollection.
	self groupedPresenters: groupedCollection.
	
	self buttonGroup state ifTrue: [ self showGroupPresenter ] ifFalse: [ self showIndividualPresenter ].
]

{ #category : 'as yet unclassified' }
PyramidPropertyPopupPresenter >> showGroupPresenter [

	self layout: (self layoutWith: self groupedPresenters).
]

{ #category : 'as yet unclassified' }
PyramidPropertyPopupPresenter >> showIndividualPresenter [

	self layout: (self layoutWith: self individualPresenters)
]
