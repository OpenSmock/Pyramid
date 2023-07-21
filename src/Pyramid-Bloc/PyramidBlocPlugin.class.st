Class {
	#name : #PyramidBlocPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
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
	property pyramidInputPresenterModel help:
		'Change the background of the element with a color, a gradient, an image'.
		property pyramidInputPresenterModel windowTitle: 'Change background'.
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
	property pyramidInputPresenterModel help: 'If clipChildren is true, the children will not display outside the geometry of the parent element. If clipChildren is false, the children will display outside the geometry of the parent element.'.
	property pyramidInputPresenterModel onLabel: 'True'.
	property pyramidInputPresenterModel offLabel:
		'False'.
	property pyramidInputPresenterModel uncertainLabel:
		'Uncertain'.
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
	property pyramidInputPresenterModel help: 'Change the id.'.
	^ property
]

{ #category : #'class initialization' }
PyramidBlocPlugin class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #accessing }
PyramidBlocPlugin class >> position [

	| property |
	property := PyramidProperty new
		            name: 'Position';
		            command: PyramidPositionCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterModel help:
		'Set the position x and y of the element inside his parent.'.
	^ property
]

{ #category : #'as yet unclassified' }
PyramidBlocPlugin >> connectOn: aPyramidEditor [
aPyramidEditor propertiesManager addProperty: self class elementId.
	aPyramidEditor propertiesManager addProperty: self class clipChildren.
	aPyramidEditor propertiesManager addProperty: self class position.
	aPyramidEditor propertiesManager addProperty: self class background.
	
]
