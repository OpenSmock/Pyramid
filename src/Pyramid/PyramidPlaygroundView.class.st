Class {
	#name : 'PyramidPlaygroundView',
	#superclass : 'SpPresenter',
	#instVars : [
		'list',
		'playground',
		'codeObjectInteractionModel',
		'contextLabel'
	],
	#category : 'Pyramid-plugin-playground',
	#package : 'Pyramid',
	#tag : 'plugin-playground'
}

{ #category : 'accessing' }
PyramidPlaygroundView >> contextLabel [

	^ contextLabel
]

{ #category : 'layout' }
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

{ #category : 'initialization' }
PyramidPlaygroundView >> initializePresenters [

	list := SpListPresenter new.
	playground := SpCodePresenter new.
	contextLabel := SpLabelPresenter new.

	playground interactionModel: PyramidSpCodeObjectInteractionModel new.
	playground announcer
		when: SpCodeEvaluationSucceedAnnouncement
		do: [ :ann | self projectModel informElementsChanged ]
		for: self
]

{ #category : 'accessing' }
PyramidPlaygroundView >> list [
^ list
]

{ #category : 'accessing' }
PyramidPlaygroundView >> playground [
	^ playground
]

{ #category : 'accessing' }
PyramidPlaygroundView >> projectModel: aPyramidActiveProject [

	aPyramidActiveProject announcer
		when: PyramidSelectionChangedEvent
		send: #pyramidSelectionChanged:
		to: self.
	self playground interactionModel projectModel: aPyramidActiveProject.

	self updateSelectedElementsWith: {  }
]

{ #category : 'as yet unclassified' }
PyramidPlaygroundView >> pyramidSelectionChanged: anEvent [

	self updateSelectedElementsWith: anEvent selection.
]

{ #category : 'as yet unclassified' }
PyramidPlaygroundView >> updateSelectedElementsWith: aCollection [

	self list items: aCollection.
	contextLabel label: self valueOfSelf
]

{ #category : 'as yet unclassified' }
PyramidPlaygroundView >> valueOfSelf [

	^ 'self is <1s>' expandMacrosWith:
		  self playground interactionModel doItReceiverString
]
