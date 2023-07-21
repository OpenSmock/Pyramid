Class {
	#name : #PyramidPropertiesPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin + TPyramidProjectModelObserver',
	#classTraits : 'TPyramidPlugin classTrait + TPyramidProjectModelObserver classTrait',
	#instVars : [
		'undoButton',
		'redoButton',
		'history',
		'projectModel'
	],
	#category : #'NeoPyramid-property'
}

{ #category : #accessing }
PyramidPropertiesPlugin class >> background [

	| property |
	property := NeoPyramidProperty new
		            name: 'Background';
		            command: NeoPyramidBackgroundCommand new;
		            pyramidInputPresenterClass:
			            PyramidBackgroundInputWithModalPresenter;
		            yourself.
	property pyramidInputPresenterModel help:
		'Change the background of the element with a color, a gradient, an image'.
		property pyramidInputPresenterModel windowTitle: 'Change background'.
	^ property
]

{ #category : #accessing }
PyramidPropertiesPlugin class >> clipChildren [

	| property |
	property := NeoPyramidProperty new
		            name: 'Clip Children';
		            command: NeoPyramidClipChildrenCommand new;
		            pyramidInputPresenterClass: PyramidSwitchInputPresenter;
		            yourself.
	property pyramidInputPresenterModel help: 'If clipChildren is true, the children will not display outside the geometry of the parent element. If clipChildren is false, the children will display outside the geometry of the parent element.'.
	property pyramidInputPresenterModel onLabel: 'True'.
	property pyramidInputPresenterModel offLabel:
		'False'.
	property pyramidInputPresenterModel uncertainLabel:
		'Uncertain'.
	^ property
]

{ #category : #accessing }
PyramidPropertiesPlugin class >> elementId [

	| property |
	property := NeoPyramidProperty new
		            name: 'Element ID';
		            command: NeoPyramidElementIdCommand new;
		            pyramidInputPresenterClass: PyramidTextInputPresenter;
		            yourself.
	property pyramidInputPresenterModel help: 'Change the id.'.
	^ property
]

{ #category : #'class initialization' }
PyramidPropertiesPlugin class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #accessing }
PyramidPropertiesPlugin class >> position [

	| property |
	property := NeoPyramidProperty new
		            name: 'Position';
		            command: NeoPyramidPositionCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterModel help:
		'Set the position x and y of the element inside his parent.'.
	^ property
]

{ #category : #adding }
PyramidPropertiesPlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow
		at: #topCenter
		addItem: [ :builder |
		builder makeButtonWithIcon: self undoButton order: 10 ].
	aPyramidSimpleWindow
		at: #topCenter
		addItem: [ :builder |
		builder makeButtonWithIcon: self redoButton order: 20 ]
]

{ #category : #'as yet unclassified' }
PyramidPropertiesPlugin >> connectOn: aPyramidEditor [

	aPyramidEditor propertiesManager addProperty: self class elementId.
	aPyramidEditor propertiesManager addProperty: self class clipChildren.
	aPyramidEditor propertiesManager addProperty: self class position.
	aPyramidEditor propertiesManager addProperty: self class background.
	self history: aPyramidEditor propertiesManager history.
	self projectModel: aPyramidEditor projectModel.
	self pyramidSelectionChanged
]

{ #category : #accessing }
PyramidPropertiesPlugin >> history [

	^ history
]

{ #category : #accessing }
PyramidPropertiesPlugin >> history: anObject [

	history := anObject
]

{ #category : #'as yet unclassified' }
PyramidPropertiesPlugin >> initialize [

	undoButton := SpButtonPresenter new
		              icon: (self iconNamed: #smallUndo);
		              action: [
			              self history undo.
			              self projectModel informElementsChanged ];
		              help: 'Undo';
		              yourself.
	redoButton := SpButtonPresenter new
		              icon: (self iconNamed: #smallRedo);
		              action: [
			              self history redo.
			              self projectModel informElementsChanged ];
		              help: 'Redo';
		              yourself
]

{ #category : #accessing }
PyramidPropertiesPlugin >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidPropertiesPlugin >> projectModel: anObject [

	projectModel := anObject.
	anObject addObserver: self.
]

{ #category : #'as yet unclassified' }
PyramidPropertiesPlugin >> pyramidElementsChanged [

	undoButton enabled: self history canUndo.
	redoButton enabled: self history canRedo
]

{ #category : #accessing }
PyramidPropertiesPlugin >> redoButton [

	^ redoButton
]

{ #category : #accessing }
PyramidPropertiesPlugin >> undoButton [

	^ undoButton
]
