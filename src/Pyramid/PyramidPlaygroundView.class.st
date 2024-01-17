Class {
	#name : #PyramidPlaygroundView,
	#superclass : #SpPresenter,
	#traits : 'TPyramidProjectModelObserver',
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'inspectSelectionButton',
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

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: (SpBoxLayout newVertical
						    add: (SpLabelPresenter new
								     label: 'Playground';
								     displayBold: [ :t | true ];
								     yourself)
						    expand: false;
						    add: self contextLabel expand: false;
						    yourself)
				   expand: true;
				   add: self inspectSelectionButton withConstraints: [ :c |
				   c width: 32.
				   c height: 32 ];
				   yourself)
		  expand: false;
		  add: self playground;
		  yourself
]

{ #category : #initialization }
PyramidPlaygroundView >> initializePresenters [

	inspectSelectionButton := SpButtonPresenter new
		                          icon: (self iconNamed: #smallInspectIt);
		                          enabled: false;
		help: 'Inspect the selection.';
		                          yourself.
	playground := SpCodePresenter new.
	contextLabel := SpLabelPresenter new.

	playground interactionModel: PyramidSpCodeObjectInteractionModel new.
	playground announcer
		when: SpCodeEvaluationSucceedAnnouncement
		do: [ :ann | self projectModel informElementsChanged ]
]

{ #category : #'as yet unclassified' }
PyramidPlaygroundView >> inspectSelectionButton [

	^ inspectSelectionButton
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
	self inspectSelectionButton enabled: true.
]

{ #category : #'as yet unclassified' }
PyramidPlaygroundView >> pyramidSelectionChanged [

	| selectionCopy |
	contextLabel label: self valueOfSelf.

	selectionCopy := self projectModel selection asArray.

	selectionCopy ifEmpty: [
		inspectSelectionButton
			action: [ self projectModel firstLevelElements asArray inspect ];
			help: 'Inspect the first level elements.'.
		^ self ].

	selectionCopy size = 1 ifTrue: [
		inspectSelectionButton
			action: [ selectionCopy first inspect ];
			help: 'Inspect the selected element.'.
		^ self ].

	inspectSelectionButton
		action: [ selectionCopy inspect ];
		help: ('Inspect the <1p> selected elements.' expandMacrosWith:
					 selectionCopy size)
]

{ #category : #'as yet unclassified' }
PyramidPlaygroundView >> valueOfSelf [

	^ 'self is <1s>' expandMacrosWith:
		  self playground interactionModel doItReceiverString
]
