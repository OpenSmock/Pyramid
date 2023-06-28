Class {
	#name : #PyramidSearchAndSelectPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'unselectButton',
		'flatRadioButton',
		'treeRadioButton',
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

	aModel isTree
		ifTrue: [
			self treeRadioButton click ]
		ifFalse: [
			self flatRadioButton click ].
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
	flatRadioButton click.
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> codeIsForFlat [

	self activeProject ifNil: [ ^ self ].
	self codePresenter interactionModel:
		(SpCodeObjectInteractionModel on:
			 (PyramidTreeToFlat flattenChildrenOfCollection:
				  self activeProject roots))
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> codeIsForTree [

	self activeProject ifNil: [ ^ self ].
	self codePresenter interactionModel:
		(SpCodeObjectInteractionModel on: self activeProject roots)
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
				   add: self flatRadioButton;
				   add: self treeRadioButton;
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

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> flatRadioButton [

	^ flatRadioButton
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
	treeRadioButton := SpRadioButtonPresenter new
		                   label: 'self = tree';
		                   yourself.
	flatRadioButton := SpRadioButtonPresenter new
		                   label: 'self = flat';
		                   yourself.
	treeRadioButton associatedRadioButtons: { flatRadioButton }.
	treeRadioButton whenActivatedDo: [ self codeIsForTree ].
	flatRadioButton whenActivatedDo: [ self codeIsForFlat ].

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
PyramidSearchAndSelectPresenter >> selectButton [

	^ selectButton
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> treeRadioButton [

	^ treeRadioButton
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> unselectButton [

	^ unselectButton
]
