Class {
	#name : 'PyramidBlocLayoutPlugin',
	#superclass : 'Object',
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'propertiesManager'
	],
	#category : 'Pyramid-Bloc-plugin-bloc-layout',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-layout'
}

{ #category : 'accessing' }
PyramidBlocLayoutPlugin class >> constraintsBasicH [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - horizontal';
		            command:
			            PyramidBasicHorizontalConstraintsBlocCommand new;
		            pyramidInputPresenterClass:
			            PyramidBasicConstraintsInputPresenter;
		            yourself.
	^ property
]

{ #category : 'accessing' }
PyramidBlocLayoutPlugin class >> constraintsBasicHExact [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - width';
		            command:
			            PyramidBasicExactHorizontalConstraintsBlocCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Change the width of the object'.
	^ property
]

{ #category : 'accessing' }
PyramidBlocLayoutPlugin class >> constraintsBasicV [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - vertical';
		            command:
			            PyramidBasicVerticalConstraintsBlocCommand new;
		            pyramidInputPresenterClass:
			            PyramidBasicConstraintsInputPresenter;
		            yourself.
	^ property
]

{ #category : 'accessing' }
PyramidBlocLayoutPlugin class >> constraintsBasicVExact [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - height';
		            command:
			            PyramidBasicExactVerticalConstraintsBlocCommand new;
		            pyramidInputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Change the height of the object'.
	^ property
]

{ #category : 'accessing' }
PyramidBlocLayoutPlugin class >> constraintsFrameH [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - Frame - horizontal';
		            command: PyramidFrameHorizontalConstraintsCommand new;
		            pyramidInputPresenterClass:
			            PyramidHorizontalFrameConstraintsInputPresenter;
		            yourself.
	^ property
]

{ #category : 'accessing' }
PyramidBlocLayoutPlugin class >> constraintsFrameV [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - Frame - vertical';
		            command: PyramidFrameVerticalConstraintsCommand new;
		            pyramidInputPresenterClass:
			            PyramidVerticalFrameConstraintsInputPresenter;
		            yourself.
	^ property
]

{ #category : 'accessing' }
PyramidBlocLayoutPlugin class >> constraintsPropH [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - horizontal';
		            command:
			            PyramidProportionnalHorizontalConstraintsCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		help: 'Define the proportion of the horizontal component.';
		labelX: 'Left';
		labelY: 'Right'.
	^ property
]

{ #category : 'accessing' }
PyramidBlocLayoutPlugin class >> constraintsPropV [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - vertical';
		            command:
			            PyramidProportionnalVerticalConstraintsCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		help: 'Define the proportion of the vertical component.';
		labelX: 'Top';
		labelY: 'Bottom'.
	^ property
]

{ #category : 'accessing' }
PyramidBlocLayoutPlugin class >> flowLayoutOrientation [

	| property |
	property := PyramidProperty new
		            name: 'Flow - Orientation';
		            command:
			            PyramidLayoutChangeOrientationForFlowCommand new;
		            pyramidInputPresenterClass:
			            PyramidFlowLayoutOrientationPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Change the orientation of the flow layout.'.
	property pyramidInputPresenterStrings onLabel: 'Vertical'.
	property pyramidInputPresenterStrings offLabel: 'Horizontal'.
	property pyramidInputPresenterStrings uncertainLabel: 'Uncertain'.
	^ property
]

{ #category : 'accessing' }
PyramidBlocLayoutPlugin class >> layout [

	| property |
	property := PyramidProperty new
		            name: 'Layout Type';
		            command: PyramidLayoutBlocCommand new;
		            pyramidInputPresenterClass:
			            PyramidMagicButtonsInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (self iconNamed: #radioButtonUnselected);
				 helpSelected: 'The element have no layout.';
				 helpNotSelected: 'No layout.';
				 label: 'Basic';
				 inputValue: BlBasicLayout new;
				 inputValidation: [ :value | value class = BlBasicLayout ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (self iconNamed: #smallLeftFlush);
				 helpSelected: 'The layout is linear.';
				 helpNotSelected: 'Set the layout to linear.';
				 label: 'Linear';
				 inputValue: [ BlLinearLayout vertical ];
				 inputValidation: [ :value | value class = BlLinearLayout ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (self iconNamed: #smallJustified);
				 helpSelected: 'The layout is flow.';
				 helpNotSelected: 'Set the layout to flow.';
				 label: 'Flow';
				 inputValue: [ BlFlowLayout vertical ];
				 inputValidation: [ :value | value class = BlFlowLayout ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (self iconNamed: #windowMaximize);
				 helpSelected: 'The layout is frame.';
				 helpNotSelected: 'Set the layout to frame.';
				 label: 'Frame';
				 inputValue: [ BlFrameLayout new ];
				 inputValidation: [ :value | value class = BlFrameLayout ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (self iconNamed: #haloScale);
				 helpSelected: 'The layout is proportionnal.';
				 helpNotSelected: 'Set the layout to proportionnal.';
				 label: 'Prop';
				 inputValue: [ BlProportionalLayout new ];
				 inputValidation: [ :value | value class = BlProportionalLayout ];
				 yourself).
	^ property
]

{ #category : 'accessing' }
PyramidBlocLayoutPlugin class >> linearLayoutOrientation [

	| property |
	property := PyramidProperty new
		            name: 'Linear - Orientation';
		            command:
			            PyramidLayoutChangeOrientationForLinearCommand new;
		            pyramidInputPresenterClass:
			            PyramidLinearLayoutOrientationPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Change the orientation of the linear layout.'.
	property pyramidInputPresenterStrings onLabel: 'Vertical'.
	property pyramidInputPresenterStrings offLabel: 'Horizontal'.
	property pyramidInputPresenterStrings uncertainLabel: 'Uncertain'.
	^ property
]

{ #category : 'accessing' }
PyramidBlocLayoutPlugin class >> margin [

	| property |
	property := PyramidProperty new
		            name: 'Margin';
		            command: PyramidMarginCommand new;
		            pyramidInputPresenterClass: PyramidInsetsInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help: 		'Change the margin. The margin will affect the space between the border and the elements outside. For example:
	- "10" to set a margin of 10 px on each size.
	- "10 20" to set a margin of 10 px on the top and bottom and 20 px on the right and left.
	- "10 20 30 40" to set a margin of 10 px on top, 20 px on left, 30 px on bottom and 40 px on right.'..
	^ property
]

{ #category : 'accessing' }
PyramidBlocLayoutPlugin class >> padding [

	| property |
	property := PyramidProperty new
		            name: 'Padding';
		            command: PyramidPaddingCommand new;
		            pyramidInputPresenterClass: PyramidInsetsInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Change the padding. The padding will affect the space between the border and the elements inside. For example:
	- "10" to set a padding of 10 px on each size.
	- "10 20" to set a padding of 10 px on the top and bottom and 20 px on the right and left.
	- "10 20 30 40" to set a padding of 10 px on top, 20 px on left, 30 px on bottom and 40 px on right.'.
	^ property
]

{ #category : 'accessing' }
PyramidBlocLayoutPlugin class >> position [

	| property |
	property := PyramidProperty new
		            name: 'Position';
		            command: PyramidPositionCommand new;
		            pyramidInputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property pyramidInputPresenterStrings help:
		'Set the position x and y of the element inside his parent.'.
	^ property
]

{ #category : 'adding' }
PyramidBlocLayoutPlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self propertiesManager presenter
			label: 'Layout'
			icon: (self iconNamed: #box)
			order: 3 ]
]

{ #category : 'connecting' }
PyramidBlocLayoutPlugin >> connectOn: aPyramidEditor [

	propertiesManager projectModel: aPyramidEditor projectModel.
	propertiesManager commandExecutor:
		aPyramidEditor propertiesManager commandExecutor
]

{ #category : 'initialization' }
PyramidBlocLayoutPlugin >> initialize [

	propertiesManager := PyramidPropertiesManagerForSelection new.

	"Position | Margin | Padding"
	propertiesManager addProperty: self class position.
	propertiesManager addProperty: self class padding.
	propertiesManager addProperty: self class margin.

	propertiesManager addProperty: self class layout.
	propertiesManager addProperty:
		self class flowLayoutOrientation.
	propertiesManager addProperty:
		self class linearLayoutOrientation.

	"Constraints - horizontal"
	propertiesManager addProperty:
		self class constraintsFrameH.
	propertiesManager addProperty:
		self class constraintsPropH.
	propertiesManager addProperty:
		self class constraintsBasicH.
	propertiesManager addProperty:
		self class constraintsBasicHExact.

	"Constraints - vertical"
	propertiesManager addProperty:
		self class constraintsFrameV.
	propertiesManager addProperty:
		self class constraintsPropV.
	propertiesManager addProperty:
		self class constraintsBasicV.
	propertiesManager addProperty:
		self class constraintsBasicVExact.
]

{ #category : 'adding' }
PyramidBlocLayoutPlugin >> propertiesManager [

	^ propertiesManager
]
