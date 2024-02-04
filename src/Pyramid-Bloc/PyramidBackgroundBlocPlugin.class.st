Class {
	#name : #PyramidBackgroundBlocPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'propertiesManager'
	],
	#category : #'Pyramid-Bloc-plugin-bloc-background'
}

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> backgroundPaintColor [

	| property |
	property := PyramidProperty new
		            name: 'Background Paint Color';
		            command: PyramidBackgroundPaintColorCommand new;
		            pyramidInputPresenterClass:
			            PyramidColorInputSingleLineWithPickupButtonPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> backgroundPaintStops [

	| property |
	property := PyramidProperty new
		            name: 'Background Paint Stops';
		            command: PyramidBackgroundPaintStopsCommand new;
		            pyramidInputPresenterClass:
			            PyramidBackgroundStopsInputPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> backgroundPaintType [

	| property |
	property := PyramidProperty new
		            name: 'Background Paint Type';
		            command: PyramidBackgroundPaintCommand new;
		            pyramidInputPresenterClass:
			            PyramidMagicButtonsInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (self iconNamed: #windowMaximize);
				 helpSelected: 'The value is Solid.';
				 helpNotSelected: 'Set the value to Solid.';
				 label: 'Solid';
				 inputValue: [[
					 BlColorPaint new
						 color: Color random;
						 yourself ]];
				 inputValidation: [ :value | value = BlColorPaint ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (self iconNamed: #upAndDownArrow);
				 helpSelected: 'The value is Linear Gradient.';
				 helpNotSelected: 'Set the value to Linear Gradient.';
				 label: 'Linear';
				 inputValue: [[
					 BlLinearGradientPaint vertical
						 stops: {
								 (0.0 -> Color random).
								 (1.0 -> Color random) };
						 yourself ]];
				 inputValidation: [ :value | value = BlLinearGradientPaint ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (self iconNamed: #radioButtonUnselected);
				 helpSelected: 'The value is Linear Gradient.';
				 helpNotSelected: 'Set the value to Linear Gradient.';
				 label: 'Linear';
				 inputValue: [[
					 BlRadialGradientPaint new
						 stops: {
								 (0.0 -> Color random).
								 (1.0 -> Color random) };
						 innerCenter: 50 @ 50;
						 innerRadius: 0;
						 outerCenter: 50 @ 50;
						 outerRadius: 50;
						 yourself ]];
				 inputValidation: [ :value | value = BlRadialGradientPaint ];
				 yourself);
		yourself.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> backgroundType [

	| property |
	property := PyramidProperty new
		            name: 'Background Type';
		            command: PyramidBackgroundTypeCommand new;
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
				 inputValidation: [ :value | value = BlTransparentBackground ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (self iconNamed: #paint);
				 helpSelected: 'The value is paint.';
				 helpNotSelected: 'Set the value to paint.';
				 label: 'Paint';
				 inputValue: [
					 [ BlPaintBackground paint: Color random asBlPaint ] ];
				 inputValidation: [ :value | value = BlPaintBackground ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (self iconNamed: #jigsawIcon);
				 helpSelected: 'The value is image.';
				 helpNotSelected: 'Set the value to image.';
				 label: 'Image';
				 inputValue: [
					 BlImageBackground image: (self iconNamed: #pharoBig) ];
				 inputValidation: [ :value | value = BlImageBackground ];
				 yourself).
	^ property
]

{ #category : #adding }
PyramidBackgroundBlocPlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self propertiesManager presenter
			label: 'Visuals'
			icon: (self iconNamed: #box)
			order: 2 ]
]

{ #category : #connecting }
PyramidBackgroundBlocPlugin >> connectOn: aPyramidEditor [

	propertiesManager projectModel: aPyramidEditor projectModel.
	propertiesManager commandExecutor: aPyramidEditor propertiesManager commandExecutor
]

{ #category : #initialization }
PyramidBackgroundBlocPlugin >> initialize [

	propertiesManager := PyramidPropertiesManagerForSelection new.
	propertiesManager addProperty: self class backgroundType.

	"Paint"
	propertiesManager addProperty: self class backgroundPaintType.
	propertiesManager addProperty: self class backgroundPaintColor.
	propertiesManager addProperty: self class backgroundPaintStops
]

{ #category : #adding }
PyramidBackgroundBlocPlugin >> propertiesManager [

	^ propertiesManager
]
