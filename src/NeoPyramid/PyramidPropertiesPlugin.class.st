Class {
	#name : #PyramidPropertiesPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'manager'
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

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self manager presenter
			label: 'Manager'
			icon: (self iconNamed: #box)
			order: 2 ]
]

{ #category : #'as yet unclassified' }
PyramidPropertiesPlugin >> connectOn: aPyramidEditor [

	self manager projectModel: aPyramidEditor projectModel
]

{ #category : #initialization }
PyramidPropertiesPlugin >> initialize [

	manager := PyramidPropertiesManagerForSelection new.
	manager addProperty: self class elementId.
	manager addProperty: self class clipChildren.
	manager addProperty: self class position.
	manager addProperty: self class background
]

{ #category : #accessing }
PyramidPropertiesPlugin >> manager [

	^ manager
]

{ #category : #accessing }
PyramidPropertiesPlugin >> manager: anObject [

	manager := anObject
]
