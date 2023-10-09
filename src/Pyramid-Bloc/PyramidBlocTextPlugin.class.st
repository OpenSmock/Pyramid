Class {
	#name : 'PyramidBlocTextPlugin',
	#superclass : 'Object',
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#category : 'Pyramid-Bloc-plugin-bloc-text',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-text'
}

{ #category : 'accessing' }
PyramidBlocTextPlugin class >> changeText [

	| property |
	property := PyramidProperty new
		            name: 'Text';
		            command: PyramidChangeTextCommand new;
		            pyramidInputPresenterClass: PyramidTextInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Change the value of the text'.
	^ property
]

{ #category : 'accessing' }
PyramidBlocTextPlugin class >> fontSize [

	| property |
	property := PyramidProperty new
		            name: 'Font size';
		            command: PyramidFontSizeCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help: 'Change the font size.'.
	^ property
]

{ #category : 'accessing' }
PyramidBlocTextPlugin class >> fontWeight [

	| property |
	property := PyramidProperty new
		            name: 'Font weight';
		            command: PyramidFontWeightCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help: 'Change the font weight.'.
	^ property
]

{ #category : 'class initialization' }
PyramidBlocTextPlugin class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : 'accessing' }
PyramidBlocTextPlugin class >> textForeground [

	| property |
	property := PyramidProperty new
		            name: 'Text foreground';
		            command: PyramidTextForegroundCommand new;
		            pyramidInputPresenterClass:
			            PyramidColorInputSingleLineWithPickupButtonPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Change the color of the text'.
	^ property
]

{ #category : 'as yet unclassified' }
PyramidBlocTextPlugin >> connectOn: aPyramidEditor [

	aPyramidEditor propertiesManager addProperty: self class changeText.
	aPyramidEditor propertiesManager addProperty: self class fontSize.
	aPyramidEditor propertiesManager addProperty: self class fontWeight.
	aPyramidEditor propertiesManager addProperty: self class textForeground
]
