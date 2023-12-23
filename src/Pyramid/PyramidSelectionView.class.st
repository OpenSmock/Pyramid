Class {
	#name : #PyramidSelectionView,
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
	#category : #'Pyramid-plugin-selection'
}

{ #category : #accessing }
PyramidSelectionView >> contextLabel [

	^ contextLabel
]

{ #category : #'as yet unclassified' }
PyramidSelectionView >> currentSelection [

	^ self projectModel selection
]

{ #category : #layout }
PyramidSelectionView >> defaultLayout [

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
PyramidSelectionView >> initializePresenters [

	list := SpListPresenter new.
	playground := SpCodePresenter new.
	contextLabel := SpLabelPresenter new.

	playground interactionModel: PyramidSpCodeObjectInteractionModel new.
	playground announcer
		when: SpCodeEvaluationSucceedAnnouncement
		do: [ :ann | self projectModel informElementsChanged ]
]

{ #category : #accessing }
PyramidSelectionView >> list [
^ list
]

{ #category : #accessing }
PyramidSelectionView >> playground [
	^ playground
]

{ #category : #accessing }
PyramidSelectionView >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidSelectionView >> projectModel: aPyramidActiveProject [

	projectModel := aPyramidActiveProject.
	projectModel addObserver: self.
	self playground interactionModel projectModel: aPyramidActiveProject.
	
		self pyramidSelectionChanged.
]

{ #category : #'as yet unclassified' }
PyramidSelectionView >> pyramidSelectionChanged [

	self list items: self currentSelection.
	contextLabel label: self valueOfSelf.
]

{ #category : #'as yet unclassified' }
PyramidSelectionView >> valueOfSelf [

	^ 'self is <1s>' expandMacrosWith:
		  self playground interactionModel doItReceiverString
]
