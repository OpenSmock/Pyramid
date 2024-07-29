Class {
	#name : #PyramidBackgroundBlocPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'propertiesManager'
	],
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> backgroundImageSelector [

	| property |
	property := PyramidProperty new
		            name: 'Background Image Selector';
		            command: PyramidBackgroundImageCommand new;
		            pyramidInputPresenterClass:
			            PyramidBackgroundImageInputPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> backgroundLinearEnd [

	| property |
	property := PyramidProperty new
		            name: 'Background Linear End';
		            command: PyramidBackgroundPaintLinearEndCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		help: 'Define the end of the linear gradient.';
		labelX: 'x';
		labelY: 'y'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> backgroundLinearGradientDirection [

	| property |
	property := PyramidProperty new
		            name: 'Background Linear Direction';
		            command: PyramidBackgroundPaintLinearDirectionCommand new;
		            pyramidInputPresenterClass:
			            PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		help: 'Define the direction of the linear gradient.';
		labelX: 'Start';
		labelY: 'End'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> backgroundLinearStart [

	| property |
	property := PyramidProperty new
		            name: 'Background Linear Start';
		            command:
			            PyramidBackgroundPaintLinearStartCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		help: 'Define the start of the linear gradient.';
		labelX: 'x';
		labelY: 'y'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> backgroundOpacity [

	| property |
	property := PyramidProperty new
		            name: 'Background Opacity';
		            command: PyramidBackgroundOpacityCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Define the opacity of the background.'.
	^ property
]

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
				 icon: (Smalltalk ui icons iconNamed: #windowMaximize);
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
				 icon: (Smalltalk ui icons iconNamed: #upAndDownArrow);
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
				 icon: (Smalltalk ui icons iconNamed: #radioButtonUnselected);
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
PyramidBackgroundBlocPlugin class >> backgroundRadialInnerCenter [

	| property |
	property := PyramidProperty new
		            name: 'Background Radial Center In';
		            command: PyramidBackgroundPaintRadialInnerCenterCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		help: 'Define the center of the inner radial gradient.';
		labelX: 'x';
		labelY: 'y'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> backgroundRadialInnerRadius [

	| property |
	property := PyramidProperty new
		            name: 'Background Radial Radius In';
		            command:
			            PyramidBackgroundPaintRadialInnerRadiusCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		help: 'Define the center of the inner radius gradient.'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> backgroundRadialOuterCenter [

	| property |
	property := PyramidProperty new
		            name: 'Background Radial Center Out';
		            command:
			            PyramidBackgroundPaintRadialOuterCenterCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		help: 'Define the center of the outer radial gradient.';
		labelX: 'x';
		labelY: 'y'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> backgroundRadialOuterRadius [

	| property |
	property := PyramidProperty new
		            name: 'Background Radial Radius Out';
		            command:
			            PyramidBackgroundPaintRadialOuterRadiusCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Define the center of the outer radius gradient.'.
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
				 icon: (Smalltalk ui icons iconNamed: #uncheckedBox);
				 helpSelected: 'The value is Transparent.';
				 helpNotSelected: 'Set the value to Transparent.';
				 label: 'Transparent';
				 inputValue: BlTransparentBackground new;
				 inputValidation: [ :value | value = BlTransparentBackground ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #paint);
				 helpSelected: 'The value is paint.';
				 helpNotSelected: 'Set the value to paint.';
				 label: 'Paint';
				 inputValue: [
					 [ BlPaintBackground paint: Color random asBlPaint ] ];
				 inputValidation: [ :value | value = BlPaintBackground ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #jigsawIcon);
				 helpSelected: 'The value is image.';
				 helpNotSelected: 'Set the value to image.';
				 label: 'Image';
				 inputValue: [
					 BlImageBackground image: (Smalltalk ui icons iconNamed: #pharoBig) ];
				 inputValidation: [ :value | value = BlImageBackground ];
				 yourself).
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderDashArray [

	| property |
	property := PyramidProperty new
		            name: 'Border Dash Array';
		            command: PyramidBorderDashArrayCommand new;
		            pyramidInputPresenterClass: PyramidDashArrayInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Define the dash array.'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderDashOffset [

	| property |
	property := PyramidProperty new
		            name: 'Border Dash Offset';
		            command: PyramidBorderDashOffsetCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Define the offset of the dash.'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderLineCap [

	| property |
	property := PyramidProperty new
		            name: 'Border Line Cap';
		            command: PyramidBorderLineCapCommand new;
		            pyramidInputPresenterClass:
			            PyramidMagicButtonsInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		addButtonModel: (PyramidMagicButtonModel new
				 icon: ((Smalltalk ui icons iconNamed: #windowMenu) rotateBy: -45);
				 helpSelected: 'The value is Butt.';
				 helpNotSelected: 'Set the value to Butt.';
				 label: 'Butt';
				 inputValue: [ BlStrokeLineCap butt ];
				 inputValidation: [ :value | value = BlStrokeLineCap butt ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #radioButtonUnselected);
				 helpSelected: 'The value is Round.';
				 helpNotSelected: 'Set the value to Round.';
				 label: 'Round';
				 inputValue: [ BlStrokeLineCap round ];
				 inputValidation: [ :value | value = BlStrokeLineCap round ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #windowMaximize);
				 helpSelected: 'The value is Square.';
				 helpNotSelected: 'Set the value to Square.';
				 label: 'Square';
				 inputValue: [ BlStrokeLineCap square ];
				 inputValidation: [ :value | value = BlStrokeLineCap square ];
				 yourself);
		yourself.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderLineJoin [

	| property |
	property := PyramidProperty new
		            name: 'Border Line Join';
		            command: PyramidBorderLineJoinCommand new;
		            pyramidInputPresenterClass:
			            PyramidMagicButtonsInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		addButtonModel: (PyramidMagicButtonModel new
				 icon: ((Smalltalk ui icons iconNamed: #windowMenu) rotateBy: -45);
				 helpSelected: 'The value is Bevel.';
				 helpNotSelected: 'Set the value to Bevel.';
				 label: 'Bevel';
				 inputValue: [ BlStrokeLineJoin bevel ];
				 inputValidation: [ :value | value = BlStrokeLineJoin bevel ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #windowMaximize);
				 helpSelected: 'The value is Miter.';
				 helpNotSelected: 'Set the value to Miter.';
				 label: 'Miter';
				 inputValue: [ BlStrokeLineJoin miter ];
				 inputValidation: [ :value | value = BlStrokeLineJoin miter ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #radioButtonUnselected);
				 helpSelected: 'The value is Round.';
				 helpNotSelected: 'Set the value to Round.';
				 label: 'Round';
				 inputValue: [ BlStrokeLineJoin round ];
				 inputValidation: [ :value | value = BlStrokeLineJoin round ];
				 yourself);
		yourself.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderLinearEnd [

	| property |
	property := PyramidProperty new
		            name: 'Border Linear End';
		            command: PyramidBorderPaintLinearDirectionEndCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		help: 'Define the end of the linear gradient.';
		labelX: 'x';
		labelY: 'y'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderLinearGradientDirection [

	| property |
	property := PyramidProperty new
		            name: 'Border Linear Direction';
		            command:
			            PyramidBorderPaintLinearDirectionCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		help: 'Define the direction of the linear gradient.';
		labelX: 'Start';
		labelY: 'End'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderLinearStart [

	| property |
	property := PyramidProperty new
		            name: 'Border Linear Start';
		            command: PyramidBorderPaintLinearDirectionStartCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		help: 'Define the start of the linear gradient.';
		labelX: 'x';
		labelY: 'y'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderMiterLimit [

	| property |
	property := PyramidProperty new
		            name: 'Border Miter Limit';
		            command: PyramidBorderMiterLimitCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Define the miter limit of the border.'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderOpacity [

	| property |
	property := PyramidProperty new
		            name: 'Border Opacity';
		            command: PyramidBorderOpacityCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Define the opacity of the border.'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderPaintColor [

	| property |
	property := PyramidProperty new
		            name: 'Border Paint Color';
		            command: PyramidBorderPaintColorCommand new;
		            pyramidInputPresenterClass:
			            PyramidColorInputSingleLineWithPickupButtonPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderPaintStops [

	| property |
	property := PyramidProperty new
		            name: 'Border Paint Stops';
		            command: PyramidBorderPaintStopsCommand new;
		            pyramidInputPresenterClass:
			            PyramidBackgroundStopsInputPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderPaintType [

	| property |
	property := PyramidProperty new
		            name: 'Border Paint Type';
		            command: PyramidBorderPaintCommand new;
		            pyramidInputPresenterClass:
			            PyramidMagicButtonsInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #windowMaximize);
				 helpSelected: 'The value is Solid.';
				 helpNotSelected: 'Set the value to Solid.';
				 label: 'Solid';
				 inputValue: [
					 [
					 BlColorPaint new
						 color: Color random;
						 yourself ] ];
				 inputValidation: [ :value | value class = BlColorPaint ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #upAndDownArrow);
				 helpSelected: 'The value is Linear Gradient.';
				 helpNotSelected: 'Set the value to Linear Gradient.';
				 label: 'Linear';
				 inputValue: [
					 [
					 BlLinearGradientPaint vertical
						 stops: {
								 (0.0 -> Color random).
								 (1.0 -> Color random) };
						 yourself ] ];
				 inputValidation: [ :value | value class = BlLinearGradientPaint ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #radioButtonUnselected);
				 helpSelected: 'The value is Linear Gradient.';
				 helpNotSelected: 'Set the value to Linear Gradient.';
				 label: 'Linear';
				 inputValue: [
					 [
					 BlRadialGradientPaint new
						 stops: {
								 (0.0 -> Color random).
								 (1.0 -> Color random) };
						 innerCenter: 50 @ 50;
						 innerRadius: 0;
						 outerCenter: 50 @ 50;
						 outerRadius: 50;
						 yourself ] ];
				 inputValidation: [ :value | value class = BlRadialGradientPaint ];
				 yourself);
		yourself.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderRadialInnerCenter [

	| property |
	property := PyramidProperty new
		            name: 'Border Radial Center In';
		            command:
			            PyramidBorderPaintRadialInnerCenterCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		help: 'Define the center of the inner radial gradient.';
		labelX: 'x';
		labelY: 'y'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderRadialInnerRadius [

	| property |
	property := PyramidProperty new
		            name: 'Border Radial Radius In';
		            command:
			            PyramidBorderPaintRadialInnerRadiusCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Define the center of the inner radius gradient.'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderRadialOuterCenter [

	| property |
	property := PyramidProperty new
		            name: 'Border Radial Center Out';
		            command:
			            PyramidBorderPaintRadialOuterCenterCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		help: 'Define the center of the outer radial gradient.';
		labelX: 'x';
		labelY: 'y'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderRadialOuterRadius [

	| property |
	property := PyramidProperty new
		            name: 'Border Radial Radius Out';
		            command:
			            PyramidBorderPaintRadialOuterRadiusCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Define the center of the outer radius gradient.'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> borderWidth [

	| property |
	property := PyramidProperty new
		            name: 'Border Width';
		            command: PyramidBorderWidthCommand new;
		            pyramidInputPresenterClass:
			            PyramidNumberInputPresenter;
		            yourself.
		property pyramidInputPresenterStrings help:
		'Define the width of the border.'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> opacity [

	| property |
	property := PyramidProperty new
		            name: 'Element Opacity';
		            command: PyramidOpacityCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Define the opacity of the element.'.
	^ property
]

{ #category : #accessing }
PyramidBackgroundBlocPlugin class >> outskirts [

	| property |
	property := PyramidProperty new
		            name: 'Element Outskirts';
		            command: PyramidOutskirtsCommand new;
		            pyramidInputPresenterClass:
			            PyramidMagicButtonsInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #menuPin);
				 helpSelected: 'The value is Inside.';
				 helpNotSelected: 'Set the value to Inside.';
				 label: 'Inside';
				 inputValue: [ BlOutskirts inside ];
				 inputValidation: [ :value | value class = BlOutskirtsInside ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #radioButtonPressed);
				 helpSelected: 'The value is Centered.';
				 helpNotSelected: 'Set the value to Centered.';
				 label: 'Centered';
				 inputValue: [ BlOutskirts centered ];
				 inputValidation: [ :value | value class = BlOutskirtsCentered ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #radioButtonUnselected);
				 helpSelected: 'The value is Outside.';
				 helpNotSelected: 'Set the value to Outside.';
				 label: 'Outside';
				 inputValue: [ BlOutskirts outside ];
				 inputValidation: [ :value | value class = BlOutskirtsOutside ];
				 yourself);
		yourself.
	^ property
]

{ #category : #adding }
PyramidBackgroundBlocPlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self propertiesManager presenter
			label: 'Visuals'
			icon: (Smalltalk ui icons iconNamed: #box)
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

	"Element opacity"
	propertiesManager addProperty: self class opacity.

	"Background properties"
	propertiesManager addProperty: self class backgroundOpacity.
	propertiesManager addProperty: self class backgroundType.

	"Image"
	propertiesManager addProperty: self class backgroundImageSelector.

	"Paint"
	propertiesManager addProperty: self class backgroundPaintType.
	propertiesManager addProperty: self class backgroundPaintColor.
	propertiesManager addProperty: self class backgroundPaintStops.

	"Linear start | end"
	propertiesManager addProperty: self class backgroundLinearStart.
	propertiesManager addProperty: self class backgroundLinearEnd.

	"Radial"
	propertiesManager addProperty: self class backgroundRadialInnerCenter.
	propertiesManager addProperty: self class backgroundRadialInnerRadius.
	propertiesManager addProperty: self class backgroundRadialOuterCenter.
	propertiesManager addProperty: self class backgroundRadialOuterRadius.

	"Outskirts properties"
	propertiesManager addProperty: self class outskirts.

	"Border properties"
	propertiesManager addProperty: self class borderOpacity.
	propertiesManager addProperty: self class borderWidth.

	"Style"
	propertiesManager addProperty: self class borderDashArray.
	propertiesManager addProperty: self class borderDashOffset.
	propertiesManager addProperty: self class borderLineCap.
	propertiesManager addProperty: self class borderLineJoin.
	propertiesManager addProperty: self class borderMiterLimit.

	"Paint"
	propertiesManager addProperty: self class borderPaintType.
	propertiesManager addProperty: self class borderPaintColor.
	propertiesManager addProperty: self class borderPaintStops.

	"Linear start | end"
	propertiesManager addProperty: self class borderLinearStart.
	propertiesManager addProperty: self class borderLinearEnd.

	"Radial"
	propertiesManager addProperty: self class borderRadialInnerCenter.
	propertiesManager addProperty: self class borderRadialInnerRadius.
	propertiesManager addProperty: self class borderRadialOuterCenter.
	propertiesManager addProperty: self class borderRadialOuterRadius
]

{ #category : #adding }
PyramidBackgroundBlocPlugin >> propertiesManager [

	^ propertiesManager
]
