Class {
	#name : #PyramidBlocTextPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#category : #'Pyramid-Bloc-plugin-bloc-text'
}

{ #category : #accessing }
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

{ #category : #accessing }
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

{ #category : #accessing }
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

{ #category : #accessing }
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

{ #category : #connecting }
PyramidBlocTextPlugin >> connectOn: aPyramidEditor [

| groupText |

	groupText := aPyramidEditor propertiesManager atGroup:
		                   #Text.

	aPyramidEditor propertiesManager addProperty: self class changeText.
	groupText addProperty: self class changeText.
	groupText addProperty: self class fontSize.
	groupText addProperty: self class fontWeight.
	groupText addProperty:
		self class textForeground
]
