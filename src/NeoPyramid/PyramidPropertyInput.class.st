Class {
	#name : #PyramidPropertyInput,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'showPopoverButton',
		'popover',
		'inputBuilder',
		'defaultInput',
		'popoverVisibility'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #'as yet unclassified' }
PyramidPropertyInput >> changePopoverVisibility [
	self popoverVisibility ifTrue: [ self hidePopover ] ifFalse: [ self showPopover ].
]

{ #category : #accessing }
PyramidPropertyInput >> defaultInput [
	^ defaultInput
]

{ #category : #layout }
PyramidPropertyInput >> defaultLayout [
	^ SpBoxLayout newHorizontal spacing: 4; add: self showPopoverButton; add: self defaultInput; yourself.
]

{ #category : #'as yet unclassified' }
PyramidPropertyInput >> hidePopover [

	self popover dismiss.
	popoverVisibility := false
]

{ #category : #initialization }
PyramidPropertyInput >> initializeDefaultInput [


	defaultInput := self inputBuilder buildFromModel: self model
]

{ #category : #initialization }
PyramidPropertyInput >> initializePopover [

	popover := SpPopoverPresenter new
		           borderColor: Color black;
		           relativeTo: self showPopoverButton;
		           position: SpPopoverPosition left;
		           presenter: (SpPresenter new
				            layout: (SpBoxLayout newTopToBottom
						             borderWidth: 3;
						             spacing: 5;
						             add: self initiliazeMultiInputs;
						             add: (SpButtonPresenter new
								              label: 'Close';
								              action: [
									              self changePopoverVisibility ];
								              yourself);
						             yourself);
				            yourself);
		           yourself
]

{ #category : #initialization }
PyramidPropertyInput >> initializePresenters [

	showPopoverButton := SpButtonPresenter new
		                     icon: (self iconNamed: #edit);
		                     action: [ self showPopover ];
		                     enabled: false;
		                     yourself.

	self initializePopover.
	self initializeDefaultInput
]

{ #category : #initialization }
PyramidPropertyInput >> initiliazeMultiInputs [

	| height scroll multiInputsLayout |
	multiInputsLayout := SpBoxLayout newVertical spacing: 4.
	height := 0.
	self model states do: [ :state |
		state source do: [ :each |
			height := height + 25.
			multiInputsLayout
				add:
				(self inputBuilder buildFromSingleObject: each withState: state forModel: self model)
				withConstraints: [ :c | c width: self popoverWidth ] ] ].
	height > self popoverHeight
		ifTrue: [
			scroll := SpScrollableLayout new.
			scroll child: multiInputsLayout.
			^ SpBoxLayout newVertical
				  add: scroll withConstraints: [ :c |
					  c width: self popoverWidth.
					  c height: self popoverHeight ];
				  yourself ]
		ifFalse: [ ^ multiInputsLayout ]
]

{ #category : #accessing }
PyramidPropertyInput >> inputBuilder [

	inputBuilder ifNil: [ inputBuilder := PyramidInputBuilder null ].
	^ inputBuilder
]

{ #category : #accessing }
PyramidPropertyInput >> inputBuilder: aBuilder [

	inputBuilder := aBuilder.
	self initializeDefaultInput 
]

{ #category : #'as yet unclassified' }
PyramidPropertyInput >> inputSubmited [

	
]

{ #category : #accessing }
PyramidPropertyInput >> model [

	model ifNil: [ model := PyramidPropertyModel new addObserver: self; yourself ].
	^ model
]

{ #category : #accessing }
PyramidPropertyInput >> model: anObject [

	self model removeObserver: self.
	model := anObject.
	model addObserver: self.
	self propertyModelChanged
]

{ #category : #'as yet unclassified' }
PyramidPropertyInput >> popover [

	^ popover
]

{ #category : #'as yet unclassified' }
PyramidPropertyInput >> popoverHeight [

	^ 300
]

{ #category : #accessing }
PyramidPropertyInput >> popoverVisibility [

	popoverVisibility ifNil: [ popoverVisibility := false ].
	^ popoverVisibility
]

{ #category : #'as yet unclassified' }
PyramidPropertyInput >> popoverWidth [
	^ 300
]

{ #category : #accessing }
PyramidPropertyInput >> property [

]

{ #category : #'as yet unclassified' }
PyramidPropertyInput >> propertyModelChanged [

	self updateShowPopoverButton.
	self updateDefaultInput.
	self popoverVisibility
		ifTrue: [ self showPopover ]
		ifFalse: [ self hidePopover ]
]

{ #category : #'as yet unclassified' }
PyramidPropertyInput >> showPopover [

	self popover dismiss.
	self initializePopover.
	self popover popup.
	popoverVisibility := true
]

{ #category : #accessing }
PyramidPropertyInput >> showPopoverButton [
	^ showPopoverButton
]

{ #category : #'as yet unclassified' }
PyramidPropertyInput >> updateDefaultInput [

	self model states size = 0 ifTrue: [
		self inputBuilder noStateTo: self defaultInput.
		^ self ].
	self model states size = 1 ifTrue: [
		self inputBuilder singleState: self model states first to: self defaultInput.
		^ self ].
	self inputBuilder multiStates: self model states to: self defaultInput.
]

{ #category : #'as yet unclassified' }
PyramidPropertyInput >> updateShowPopoverButton [

	(self model allElements size > 1 )
		ifTrue: [ self showPopoverButton enabled: true ]
		ifFalse: [ self showPopoverButton enabled: false ]
]
