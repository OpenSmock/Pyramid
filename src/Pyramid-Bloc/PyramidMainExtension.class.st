Class {
	#name : #PyramidMainExtension,
	#superclass : #Object,
	#traits : 'TPyramidSpaceExtension + TPyramidEditorExtension + TPyramidEditorTransformationObserver',
	#classTraits : 'TPyramidSpaceExtension classTrait + TPyramidEditorExtension classTrait + TPyramidEditorTransformationObserver classTrait',
	#instVars : [
		'containerElement',
		'borderElement',
		'sizeElement',
		'workplacePropertiesButton',
		'workplacePropertiesView',
		'workplacePropertiesPopover',
		'gridWindowSize',
		'gridElement',
		'gridVisibility',
		'gridSpacing',
		'gridColor',
		'selectionWidgetExtension'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #accessing }
PyramidMainExtension >> borderElement [

	^ borderElement
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> checkZeroOrSubZeroGridSpacingValue: aValue [

	^ aValue < 1
]

{ #category : #accessing }
PyramidMainExtension >> containerElement [

	^ containerElement
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> createGrid [
	
	"Remove the current all the line of the grid"
	self gridElement removeChildWithId: #gridHorizontal.
	self gridElement removeChildWithId: #gridVertical.
	self gridElement removeChildWithId: #pixelGrid.
	
	"Create the grid if gridVisibility is true"
	gridVisibility ifTrue: [	self grid: self gridElement 
									cellSpacing: self gridSpacing 
									color: self gridColor 
									width: (self gridWindowSize x) 
									height: (self gridWindowSize y).
									self selectionWidgetExtension movingLap: self gridSpacing
								]
						ifFalse: [ self selectionWidgetExtension movingLap: 1 ].
	
	 
]

{ #category : #accessing }
PyramidMainExtension >> defaultBorder [

	^ BlBorder paint: Color blue width: 1
]

{ #category : #accessing }
PyramidMainExtension >> defaultExtent [

	^ 800 @ 600
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> defaultGridColor [
	"Default color value of the grid"
	^ Color black
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> defaultGridSpacing [
	"Default spacing value of the grid"
	^ 10
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> defaultGridVisibility [
	"Default visibility value of the grid"
	^ false
]

{ #category : #accessing }
PyramidMainExtension >> editor: aPyramidEditor [

	aPyramidEditor window at: #topRight addItem: [ :buttonBuilder |
		buttonBuilder makeButtonWithIcon: self workplacePropertiesButton order: 10 ].
	
	self getSelectionWidgetExtension: aPyramidEditor.
]

{ #category : #geometry }
PyramidMainExtension >> extent: aPoint [

	self elementAtWidgets extent: aPoint.
	self sizeElement extent: aPoint.
	self gridWindowSize: aPoint.

	self createGrid
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> getSelectionWidgetExtension: aPyramidEditor [

	| spacePlugin spacePluginList listOfSpaceExtension selectionWidgetExtensionSet |
	
	spacePluginList := aPyramidEditor plugins select: [ :plugin | plugin isKindOf: PyramidSpacePlugin ].
	spacePluginList size = 1
	ifFalse: [^ self].
	spacePlugin := spacePluginList asArray first.
	
	listOfSpaceExtension := spacePlugin builder extensions.
	selectionWidgetExtensionSet := listOfSpaceExtension select: [ :extensions | extensions isKindOf: PyramidSelectionWidgetExtension ].
	selectionWidgetExtensionSet size = 1
	ifFalse: [^ self].
	
	selectionWidgetExtension := (selectionWidgetExtensionSet asArray) first
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> grid: aParent cellSpacing: aCellSpacing color: aColor width: aWidth height: aHeight [
	"Creation of the grid used by createGrid"

	| elementGridHorizontal elementGridVertical nbLineGridHorizontal nbLineGridVertical lineGridModWidth lineGridModHeight cellSpacingSafe |
	
	cellSpacingSafe := aCellSpacing <= 0
		                   ifTrue: [ 1 ]
		                   ifFalse: [ aCellSpacing ].

	elementGridHorizontal := BlElement new id: #gridHorizontal.
	elementGridHorizontal constraints horizontal matchParent.
	elementGridHorizontal constraints vertical matchParent.

	elementGridVertical := BlElement new id: #gridVertical.
	elementGridVertical constraints horizontal matchParent.
	elementGridVertical constraints vertical matchParent.

	"Number of line Horizontal"
	lineGridModHeight := aHeight / cellSpacingSafe.
	nbLineGridHorizontal := lineGridModHeight isInteger
		                        ifTrue: [ (aHeight / cellSpacingSafe) - 1 ]
		                        ifFalse: [ aHeight / cellSpacingSafe ].

	1 to: nbLineGridHorizontal do: [ :i |
		| e |
		e := BlElement new.
		e background: aColor.
		e height: 0.5.
		e position: 0 @ (i * cellSpacingSafe) - 0.25.
		e constraints horizontal matchParent.
		elementGridHorizontal addChild: e ].

	"Number of line Vertical"
	lineGridModWidth := aWidth / cellSpacingSafe.
	nbLineGridVertical := lineGridModWidth isInteger
		                      ifTrue: [ (aWidth / cellSpacingSafe) - 1 ]
		                      ifFalse: [ aWidth / cellSpacingSafe ].

	1 to: nbLineGridVertical do: [ :i |
		| e |
		e := BlElement new.
		e background: aColor.
		e width: 0.5.
		e position: ((i * cellSpacingSafe) - 0.25) @ 0.
		e constraints vertical matchParent.
		elementGridVertical addChild: e ].

	aParent addChildren: {
			elementGridHorizontal.
			elementGridVertical }
]

{ #category : #accessing }
PyramidMainExtension >> gridColor [

	^ gridColor
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> gridDefaultValueInitializer [
	
	"Set the default parameter values of the grid"
	gridWindowSize := self defaultExtent.
	gridVisibility := self defaultGridVisibility.
	gridSpacing := self defaultGridSpacing.
	gridColor := self defaultGridColor.
	self createGrid.
]

{ #category : #accessing }
PyramidMainExtension >> gridElement [ 
	^ gridElement 
]

{ #category : #accessing }
PyramidMainExtension >> gridSpacing [
	^ gridSpacing
]

{ #category : #accessing }
PyramidMainExtension >> gridVisibility [
	^ gridVisibility 
]

{ #category : #accessing }
PyramidMainExtension >> gridWindowSize [
	^ gridWindowSize
]

{ #category : #accessing }
PyramidMainExtension >> gridWindowSize: aPoint [
	gridWindowSize := aPoint
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> informTransformationChanged [

	self elementAtEvents transformDo: [ :t |
		t translateBy: self currentTransformTranslation negated ].
]

{ #category : #initialization }
PyramidMainExtension >> initialize [
	"Set the default parameter value of the grid"

	gridWindowSize := self defaultExtent.
	gridVisibility := self defaultGridVisibility.
	gridSpacing := self defaultGridSpacing.
	gridColor := self defaultGridColor.

	"Set up the graphical parameter windows of the grid and the space extension"
	workplacePropertiesView := PyramidWorkplacePropertiesPresenter new
		                           workplaceSizeValue: self defaultExtent;
		                           whenWorkplaceValuesChangedDo: [ :point |
			                           self extent: point ];
		                           whenVisibilityChangedDo: [
			                           self switchGridvisibility.
			                           self createGrid ];
		                           spacingTextValue: self defaultGridSpacing;
		                           whenSpacingTextChangedDo: [ :value |
			                           (self checkZeroOrSubZeroGridSpacingValue: value)
				                           ifTrue: [ gridSpacing := self defaultGridSpacing ]
				                           ifFalse: [ gridSpacing := value ].
			                           self createGrid ];
		                           gridColorValue: self defaultGridColor;
		                           whenColorValuesChangedDo: [ :color |
			                           gridColor := color.
			                           self createGrid ];
		                           yourself.

	"Button of the pop-up windows properties who call the creation of the pop-up"
	workplacePropertiesButton := SpButtonPresenter new
		                             icon:
			                             (Smalltalk ui icons iconNamed: #window);
		                             help:
			                             'Edit the properties of the workplace';
		                             action: [
			                             self workplacePropertiesPopover popup.
			                             self refreshPopupWorkplaceProperties ];
		                             yourself.

	"Creation of the pop-up"
	workplacePropertiesPopover := PyramidPopoverFactory
		                              makeWithPresenter:
		                              self workplacePropertiesView
		                              relativeTo:
		                              self workplacePropertiesButton
		                              position: SpPopoverPosition left.

	containerElement := BlElement new
		                    id: #MainExtension_containerElement;
		                    constraintsDo: [ :c |
			                    c vertical matchParent.
			                    c horizontal matchParent ];
		                    clipChildren: false;
		                    zIndex: 0;
		                    yourself.

	"Blue frame in the space"
	borderElement := BlElement new
		                 id: #MainExtension_borderElement;
		                 border: self defaultBorder;
		                 outskirts: BlOutskirts outside;
		                 constraintsDo: [ :c |
			                 c vertical matchParent.
			                 c horizontal matchParent ];
		                 clipChildren: false;
		                 zIndex: 1;
		                 preventMeAndChildrenMouseEvents;
		                 yourself.

	"The BlElement contain the grid"
	gridElement := BlElement new
		               id: #MainExtension_gridElement;
		               constraintsDo: [ :c |
			               c vertical matchParent.
			               c horizontal matchParent ];
		               zIndex: 0.

	sizeElement := BlElement new
		               id: #MainExtension_sizeElement;
		               extent: self defaultExtent;
		               clipChildren: false;
		               addChildren: {
				               containerElement.
				               borderElement.
				               gridElement } yourself
]

{ #category : #displaying }
PyramidMainExtension >> installOn: aBuilder [

	self builder: aBuilder.
	aBuilder addTransformationObserver: self.
	self elementAtMain addChild: self sizeElement.
	self elementAtTransforms transformDo: [ :t |
		t translateBy: self offsetTranslation ].
	self builder signalTransformationChanged.
	self elementAtWidgets extent: self defaultExtent
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> offsetTranslation [

	^ 50 @ 50
]

{ #category : #accessing }
PyramidMainExtension >> projectModel: aProjectModel [

	aProjectModel announcer
		when: PyramidFirstLevelElementsChangedEvent
		do: [ :evt | self pyramidFirstLevelElementsChanged: evt ]
		for: self
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> pyramidFirstLevelElementsChanged: anEvent [

	self containerElement removeChildren.
	(anEvent firstLevelElements asArray sorted:
		 PyramidElevationSortFunction new) do: [ :each |
		each parent ifNotNil: [ :p | p removeChild: each ].
		self containerElement addChild: each ]
]

{ #category : #refresh }
PyramidMainExtension >> refreshPopupWorkplaceProperties [

	"Fix the current bug of the pop-up grow after each opening by recreating the component pop-up each time"
	workplacePropertiesPopover := PyramidPopoverFactory
		                 makeWithPresenter: workplacePropertiesView
		                 relativeTo: workplacePropertiesButton
		                 position: SpPopoverPosition left.
]

{ #category : #accessing }
PyramidMainExtension >> selectionWidgetExtension [

	^ selectionWidgetExtension
]

{ #category : #accessing }
PyramidMainExtension >> sizeElement [

	^ sizeElement
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> switchGridvisibility [
	"Switch the visibility from true to false or false to true"
	gridVisibility := self gridVisibility not.
	
	^ self gridVisibility
]

{ #category : #accessing }
PyramidMainExtension >> workplacePropertiesButton [

	^ workplacePropertiesButton
]

{ #category : #accessing }
PyramidMainExtension >> workplacePropertiesPopover [

	^ workplacePropertiesPopover
]

{ #category : #accessing }
PyramidMainExtension >> workplacePropertiesView [

	^ workplacePropertiesView
]
