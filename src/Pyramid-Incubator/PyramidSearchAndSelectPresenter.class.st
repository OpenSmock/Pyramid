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
		'projectModel'
	],
	#category : #'Pyramid-Incubator-plugin-hierarchy-selection-helper'
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

	self projectModel ifNil: [ ^ self ].
	
	self rootsRadioButton state ifTrue: [ self codeIsForRoots ].
	self selectionRadioButton state ifTrue: [ self codeIsForSelection ].
	self allRadioButton state ifTrue: [ self codeIsForAll ].
	
	self doit inspect
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectPresenter >> actionSelect [

	self projectModel ifNil: [ ^ self ].

	self rootsRadioButton state ifTrue: [ self codeIsForRoots ].
	self selectionRadioButton state ifTrue: [ self codeIsForSelection ].
	self allRadioButton state ifTrue: [ self codeIsForAll ].

	self projectModel selection replaceAll: self doit
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectPresenter >> actionUnselect [

	self projectModel ifNil: [ ^ self ].
	self projectModel selection removeAll
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> allRadioButton [

	^ allRadioButton
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> codeIsForAll [

	self projectModel ifNil: [ ^ self ].
	self codePresenter interactionModel:
		(SpCodeObjectInteractionModel on:
			 (PyramidElementsManipulationHelper flattenChildrenOfCollection:
				  self projectModel roots))
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> codeIsForRoots [

	self projectModel ifNil: [ ^ self ].
	self codePresenter interactionModel:
		(SpCodeObjectInteractionModel on: self projectModel roots)
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> codeIsForSelection [

	self projectModel ifNil: [ ^ self ].
	self codePresenter interactionModel:
		(SpCodeObjectInteractionModel on: self projectModel selection)
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
PyramidSearchAndSelectPresenter >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidSearchAndSelectPresenter >> projectModel: aPyramidProjectModel [

	projectModel := aPyramidProjectModel.
	allRadioButton click
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
