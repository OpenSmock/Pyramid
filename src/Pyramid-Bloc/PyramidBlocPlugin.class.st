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

{ #category : #'pyramid-serialized-bloc' }
PyramidBlocPlugin class >> blocVisibilityGone [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-08-02 09:26:40"

	<pyStash>
	^ [ | blinsets1 |
blinsets1 := BlInsets top: 0.0 right: 2.0 bottom: 0.0 left: 0.0.
{(BlElement new
   geometry: BlRectangleGeometry new;
   constraintsDo: [:constraints |  constraints horizontal exact: 24.0.
      constraints vertical exact: 12.0 ];
   layout: BlLinearLayout horizontal;
   addChildren: {(BlElement new
         background: (BlPaintBackground new
               paint: (BlColorPaint new
                     color: (Color r: 0.5728250244379277 g: 0.8191593352883676 b: 1.0 alpha: 1.0);
                     yourself);
               opacity: 1.0;
               yourself);
         border: (BlBorderBuilder new
               paint: (BlColorPaint new
                     color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0);
                     yourself);
               build);
         geometry: BlRectangleGeometry new;
         constraintsDo: [:constraints |  constraints horizontal matchParent.
            constraints vertical matchParent.
            constraints margin: blinsets1 ];
         id: #B;
         yourself) . 
      (BlElement new
         background: (BlPaintBackground new
               paint: (BlColorPaint new
                     color: (Color r: 0.5728250244379277 g: 0.8191593352883676 b: 1.0 alpha: 1.0);
                     yourself);
               opacity: 1.0;
               yourself);
         border: (BlBorderBuilder new
               paint: (BlColorPaint new
                     color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0);
                     yourself);
               build);
         geometry: BlRectangleGeometry new;
         constraintsDo: [:constraints |  constraints horizontal matchParent.
            constraints vertical matchParent.
            constraints margin: blinsets1 ];
         id: #C;
         yourself) . 
      (BlElement new
         background: (BlPaintBackground new
               paint: (BlColorPaint new
                     color: (Color r: 0.5728250244379277 g: 0.8191593352883676 b: 1.0 alpha: 1.0);
                     yourself);
               opacity: 1.0;
               yourself);
         border: (BlBorderBuilder new
               paint: (BlColorPaint new
                     color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0);
                     yourself);
               build);
         geometry: BlRectangleGeometry new;
         visibility: BlVisibility hidden;
         constraintsDo: [:constraints |  constraints horizontal matchParent.
            constraints vertical matchParent ];
         id: #D;
         yourself)};
   id: #A;
   yourself)} ] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidBlocPlugin class >> blocVisibilityHidden [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-08-02 09:25:56"

	<pyStash>
	^ [ | blinsets1 |
blinsets1 := BlInsets top: 0.0 right: 2.0 bottom: 0.0 left: 0.0.
{(BlElement new
   geometry: BlRectangleGeometry new;
   constraintsDo: [:constraints |  constraints horizontal exact: 24.0.
      constraints vertical exact: 12.0 ];
   layout: BlLinearLayout horizontal;
   addChildren: {(BlElement new
         background: (BlPaintBackground new
               paint: (BlColorPaint new
                     color: (Color r: 0.5728250244379277 g: 0.8191593352883676 b: 1.0 alpha: 1.0);
                     yourself);
               opacity: 1.0;
               yourself);
         border: (BlBorderBuilder new
               paint: (BlColorPaint new
                     color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0);
                     yourself);
               build);
         geometry: BlRectangleGeometry new;
         constraintsDo: [:constraints |  constraints horizontal matchParent.
            constraints vertical matchParent.
            constraints margin: blinsets1 ];
         id: #B;
         yourself) . 
      (BlElement new
         background: (BlPaintBackground new
               paint: (BlColorPaint new
                     color: (Color r: 0.863147605083089 g: 0.863147605083089 b: 0.863147605083089 alpha: 1.0);
                     yourself);
               opacity: 1.0;
               yourself);
         border: (BlBorderBuilder new
               paint: (BlColorPaint new
                     color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0);
                     yourself);
               build);
         geometry: BlRectangleGeometry new;
         constraintsDo: [:constraints |  constraints horizontal matchParent.
            constraints vertical matchParent.
            constraints margin: blinsets1 ];
         id: #C;
         yourself) . 
      (BlElement new
         background: (BlPaintBackground new
               paint: (BlColorPaint new
                     color: (Color r: 0.5728250244379277 g: 0.8191593352883676 b: 1.0 alpha: 1.0);
                     yourself);
               opacity: 1.0;
               yourself);
         border: (BlBorderBuilder new
               paint: (BlColorPaint new
                     color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0);
                     yourself);
               build);
         geometry: BlRectangleGeometry new;
         constraintsDo: [:constraints |  constraints horizontal matchParent.
            constraints vertical matchParent ];
         id: #D;
         yourself)};
   id: #A;
   yourself)} ] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidBlocPlugin class >> blocVisibilityVisible [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-08-02 09:24:49"

	<pyStash>
	^ [ | blinsets1 |
blinsets1 := BlInsets top: 0.0 right: 2.0 bottom: 0.0 left: 0.0.
{(BlElement new
   geometry: BlRectangleGeometry new;
   constraintsDo: [:constraints |  constraints horizontal exact: 24.0.
      constraints vertical exact: 12.0 ];
   layout: BlLinearLayout horizontal;
   addChildren: {(BlElement new
         background: (BlPaintBackground new
               paint: (BlColorPaint new
                     color: (Color r: 0.5728250244379277 g: 0.8191593352883676 b: 1.0 alpha: 1.0);
                     yourself);
               opacity: 1.0;
               yourself);
         border: (BlBorderBuilder new
               paint: (BlColorPaint new
                     color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0);
                     yourself);
               build);
         geometry: BlRectangleGeometry new;
         constraintsDo: [:constraints |  constraints horizontal matchParent.
            constraints vertical matchParent.
            constraints margin: blinsets1 ];
         id: #B;
         yourself) . 
      (BlElement new
         background: (BlPaintBackground new
               paint: (BlColorPaint new
                     color: (Color r: 0.5728250244379277 g: 0.8191593352883676 b: 1.0 alpha: 1.0);
                     yourself);
               opacity: 1.0;
               yourself);
         border: (BlBorderBuilder new
               paint: (BlColorPaint new
                     color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0);
                     yourself);
               build);
         geometry: BlRectangleGeometry new;
         constraintsDo: [:constraints |  constraints horizontal matchParent.
            constraints vertical matchParent.
            constraints margin: blinsets1 ];
         id: #C;
         yourself) . 
      (BlElement new
         background: (BlPaintBackground new
               paint: (BlColorPaint new
                     color: (Color r: 0.5728250244379277 g: 0.8191593352883676 b: 1.0 alpha: 1.0);
                     yourself);
               opacity: 1.0;
               yourself);
         border: (BlBorderBuilder new
               paint: (BlColorPaint new
                     color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0);
                     yourself);
               build);
         geometry: BlRectangleGeometry new;
         constraintsDo: [:constraints |  constraints horizontal matchParent.
            constraints vertical matchParent ];
         id: #D;
         yourself)};
   id: #A;
   yourself)} ] value
]

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
PyramidBlocPlugin class >> cornerRadii [

	| property |
	property := PyramidProperty new
		            name: 'Corner radius';
		            command: PyramidRoundedRectangleCornerRadiiCommand new;
		            inputPresenterClass:
			            PyramidCornerRadiiInputPresenter;
		            yourself.
	property inputPresenterModel help:
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
		            inputPresenterClass: PyramidTextInputPresenter;
		            yourself.
	property inputPresenterModel help: 'Change the id.'.
	^ property
]

{ #category : #accessing }
PyramidBlocPlugin class >> geometry [

	| property |
	property := PyramidProperty new
		            name: 'Geometry';
		            command: PyramidGeometryCommand new;
		            inputPresenterClass:
			            PyramidGeometryInputPresenter;
		            yourself.
	^ property
]

{ #category : #'as yet unclassified' }
PyramidBlocPlugin class >> iconOf: anObject [

	| target |
	target := anObject isCollection ifTrue: [ 
		 BlElement new constraintsDo: [ :c | c horizontal fitContent . c vertical fitContent ]; addChildren: anObject; yourself.
		 ] ifFalse: [anObject ].
	^ target exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidBlocPlugin class >> iconOf: aBlElement maxHeight: aNumber [

	| form scale |
	aBlElement isCollection ifTrue: [
		^ self
			  iconOf: aBlElement first
			  maxHeight: aNumber ].
	form := aBlElement exportAsForm.
	form height = 0 ifTrue: [ ^ form ].
	scale := aNumber / form height.
	^ form magnifyBy: scale
]

{ #category : #accessing }
PyramidBlocPlugin class >> visibility [

	| property |
	property := PyramidProperty new
		            name: 'Visibility2';
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
		'Change the elevation (#zIndex:). Bloc will used the elevation to determine wich of two sibling must be draw on top. The higher zIndex will be drawn on top of the lesser one.'.
	^ property
]

{ #category : #adding }
PyramidBlocPlugin >> addPanelsOn: aPyramidSimpleWindow [

	
	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self propertiesManager mainPresenter
			label: 'Properties'
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
	propertiesManager addProperty: self class clipChildren.
	propertiesManager addProperty: self class geometry.
	propertiesManager addProperty: self class cornerRadii
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
