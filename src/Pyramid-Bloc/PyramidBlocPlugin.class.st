Class {
	#name : #PyramidBlocPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'editor',
		'groupCommand',
		'propertiesManager'
	],
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #accessing }
PyramidBlocPlugin class >> clipChildren [

	| property |
	property := PyramidProperty new
		            name: 'Clip Children';
		            command: PyramidClipChildrenCommand new;
		            inputPresenterClass: PyramidSwitchInputPresenter;
		            yourself.
	property inputPresenterModel help:
		'If clipChildren is true, the children will not display outside the geometry of the parent element. If clipChildren is false, the children will display outside the geometry of the parent element.'.
	property inputPresenterModel onLabel: 'True'.
	property inputPresenterModel offLabel: 'False'.
	property inputPresenterModel uncertainLabel: 'Uncertain'.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> elementId [

	| property |
	property := PyramidProperty new
		            name: 'Element ID';
		            command: PyramidElementIdCommand new;
		            inputPresenterClass: PyramidTextInputPresenter;
		            yourself.
	property inputPresenterModel help: 'Change the id.'.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> visibility [

	| property |
	property := PyramidProperty new
		            name: 'Visibility';
		            command: PyramidVisibilityCommand new;
		            inputPresenterClass: PyramidMagicButtonsInputPresenter;
		            yourself.
	property inputPresenterModel
		buttonExtent: 64 @ 24;
		addButtonModel: (PyramidMagicButtonModel new
				 icon: BlVisibility visible asIcon;
				 helpSelected: 'The object is visible.';
				 helpNotSelected: 'Set the value to visible.';
				 label: 'Visible';
				 inputValue: BlVisibility visible;
				 inputValidation: [ :value | value isVisible ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: BlVisibility hidden asIcon;
				 helpSelected:
					 'The object is hidden. (Still computed for the layout)';
				 helpNotSelected:
					 'Set the value to hidden. (Still computed for the layout)';
				 label: 'Hidden';
				 inputValue: BlVisibility hidden;
				 inputValidation: [ :value |
					 value isHidden and: [ value isGone not ] ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: BlVisibility gone asIcon;
				 helpSelected: 'The object is gone. (Not computed for the layout)';
				 helpNotSelected:
					 'Set the value to gone. (Not computed for the layout)';
				 label: 'Gone';
				 inputValue: BlVisibility gone;
				 inputValidation: [ :value | value isGone ];
				 yourself).
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> zIndex [

	| property |
	property := PyramidProperty new
		            name: 'Elevation';
		            command: PyramidZIndexCommand new;
		            inputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property inputPresenterModel help:
		'Change the elevation (#zIndex:). Bloc will use the elevation to determine wich of two siblings must be draw on top. The higher zIndex will be drawn on top of the lesser one.'.
	^ property
]

{ #category : #adding }
PyramidBlocPlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self propertiesManager mainPresenter
			label: 'Props'
			icon: (Smalltalk ui icons iconNamed: #box)
			order: 1 ].

	aPyramidSimpleWindow
		at: #selectionMenu
		addItem: [ :builder | self menuGroupOn: builder ].
	aPyramidSimpleWindow
		at: #selectionMenu
		addItem: [ :builder | self menuChangeOrderOn: builder ]
]

{ #category : #connecting }
PyramidBlocPlugin >> connectOn: aPyramidEditor [

	self editor: aPyramidEditor.
	
	"Configure the sort function."
	aPyramidEditor projectModel firstLevelElements sortFunction:
		PyramidElevationSortFunction new.
	
	propertiesManager projectModel: aPyramidEditor projectModel.
	propertiesManager commandExecutor: aPyramidEditor commandExecutor
]

{ #category : #accessing }
PyramidBlocPlugin >> editor [

	^ editor
]

{ #category : #accessing }
PyramidBlocPlugin >> editor: anObject [

	editor := anObject
]

{ #category : #'as yet unclassified' }
PyramidBlocPlugin >> groupCollection: aCollection [

	self editor ifNil: [ ^ self ].
	self editor commandExecutor
		use: self groupCommand
		on: { aCollection }
		with: self editor projectModel firstLevelElements
]

{ #category : #accessing }
PyramidBlocPlugin >> groupCommand [

	^ groupCommand
]

{ #category : #'as yet unclassified' }
PyramidBlocPlugin >> groupMenuBlock: group for: aCollection [

	group addItem: [ :item |
		item
			icon: (Smalltalk ui icons iconNamed: #collection);
			name: 'Group selection';
			enabled: true;
			action: [ self groupCollection: aCollection ];
			yourself ]
]

{ #category : #'as yet unclassified' }
PyramidBlocPlugin >> groupMenuBlockMulti [

	^ [ :group :multi | | copy |
		copy := multi asArray.
	  (self groupCommand canBeUsedFor: copy) ifTrue: [
		  self groupMenuBlock: group for: copy ] ]
]

{ #category : #'as yet unclassified' }
PyramidBlocPlugin >> groupMenuBlockSingle [

	^ [ :group :single | | copy |
		copy := { single }.
	  (self groupCommand canBeUsedFor: copy) ifTrue: [
		  self groupMenuBlock: group for: copy ] ]
]

{ #category : #initialization }
PyramidBlocPlugin >> initialize [

	super initialize.

	groupCommand := PyramidGroupCommand new.

	propertiesManager := PyramidPropertiesManagerForSelection new.

	propertiesManager addProperty: self class elementId.
	propertiesManager addProperty: self class visibility.
	propertiesManager addProperty: self class zIndex.
	propertiesManager addProperty: self class clipChildren
]

{ #category : #'as yet unclassified' }
PyramidBlocPlugin >> menuChangeOrderOn: aBuilder [

	aBuilder
		addGroupSingleSelection: [ :group :single |
			group
				addItem: [ :item |
					item
						icon: PyramidDrawOrderIcons formOnForeground;
						name: 'On foreground';
						enabled: true;
						action: [
							self send: PyramidOnForegroundOrderCommand new on: { single } ];
						yourself ];
				addItem: [ :item |
					item
						icon: PyramidDrawOrderIcons formOnBackground;
						name: 'On background';
						enabled: true;
						action: [
							self send: PyramidOnBackgroundOrderCommand new on: { single } ];
						yourself ];
				addItem: [ :item |
					item
						icon: PyramidDrawOrderIcons formMoveForward;
						name: 'Move forward';
						enabled: true;
						action: [
							self send: PyramidMoveForwardOrderCommand new on: { single } ];
						yourself ];
				addItem: [ :item |
					item
						icon: PyramidDrawOrderIcons formMoveBackward;
						name: 'Move backward';
						enabled: true;
						action: [
							self send: PyramidMoveBackwardOrderCommand new on: { single } ];
						yourself ];
				yourself ]
		order: 20
]

{ #category : #'as yet unclassified' }
PyramidBlocPlugin >> menuGroupOn: aBuilder [

	aBuilder addGroupSingleSelection: self groupMenuBlockSingle order: 20.
	aBuilder addGroupMultiSelection: self groupMenuBlockMulti order: 20
]

{ #category : #accessing }
PyramidBlocPlugin >> propertiesManager [

	^ propertiesManager
]

{ #category : #'as yet unclassified' }
PyramidBlocPlugin >> send: aCommand on: aCollection [

	self editor ifNil: [ ^ self ].
	self editor commandExecutor
		use: aCommand
		on: aCollection
		with: nil
]
