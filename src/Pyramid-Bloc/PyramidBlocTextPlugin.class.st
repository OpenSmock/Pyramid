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
		            inputPresenterClass: PyramidTextInputPresenter;
		            yourself.
	property inputPresenterModel help:
		'Change the value of the text'.
	^ property
]

{ #category : #accessing }
PyramidBlocTextPlugin class >> fontSize [

	| property |
	property := PyramidProperty new
		            name: 'Font size';
		            command: PyramidFontSizeCommand new;
		            inputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property inputPresenterModel help: 'Change the font size.'.
	^ property
]

{ #category : #accessing }
PyramidBlocTextPlugin class >> fontWeight [

	| property |
	property := PyramidProperty new
		            name: 'Font weight';
		            command: PyramidFontWeightCommand new;
		            inputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property inputPresenterModel help: 'Change the font weight.'.
	^ property
]

{ #category : #accessing }
PyramidBlocTextPlugin class >> textForeground [

	| property |
	property := PyramidProperty new
		            name: 'Text foreground';
		            command: PyramidTextForegroundCommand new;
		            inputPresenterClass:
			            PyramidColorInputSingleLineWithPickupButtonPresenter;
		            yourself.
	property inputPresenterModel help:
		'Change the color of the text'.
	^ property
]

{ #category : #connecting }
PyramidBlocTextPlugin >> connectOn: aPyramidEditor [

	| propertiesManager |
	propertiesManager := (aPyramidEditor findPlugin: PyramidBlocPlugin)propertiesManager.
	propertiesManager addProperty: self class changeText.
	propertiesManager addProperty: self class fontSize.
	propertiesManager addProperty: self class fontWeight.
	propertiesManager addProperty:
		self class textForeground
]
