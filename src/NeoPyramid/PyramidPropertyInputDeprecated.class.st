Class {
	#name : #PyramidPropertyInputDeprecated,
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
PyramidPropertyInputDeprecated >> changePopoverVisibility [
	self popoverVisibility ifTrue: [ self hidePopover ] ifFalse: [ self showPopover ].
]

{ #category : #accessing }
PyramidPropertyInputDeprecated >> defaultInput [
	^ defaultInput
]

{ #category : #layout }
PyramidPropertyInputDeprecated >> defaultLayout [
	^ SpBoxLayout newHorizontal spacing: 4; add: self showPopoverButton; add: self defaultInput; yourself.
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputDeprecated >> hidePopover [

	self popover dismiss.
	popoverVisibility := false
]

{ #category : #initialization }
PyramidPropertyInputDeprecated >> initializeDefaultInput [


	defaultInput := self inputBuilder buildFromModel: self model
]

{ #category : #initialization }
PyramidPropertyInputDeprecated >> initializePopover [

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
PyramidPropertyInputDeprecated >> initializePresenters [

	showPopoverButton := SpButtonPresenter new
		                     icon: (self iconNamed: #edit);
		                     action: [ self showPopover ];
		                     enabled: false;
		                     yourself.

	self initializePopover.
	self initializeDefaultInput
]

{ #category : #initialization }
PyramidPropertyInputDeprecated >> initiliazeMultiInputs [

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
PyramidPropertyInputDeprecated >> inputBuilder [

	inputBuilder ifNil: [ inputBuilder := PyramidInputBuilderDeprecated null ].
	^ inputBuilder
]

{ #category : #accessing }
PyramidPropertyInputDeprecated >> inputBuilder: aBuilder [

	inputBuilder := aBuilder.
	self initializeDefaultInput 
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputDeprecated >> inputSubmited [

	
]

{ #category : #accessing }
PyramidPropertyInputDeprecated >> model [

	model ifNil: [ model := PyramidPropertyModel new addObserver: self; yourself ].
	^ model
]

{ #category : #accessing }
PyramidPropertyInputDeprecated >> model: anObject [

	self model removeObserver: self.
	model := anObject.
	model addObserver: self.
	self propertyModelChanged
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputDeprecated >> popover [

	^ popover
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputDeprecated >> popoverHeight [

	^ 300
]

{ #category : #accessing }
PyramidPropertyInputDeprecated >> popoverVisibility [

	popoverVisibility ifNil: [ popoverVisibility := false ].
	^ popoverVisibility
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputDeprecated >> popoverWidth [
	^ 300
]

{ #category : #accessing }
PyramidPropertyInputDeprecated >> property [

]

{ #category : #'as yet unclassified' }
PyramidPropertyInputDeprecated >> propertyModelChanged [

	self updateShowPopoverButton.
	self updateDefaultInput.
	self popoverVisibility
		ifTrue: [ self showPopover ]
		ifFalse: [ self hidePopover ]
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputDeprecated >> showPopover [

	self popover dismiss.
	self initializePopover.
	self popover popup.
	popoverVisibility := true
]

{ #category : #accessing }
PyramidPropertyInputDeprecated >> showPopoverButton [
	^ showPopoverButton
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputDeprecated >> updateDefaultInput [

	self model states size = 0 ifTrue: [
		self inputBuilder noStateTo: self defaultInput.
		^ self ].
	self model states size = 1 ifTrue: [
		self inputBuilder singleState: self model states first to: self defaultInput.
		^ self ].
	self inputBuilder multiStates: self model states to: self defaultInput.
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputDeprecated >> updateShowPopoverButton [

	(self model allElements size > 1 )
		ifTrue: [ self showPopoverButton enabled: true ]
		ifFalse: [ self showPopoverButton enabled: false ]
]
