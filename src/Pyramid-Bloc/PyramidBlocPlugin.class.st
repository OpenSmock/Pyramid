Class {
	#name : #PyramidBlocPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'editor',
		'groupCommand'
	],
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #accessing }
PyramidBlocPlugin class >> background [

	| property |
	property := PyramidProperty new
		            name: 'Background';
		            command: PyramidBackgroundCommand new;
		            pyramidInputPresenterClass:
			            PyramidBackgroundInputWithModalPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Change the background of the element with a color, a gradient, an image.'.
	property pyramidInputPresenterStrings windowTitle: 'Change background'.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> clipChildren [

	| property |
	property := PyramidProperty new
		            name: 'Clip Children';
		            command: PyramidClipChildrenCommand new;
		            pyramidInputPresenterClass: PyramidSwitchInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'If clipChildren is true, the children will not display outside the geometry of the parent element. If clipChildren is false, the children will display outside the geometry of the parent element.'.
	property pyramidInputPresenterStrings onLabel: 'True'.
	property pyramidInputPresenterStrings offLabel: 'False'.
	property pyramidInputPresenterStrings uncertainLabel: 'Uncertain'.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> constraintsBasicH [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - horizontal';
		            command:
			            PyramidBasicHorizontalConstraintsBlocCommand new;
		            pyramidInputPresenterClass:
			            PyramidBasicConstraintsInputPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> constraintsBasicHExact [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - width';
		            command:
			            PyramidBasicExactHorizontalConstraintsBlocCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Change the width of the object'.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> constraintsBasicV [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - vertical';
		            command:
			            PyramidBasicVerticalConstraintsBlocCommand new;
		            pyramidInputPresenterClass:
			            PyramidBasicConstraintsInputPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> constraintsBasicVExact [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - height';
		            command:
			            PyramidBasicExactVerticalConstraintsBlocCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Change the height of the object'.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> constraintsFrameH [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - Frame - horizontal';
		            command: PyramidFrameHorizontalConstraintsCommand new;
		            pyramidInputPresenterClass:
			            PyramidHorizontalFrameConstraintsInputPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> constraintsFrameV [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - Frame - vertical';
		            command: PyramidFrameVerticalConstraintsCommand new;
		            pyramidInputPresenterClass:
			            PyramidVerticalFrameConstraintsInputPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> constraintsPropH [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - Proportionnal - horizontal';
		            command:
			            PyramidProportionnalHorizontalConstraintsCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		help: 'Define the proportion of the horizontal component.';
		labelX: 'Left';
		labelY: 'Right'.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> constraintsPropV [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - Proportionnal - vertical';
		            command:
			            PyramidProportionnalVerticalConstraintsCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		help: 'Define the proportion of the vertical component.';
		labelX: 'Top';
		labelY: 'Bottom'.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> cornerRadii [

	| property |
	property := PyramidProperty new
		            name: 'Corner radius';
		            command: PyramidRoundedRectangleCornerRadiiCommand new;
		            pyramidInputPresenterClass:
			            PyramidCornerRadiiInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Change the corner radius of the geometry. For example:
	- "10" to set a radius of 10 px on each corner.
	- "10 20" to set a radius of 10 px on the top-left and bottom-right corner and 20 px on the top-right and bottom-left corner.
	- "10 20 30 40" to set a radius of 10 px on top-left, 20 px on top-right, 30 px on bottom-right and 40 px on bottom-left.'.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> elementId [

	| property |
	property := PyramidProperty new
		            name: 'Element ID';
		            command: PyramidElementIdCommand new;
		            pyramidInputPresenterClass: PyramidTextInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help: 'Change the id.'.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> flowLayoutOrientation [

	| property |
	property := PyramidProperty new
		            name: 'Orientation';
		            command: PyramidFlowLayoutChangeOrientationCommand new;
		            pyramidInputPresenterClass:
			            PyramidFlowLayoutOrientationPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Change the orientation of the flow layout.'.
	property pyramidInputPresenterStrings onLabel: 'Vertical'.
	property pyramidInputPresenterStrings offLabel: 'Horizontal'.
	property pyramidInputPresenterStrings uncertainLabel: 'Uncertain'.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> geometry [

	| property |
	property := PyramidProperty new
		            name: 'Geometry';
		            command: PyramidGeometryCommand new;
		            pyramidInputPresenterClass:
			            PyramidGeometryInputPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> layout [

	| property |
	property := PyramidProperty new
		            name: 'Layout';
		            command: PyramidLayoutBlocCommand new;
		            pyramidInputPresenterClass: PyramidLayoutInputPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> margin [

	| property |
	property := PyramidProperty new
		            name: 'Margin';
		            command: PyramidMarginCommand new;
		            pyramidInputPresenterClass: PyramidInsetsInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help: 		'Change the margin. The margin will affect the space between the border and the elements outside. For example:
	- "10" to set a margin of 10 px on each size.
	- "10 20" to set a margin of 10 px on the top and bottom and 20 px on the right and left.
	- "10 20 30 40" to set a margin of 10 px on top, 20 px on left, 30 px on bottom and 40 px on right.'..
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> padding [

	| property |
	property := PyramidProperty new
		            name: 'Padding';
		            command: PyramidPaddingCommand new;
		            pyramidInputPresenterClass: PyramidInsetsInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Change the padding. The padding will affect the space between the border and the elements inside. For example:
	- "10" to set a padding of 10 px on each size.
	- "10 20" to set a padding of 10 px on the top and bottom and 20 px on the right and left.
	- "10 20 30 40" to set a padding of 10 px on top, 20 px on left, 30 px on bottom and 40 px on right.'.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> position [

	| property |
	property := PyramidProperty new
		            name: 'Position';
		            command: PyramidPositionCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Set the position x and y of the element inside his parent.'.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> visibility [

	| property |
	property := PyramidProperty new
		            name: 'Visibility';
		            command: PyramidVisibilityCommand new;
		            pyramidInputPresenterClass: PyramidVisibilityInputPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> zIndex [

	| property |
	property := PyramidProperty new
		            name: 'Elevation';
		            command: PyramidZIndexCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Change the elevation (#zIndex:). Bloc will used the elevation to determine wich of two sibling must be draw on top. The higher zIndex will be drawn on top of the lesser one.'.
	^ property
]

{ #category : #adding }
PyramidBlocPlugin >> addPanelsOn: aPyramidSimpleWindow [

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
	aPyramidEditor propertiesManager addProperty: self class elementId.
	aPyramidEditor propertiesManager addProperty: self class visibility.
	aPyramidEditor propertiesManager addProperty: self class zIndex.
	aPyramidEditor propertiesManager addProperty: self class clipChildren.
	aPyramidEditor propertiesManager addProperty: self class geometry.
	aPyramidEditor propertiesManager addProperty: self class cornerRadii.
	aPyramidEditor propertiesManager addProperty: self class position.

	aPyramidEditor propertiesManager addProperty: self class layout.
	aPyramidEditor propertiesManager addProperty:
		self class flowLayoutOrientation.

	"Constraints - horizontal"
	aPyramidEditor propertiesManager addProperty:
		self class constraintsFrameH.
	aPyramidEditor propertiesManager addProperty:
		self class constraintsPropH.
	aPyramidEditor propertiesManager addProperty:
		self class constraintsBasicH.
	aPyramidEditor propertiesManager addProperty:
		self class constraintsBasicHExact.

	"Constraints - vertical"
	aPyramidEditor propertiesManager addProperty:
		self class constraintsFrameV.
	aPyramidEditor propertiesManager addProperty:
		self class constraintsPropV.
	aPyramidEditor propertiesManager addProperty:
		self class constraintsBasicV.
	aPyramidEditor propertiesManager addProperty:
		self class constraintsBasicVExact.
	aPyramidEditor propertiesManager addProperty: self class background.
	aPyramidEditor propertiesManager addProperty: self class padding.
	aPyramidEditor propertiesManager addProperty: self class margin
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
	self editor propertiesManager commandExecutor
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
			icon: (self iconNamed: #collection);
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

	groupCommand := PyramidGroupCommand new
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

{ #category : #'as yet unclassified' }
PyramidBlocPlugin >> send: aCommand on: aCollection [

	self editor ifNil: [ ^ self ].
	self editor propertiesManager commandExecutor
		use: aCommand
		on: aCollection
		with: nil
]
