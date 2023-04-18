Class {
	#name : #PyramidPropertyPresenterWithPopover,
	#superclass : #PyramidPropertyPresenter,
	#instVars : [
		'setDefaultBlock',
		'showPopoverButton',
		'statesDictionary',
		'popoverPresenter',
		'popover',
		'inputClass',
		'connectInputBlock'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyPresenterWithPopover class >> string [

	| presenter |
	presenter := self new.
	presenter
		inputClass: SpTextInputFieldPresenter;
		connectInputBlock: [ :input :dict | | col |
			col := dict values flatCollect: [ :e | e ].
			input whenSubmitDo: [
					presenter whenSubmitDo
						value: (PyramidPipelineTarget new collection: col)
						value: (PyramidCommandState new arguments: input text) ] ];
		setDefaultBlock: [ :input :dict | dict keys size = 1 ifTrue: [ input text: dict keys first arguments ] ifFalse: [ input text: '# mixed values' ] ].
	^ presenter
]

{ #category : #'as yet unclassified' }
PyramidPropertyPresenterWithPopover >> connectInputBlock [

	connectInputBlock ifNil: [
		connectInputBlock := [ :presenter :object |  ] ].
	^ connectInputBlock
]

{ #category : #'as yet unclassified' }
PyramidPropertyPresenterWithPopover >> connectInputBlock: aBlock [

	connectInputBlock := aBlock
]

{ #category : #'as yet unclassified' }
PyramidPropertyPresenterWithPopover >> createPopover [

	^ SpPopoverPresenter new
		  borderColor: Color black;
		  relativeTo: self showPopoverButton;
		  position: SpPopoverPosition left;
		  presenter: (SpPresenter new
				   layout: (SpBoxLayout newTopToBottom
						    borderWidth: 3;
						    spacing: 5;
						    add: self popoverPresenter;
						    add: (SpButtonPresenter new
								     label: 'Close';
								     action: [ self popover dismiss ];
								     yourself);
						    yourself);
				   yourself);
		  yourself
]

{ #category : #initialization }
PyramidPropertyPresenterWithPopover >> createPopoverPresenter [

	self model removeObserver: self popoverPresenter.
	popoverPresenter := PyramidPropertyOfAllPresenter new
		                    inputClass: self inputClass;
		                    model: self model;
		                    statesDictonaryChanged;
		                    yourself.
]

{ #category : #layout }
PyramidPropertyPresenterWithPopover >> defaultLayout [

	| input |
	input := self inputClass new.
	self setDefaultBlock value: input value: self model statesDictionary.
	self connectInputBlock value: input value: self model statesDictionary.

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self showPopoverButton expand: false;
		  add: input expand: true;
		  yourself
]

{ #category : #initialization }
PyramidPropertyPresenterWithPopover >> initializePresenters [

	popoverPresenter := PyramidPropertyOfAllPresenter new
		                    inputClass: self inputClass;
		                    model: self model;
		                    statesDictonaryChanged;
		                    yourself.

	showPopoverButton := SpButtonPresenter new
		                     icon: (self iconNamed: #edit);
		                     action: [ self showPopover ];
		                     yourself.

	popover := self createPopover
]

{ #category : #'as yet unclassified' }
PyramidPropertyPresenterWithPopover >> inputClass [

	inputClass ifNil: [ inputClass := SpNullPresenter ].
	^ inputClass
]

{ #category : #'as yet unclassified' }
PyramidPropertyPresenterWithPopover >> inputClass: aSpPresenterClass [

	inputClass := aSpPresenterClass.
	self popoverPresenter inputClass: aSpPresenterClass.
	self updateLayout
]

{ #category : #testing }
PyramidPropertyPresenterWithPopover >> model: aModel [
	super model: aModel.
	self popoverPresenter model: aModel
]

{ #category : #'as yet unclassified' }
PyramidPropertyPresenterWithPopover >> popover [

	^ popover
]

{ #category : #'as yet unclassified' }
PyramidPropertyPresenterWithPopover >> popoverPresenter [

	^ popoverPresenter
]

{ #category : #'as yet unclassified' }
PyramidPropertyPresenterWithPopover >> setDefaultBlock [

	setDefaultBlock ifNil: [ setDefaultBlock := [ :presenter :state |  ] ]..
	^ setDefaultBlock
]

{ #category : #'as yet unclassified' }
PyramidPropertyPresenterWithPopover >> setDefaultBlock: aBlock [

	setDefaultBlock := aBlock
]

{ #category : #'as yet unclassified' }
PyramidPropertyPresenterWithPopover >> showPopover [

	self popover popup
]

{ #category : #initialization }
PyramidPropertyPresenterWithPopover >> showPopoverButton [

	^ showPopoverButton
]

{ #category : #'as yet unclassified' }
PyramidPropertyPresenterWithPopover >> statesDictonaryChanged [

	self model statesDictionary keys size < 2
		ifTrue: [ self showPopoverButton enabled: false ]
		ifFalse: [ self showPopoverButton enabled: true ].
	self updateLayout
]
