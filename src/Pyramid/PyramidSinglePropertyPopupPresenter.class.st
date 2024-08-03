Class {
	#name : #PyramidSinglePropertyPopupPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'buttonIndividual',
		'buttonGroup',
		'individualPresenters',
		'groupedPresenters',
		'name',
		'originPresenter',
		'popoverDirection',
		'lastPropertyShown'
	],
	#category : #'Pyramid-property'
}

{ #category : #accessing }
PyramidSinglePropertyPopupPresenter >> buttonGroup [

	^ buttonGroup
]

{ #category : #accessing }
PyramidSinglePropertyPopupPresenter >> buttonIndividual [

	^ buttonIndividual
]

{ #category : #layout }
PyramidSinglePropertyPopupPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
]

{ #category : #accessing }
PyramidSinglePropertyPopupPresenter >> groupedPresenters [

	^ groupedPresenters
]

{ #category : #accessing }
PyramidSinglePropertyPopupPresenter >> groupedPresenters: anObject [

	groupedPresenters := anObject
]

{ #category : #accessing }
PyramidSinglePropertyPopupPresenter >> individualPresenters [

	^ individualPresenters
]

{ #category : #accessing }
PyramidSinglePropertyPopupPresenter >> individualPresenters: anObject [

	individualPresenters := anObject
]

{ #category : #'initialization - deprecated' }
PyramidSinglePropertyPopupPresenter >> initializePresenters [

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

{ #category : #accessing }
PyramidSinglePropertyPopupPresenter >> lastPropertyShown [

	^ lastPropertyShown
]

{ #category : #accessing }
PyramidSinglePropertyPopupPresenter >> lastPropertyShown: anObject [

	lastPropertyShown := anObject
]

{ #category : #'as yet unclassified' }
PyramidSinglePropertyPopupPresenter >> layoutWith: aCollection [

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
				   width: self popupExtent x;
				   add: self buttonGroup width: 75;
				   add: self buttonIndividual width: 75;
				   yourself)
		  expand: false;
		  add: scroll height: self popupExtent y;
		  yourself
]

{ #category : #accessing }
PyramidSinglePropertyPopupPresenter >> name [

	^ name
]

{ #category : #accessing }
PyramidSinglePropertyPopupPresenter >> name: anObject [

	name := anObject
]

{ #category : #'as yet unclassified' }
PyramidSinglePropertyPopupPresenter >> name: aString grouped: groupedCollection individual: individualCollection [

	self name: aString.
	self individualPresenters: individualCollection.
	self groupedPresenters: groupedCollection.
	
	self buttonGroup state ifTrue: [ self showGroupPresenter ] ifFalse: [ self showIndividualPresenter ].
]

{ #category : #accessing }
PyramidSinglePropertyPopupPresenter >> originPresenter [

	^ originPresenter
]

{ #category : #accessing }
PyramidSinglePropertyPopupPresenter >> originPresenter: anObject [

	originPresenter := anObject
]

{ #category : #accessing }
PyramidSinglePropertyPopupPresenter >> popoverDirection [

	^ popoverDirection
]

{ #category : #accessing }
PyramidSinglePropertyPopupPresenter >> popoverDirection: anObject [

	popoverDirection := anObject
]

{ #category : #api }
PyramidSinglePropertyPopupPresenter >> popup [

	(PyramidPopoverFactory
		 makeWithPresenter: self
		 relativeTo: self originPresenter
		 position: self popoverDirection) popup
]

{ #category : #'as yet unclassified' }
PyramidSinglePropertyPopupPresenter >> popupExtent [

	^ 250 @ 500
]

{ #category : #'as yet unclassified' }
PyramidSinglePropertyPopupPresenter >> showGroupPresenter [

	self layout: (self layoutWith: self groupedPresenters).
]

{ #category : #'as yet unclassified' }
PyramidSinglePropertyPopupPresenter >> showIndividualPresenter [

	self layout: (self layoutWith: self individualPresenters)
]
