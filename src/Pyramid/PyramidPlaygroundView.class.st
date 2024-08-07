Class {
	#name : #PyramidPlaygroundView,
	#superclass : #SpPresenter,
	#instVars : [
		'list',
		'playground',
		'codeObjectInteractionModel',
		'contextLabel'
	],
	#category : 'Pyramid-plugin-playground'
}

{ #category : #accessing }
PyramidPlaygroundView >> contextLabel [

	^ contextLabel
]

{ #category : #layout }
PyramidPlaygroundView >> defaultLayout [

	^ SpPanedLayout newVertical
		  add: (SpBoxLayout newVertical
				   add: (SpLabelPresenter new
						    label: 'Selection';
						    displayBold: [ :t | true ];
						    yourself) expand: false;
				   add: self list;
				   yourself);
		  add: (SpBoxLayout newVertical
				   add: (SpLabelPresenter new
						    label: 'Playground';
						    displayBold: [ :t | true ];
						    yourself)  expand: false;
				   add: self contextLabel expand: false;
				   add: self playground;
				   yourself);
		  yourself
]

{ #category : #initialization }
PyramidPlaygroundView >> initializePresenters [

	list := SpListPresenter new.
	playground := SpCodePresenter new.
	contextLabel := SpLabelPresenter new.

	playground interactionModel: PyramidSpCodeObjectInteractionModel new.
]

{ #category : #accessing }
PyramidPlaygroundView >> list [
^ list
]

{ #category : #accessing }
PyramidPlaygroundView >> playground [
	^ playground
]

{ #category : #accessing }
PyramidPlaygroundView >> projectModel: aPyramidActiveProject [

	aPyramidActiveProject announcer
		when: PyramidSelectionChangedEvent
		do: [ :evt | self pyramidSelectionChanged: evt ]
		for: self.
	self playground interactionModel projectModel: aPyramidActiveProject.
	playground announcer
		when: SpCodeEvaluationSucceedAnnouncement
		do: [ :ann | aPyramidActiveProject informElementsChanged ]
		for: self.
	self updateSelectedElementsWith: {  }
]

{ #category : #'as yet unclassified' }
PyramidPlaygroundView >> pyramidSelectionChanged: anEvent [

	self updateSelectedElementsWith: anEvent selection.
]

{ #category : #'as yet unclassified' }
PyramidPlaygroundView >> updateSelectedElementsWith: aCollection [

	self list items: aCollection.
	contextLabel label: self valueOfSelf
]

{ #category : #'as yet unclassified' }
PyramidPlaygroundView >> valueOfSelf [

	^ 'self is <1s>' expandMacrosWith:
		  self playground interactionModel doItReceiverString
]
