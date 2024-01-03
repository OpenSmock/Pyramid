Class {
	#name : #PyramidPlaygroundView,
	#superclass : #SpPresenter,
	#traits : 'TPyramidProjectModelObserver',
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'list',
		'playground',
		'projectModel',
		'codeObjectInteractionModel',
		'contextLabel'
	],
	#category : #'Pyramid-plugin-playground'
}

{ #category : #accessing }
PyramidPlaygroundView >> contextLabel [

	^ contextLabel
]

{ #category : #'as yet unclassified' }
PyramidPlaygroundView >> currentSelection [

	^ self projectModel selection
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
	playground announcer
		when: SpCodeEvaluationSucceedAnnouncement
		do: [ :ann | self projectModel informElementsChanged ]
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
PyramidPlaygroundView >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidPlaygroundView >> projectModel: aPyramidActiveProject [

	projectModel := aPyramidActiveProject.
	projectModel addObserver: self.
	self playground interactionModel projectModel: aPyramidActiveProject.
	
		self pyramidSelectionChanged.
]

{ #category : #'as yet unclassified' }
PyramidPlaygroundView >> pyramidSelectionChanged [

	self list items: self currentSelection.
	contextLabel label: self valueOfSelf.
]

{ #category : #'as yet unclassified' }
PyramidPlaygroundView >> valueOfSelf [

	^ 'self is <1s>' expandMacrosWith:
		  self playground interactionModel doItReceiverString
]
