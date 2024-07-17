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

	<pyManualProperty>
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

	<pyManualProperty>
	| property |
	property := PyramidProperty new
		            name: 'Font weight';
		            command: PyramidFontWeightCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help: 'Change the font weight.'.
	^ property
]

{ #category : 'accessing' }
PyramidBlocTextPlugin class >> textForeground [

	<pyManualProperty>
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

{ #category : 'connecting' }
PyramidBlocTextPlugin >> connectOn: aPyramidEditor [

	(self class class methods select: [ :e |
		 e hasPragmaNamed: #pyManualProperty ]) do: [ :m |
		aPyramidEditor propertiesManager addProperty:
			(self class perform: m selector) ].

	BlTextElement new simpleReneDescription do: [ :propertyDescription |
		| property |
		property := PyramidMagritteProperty new magritteDescription:
			            propertyDescription.
		aPyramidEditor propertiesManager addProperty: property ]
]
