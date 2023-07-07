Class {
	#name : #PyramidSearchAndSelectPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'unselectButton',
		'allRadioButton',
		'rootsRadioButton',
		'selectionRadioButton',
		'codePresenter',
		'selectButton',
		'examplesDropList',
		'activeProjectRoots',
		'activeProject'
	],
	#category : #'Pyramid-Bloc-plugin-hierarchy'
}

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectPresenter >> actionExample: aModel [

	aModel isRoots ifTrue: [ self rootsRadioButton click ].
	aModel isSelection ifTrue: [ self selectionRadioButton click ].
	aModel isAll ifTrue: [ self allRadioButton click ].
	self codePresenter text: aModel code.
	self actionSelect
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectPresenter >> actionInspect [

	self activeProject ifNil: [ ^ self ].
	self treeRadioButton state
		ifTrue: [ self codeIsForTree ]
		ifFalse: [ self codeIsForFlat ].
	self doit inspect
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectPresenter >> actionSelect [

	self activeProject ifNil: [ ^ self ].
	self treeRadioButton state
		ifTrue: [ self codeIsForTree ]
		ifFalse: [ self codeIsForFlat ].
	self activeProject selection replaceAll:
		self doit
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectPresenter >> actionUnselect [

	self activeProject ifNil: [ ^ self ].
	self activeProject selection removeAll
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> activeProject [

	^ activeProject
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> activeProject: anObject [

	activeProject := anObject.
	allRadioButton click
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> allRadioButton [

	^ allRadioButton
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> codeIsForAll [

	self activeProject ifNil: [ ^ self ].
	self codePresenter interactionModel:
		(SpCodeObjectInteractionModel on:
			 (PyramidTreeToFlat flattenChildrenOfCollection:
				  self activeProject roots))
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> codeIsForRoots [

	self activeProject ifNil: [ ^ self ].
	self codePresenter interactionModel:
		(SpCodeObjectInteractionModel on: self activeProject roots)
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> codeIsForSelection [

	self activeProject ifNil: [ ^ self ].
	self codePresenter interactionModel:
		(SpCodeObjectInteractionModel on: self activeProject selection)
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> codePresenter [

	^ codePresenter
]

{ #category : #layout }
PyramidSearchAndSelectPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: self unselectButton;
				   add: self selectButton;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: self allRadioButton;
				   add: self rootsRadioButton;
				add: self selectionRadioButton;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: self codePresenter;
				   yourself)
		  expand: true;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: 'Examples' expand: false;
				   add: self examplesDropList expand: true;
				   yourself)
		  expand: false;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectPresenter >> doit [

	^ self codePresenter evaluate: self codePresenter text onCompileError: [ ^ {  } ] onError: [ ^ {  } ]. 
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> examplesDropList [

	^ examplesDropList
]

{ #category : #initialization }
PyramidSearchAndSelectPresenter >> initializeExamples [
	self examplesDropList items: PyramidSearchAndSelectModel default
]

{ #category : #initialization }
PyramidSearchAndSelectPresenter >> initializePresenters [

	codePresenter := SpCodePresenter new
		                 text: 'self';
		                 yourself.
	rootsRadioButton := SpRadioButtonPresenter new
		                   label: 'self = {roots}';
		                   yourself.
	selectionRadioButton := SpRadioButtonPresenter new
		                   label: 'self = {selection}';
		                   yourself.
	allRadioButton := SpRadioButtonPresenter new
		                   label: 'self = {all}';
		                   yourself.
	allRadioButton associatedRadioButtons: { selectionRadioButton . rootsRadioButton }.
	allRadioButton whenActivatedDo: [ self codeIsForAll ].
	selectionRadioButton whenActivatedDo: [ self codeIsForSelection ].
	rootsRadioButton whenActivatedDo: [ self codeIsForRoots ].
	
	unselectButton := SpButtonPresenter new
		                  label: 'unselect';
		                  action: [ self actionUnselect ];
		                  yourself.
	selectButton := SpButtonPresenter new
		                label: 'select';
		                action: [ self actionSelect ];
		                yourself.
	examplesDropList := SpDropListPresenter new
		                    display: [ :each | each name ];
		                    whenSelectedItemChangedDo: [ :model |
			                    self actionExample: model ];
		                    yourself.
	self initializeExamples
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> rootsRadioButton [

	^ rootsRadioButton
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> selectButton [

	^ selectButton
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> selectionRadioButton [

	^ selectionRadioButton
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> unselectButton [

	^ unselectButton
]
