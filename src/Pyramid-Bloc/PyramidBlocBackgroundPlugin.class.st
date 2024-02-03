Class {
	#name : #PyramidBlocBackgroundPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#category : #'Pyramid-Bloc-plugin-bloc-background'
}

{ #category : #accessing }
PyramidBlocBackgroundPlugin class >> backgroundType [

	| property |
	property := PyramidProperty new
		            name: 'Background Type';
		            command: PyramidBackgroundCommand new;
		            pyramidInputPresenterClass:
			            PyramidMagicButtonsInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (self iconNamed: #uncheckedBox);
				 helpSelected: 'The value is Transparent.';
				 helpNotSelected: 'Set the value to Transparent.';
				 label: 'Transparent';
				 inputValue: BlTransparentBackground new;
				 inputValidation: [ :value |
					 value class = BlTransparentBackground ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (self iconNamed: #paint);
				 helpSelected: 'The value is paint.';
				 helpNotSelected: 'Set the value to paint.';
				 label: 'Paint';
				 inputValue: [(BlPaintBackground paint: Color random asBlPaint)];
				 inputValidation: [ :value | value class == BlPaintBackground ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (self iconNamed: #jigsawIcon);
				 helpSelected: 'The value is image.';
				 helpNotSelected: 'Set the value to image.';
				 label: 'Image';
				 inputValue:
					 (BlImageBackground image: (self iconNamed: #pharoBig));
				 inputValidation: [ :value | value class == BlImageBackground ];
				 yourself).
	^ property
]

{ #category : #connecting }
PyramidBlocBackgroundPlugin >> connectOn: aPyramidEditor [

	"Background type"
	aPyramidEditor propertiesManager addProperty: self class backgroundType.
	
]
