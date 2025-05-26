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
		'gridColor'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #accessing }
PyramidMainExtension >> borderElement [

	^ borderElement
]

{ #category : #accessing }
PyramidMainExtension >> containerElement [

	^ containerElement
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> createGrid [
	
	self gridElement removeChildWithId: #gridHorizontal.
	self gridElement removeChildWithId: #gridVertical.
	
	gridVisibility ifTrue: [ self grid: gridElement 
									cellSpacing: gridSpacing 
									color: gridColor 
									width: (gridWindowSize x) 
									height: (gridWindowSize y).
								].
				
	
	 
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
	^ Color black
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> defaultGridSpacing [
	^ 10
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> defaultGridVisibility [
	^ false
]

{ #category : #accessing }
PyramidMainExtension >> editor: aPyramidEditor [

	aPyramidEditor window at: #topRight addItem: [ :buttonBuilder |
		buttonBuilder makeButtonWithIcon: self windowPropertiesButton order: 10 ]
]

{ #category : #geometry }
PyramidMainExtension >> extent: aPoint [

	self elementAtWidgets size: aPoint.
	self sizeElement size: aPoint.
	self gridWindowSize: aPoint.
	
	self createGrid.
	

]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> grid: aParent cellSpacing: aNumber color: aColor width: aWidth height: aHeight [

	| elementGridHorizontal elementGridVertical nbLineGridHorizontal nbLineGridVertical lineGridModWidth lineGridModHeight |
	elementGridHorizontal := BlElement new id: #gridHorizontal.
	elementGridHorizontal layout: BlLinearLayout vertical.
	elementGridHorizontal layout cellSpacing: aNumber - 1.
	elementGridHorizontal constraints horizontal matchParent.
	elementGridHorizontal constraints vertical matchParent.

	elementGridVertical := BlElement new id: #gridVertical.
	elementGridVertical layout: BlLinearLayout horizontal.
	elementGridVertical layout cellSpacing: aNumber - 1.
	elementGridVertical constraints horizontal matchParent.
	elementGridVertical constraints vertical matchParent.

	"Number of line Horizontal"
	lineGridModHeight := aHeight / aNumber.
	nbLineGridHorizontal := lineGridModHeight isInteger
		                      ifTrue: [ aHeight / aNumber - 1 ]
		                      ifFalse: [ aHeight / aNumber ].

	1 to: nbLineGridHorizontal do: [ :i |
		| e |
		e := BlElement new.
		e background: aColor.
		e border: aColor.
		e height: 1.
		e constraints horizontal matchParent.
		elementGridHorizontal addChild: e ].

	"Number of line Vertical"
	lineGridModWidth := aWidth / aNumber.
	nbLineGridVertical := lineGridModWidth isInteger
		                      ifTrue: [ aWidth / aNumber - 1 ]
		                      ifFalse: [ aWidth / aNumber ].


	1 to: nbLineGridVertical do: [ :i |
		| e |
		e := BlElement new.
		e background: aColor.
		e border: aColor.
		e width: 1.
		e constraints vertical matchParent.
		elementGridVertical addChild: e ].

	aParent addChildren: {
			elementGridHorizontal.
			elementGridVertical }
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> gridDefaultValueInitializer [
	
	gridWindowSize := self defaultExtent.
	gridVisibility := self defaultGridVisibility.
	gridSpacing := self defaultGridSpacing.
	gridColor := self defaultGridColor.
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

	gridWindowSize := self defaultExtent.
	gridVisibility := self defaultGridVisibility.
	gridSpacing := self defaultGridSpacing.
	gridColor := self defaultGridColor.
	
	workplacePropertiesView := PyramidWorkplacePropertiesPresenter new
									workplaceSizeValue: self defaultExtent;
									whenWorkplaceValuesChangedDo: [ :point | 
																		self extent: point ];	
									whenVisibilityChangedDo: [ gridVisibility := self gridVisibility not. 
																		self createGrid ];
									spacingTextValue: self defaultGridSpacing;
									whenSpacingTextChangedDo: [ :value | 
																		gridSpacing := value. self createGrid ];
									gridColorValue: self defaultGridColor;
									whenColorValuesChangedDo: [ :color | 
																		gridColor := color. self createGrid ];
									yourself.
	
	workplacePropertiesButton := SpButtonPresenter new
		                icon: (Smalltalk ui icons iconNamed: #window);
		                help: 'Edit the properties of the workplace';
		                action: [ workplacePropertiesPopover popup. self refreshPopupWorkplaceProperties ];
		                yourself.
	
	workplacePropertiesPopover := PyramidPopoverFactory
		                 makeWithPresenter: workplacePropertiesView
		                 relativeTo: workplacePropertiesButton
		                 position: SpPopoverPosition left.

	containerElement := BlElement new
		                    id: #MainExtension_containerElement;
		                    constraintsDo: [ :c |
			                    c vertical matchParent.
			                    c horizontal matchParent ];
		                    clipChildren: false;
		                    zIndex: 0;
		                    yourself.
	
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
	
	gridElement := BlElement new
							id: #MainExtension_gridElement;
							constraintsDo: [ :c |
								c vertical matchParent.
								c horizontal matchParent ];
							zIndex: 0.
	
	sizeElement := BlElement new
		               id: #MainExtension_sizeElement;
		               size: self defaultExtent;
		               clipChildren: false;
		               addChildren: {
				               containerElement.
				               borderElement.
									gridElement
											 } yourself.
	
]

{ #category : #displaying }
PyramidMainExtension >> installOn: aBuilder [

	self builder: aBuilder.
	aBuilder addTransformationObserver: self.
	self elementAtMain addChild: self sizeElement.
	self elementAtTransforms transformDo: [ :t |
		t translateBy: self offsetTranslation ].
	self builder signalTransformationChanged.
	self elementAtWidgets size: self defaultExtent
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

	workplacePropertiesPopover := PyramidPopoverFactory
		                 makeWithPresenter: workplacePropertiesView
		                 relativeTo: workplacePropertiesButton
		                 position: SpPopoverPosition left.
]

{ #category : #accessing }
PyramidMainExtension >> sizeElement [

	^ sizeElement
]

{ #category : #accessing }
PyramidMainExtension >> windowPropertiesButton [

	^ workplacePropertiesButton
]
