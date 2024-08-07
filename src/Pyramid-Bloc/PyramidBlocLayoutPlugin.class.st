Class {
	#name : #PyramidBlocLayoutPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'propertiesManager'
	],
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #accessing }
PyramidBlocLayoutPlugin class >> constraintsBasicH [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - horizontal';
		            command:
			            PyramidBasicHorizontalConstraintsBlocCommand new;
		            inputPresenterClass:
			            PyramidBasicConstraintsInputPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBlocLayoutPlugin class >> constraintsBasicHExact [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - width';
		            command:
			            PyramidBasicExactHorizontalConstraintsBlocCommand new;
		            inputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property inputPresenterModel help:
		'Change the width of the object'.
	^ property
]

{ #category : #accessing }
PyramidBlocLayoutPlugin class >> constraintsBasicV [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - vertical';
		            command:
			            PyramidBasicVerticalConstraintsBlocCommand new;
		            inputPresenterClass:
			            PyramidBasicConstraintsInputPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBlocLayoutPlugin class >> constraintsBasicVExact [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - height';
		            command:
			            PyramidBasicExactVerticalConstraintsBlocCommand new;
		            inputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property inputPresenterModel help:
		'Change the height of the object'.
	^ property
]

{ #category : #accessing }
PyramidBlocLayoutPlugin class >> constraintsFrameH [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - Frame - horizontal';
		            command: PyramidFrameHorizontalConstraintsCommand new;
		            inputPresenterClass:
			            PyramidHorizontalFrameConstraintsInputPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBlocLayoutPlugin class >> constraintsFrameV [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - Frame - vertical';
		            command: PyramidFrameVerticalConstraintsCommand new;
		            inputPresenterClass:
			            PyramidVerticalFrameConstraintsInputPresenter;
		            yourself.
	^ property
]

{ #category : #accessing }
PyramidBlocLayoutPlugin class >> constraintsPropH [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - horizontal';
		            command:
			            PyramidProportionnalHorizontalConstraintsCommand new;
		            inputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property inputPresenterModel
		help: 'Define the proportion of the horizontal component.';
		labelX: 'Left';
		labelY: 'Right'.
	^ property
]

{ #category : #accessing }
PyramidBlocLayoutPlugin class >> constraintsPropV [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - vertical';
		            command:
			            PyramidProportionnalVerticalConstraintsCommand new;
		            inputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property inputPresenterModel
		help: 'Define the proportion of the vertical component.';
		labelX: 'Top';
		labelY: 'Bottom'.
	^ property
]

{ #category : #accessing }
PyramidBlocLayoutPlugin class >> constraintsWeight [

	| property |
	property := PyramidProperty new
		            name: 'Constraints - weight';
		            command: PyramidWeightConstraintsCommand new;
		            inputPresenterClass: PyramidNumberInputPresenter;
		            yourself.
	property inputPresenterModel help:
		'Define the weight of the element to compute its size. The constraints must be "matchParent" to have an effect.'.
	^ property
]

{ #category : #accessing }
PyramidBlocLayoutPlugin class >> flowLayoutOrientation [

	| property |
	property := PyramidProperty new
		            name: 'Flow - Orientation';
		            command:
			            PyramidLayoutChangeOrientationForFlowCommand new;
		            inputPresenterClass:
			            PyramidFlowLayoutOrientationPresenter;
		            yourself.
	property inputPresenterModel help:
		'Change the orientation of the flow layout.'.
	property inputPresenterModel onLabel: 'Vertical'.
	property inputPresenterModel offLabel: 'Horizontal'.
	property inputPresenterModel uncertainLabel: 'Uncertain'.
	^ property
]

{ #category : #accessing }
PyramidBlocLayoutPlugin class >> layout [

	| property |
	property := PyramidProperty new
		            name: 'Layout Type';
		            command: PyramidLayoutBlocCommand new;
		            inputPresenterClass:
			            PyramidMagicButtonsInputPresenter;
		            yourself.
	property inputPresenterModel
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #radioButtonUnselected);
				 helpSelected: 'The element have no layout.';
				 helpNotSelected: 'No layout.';
				 label: 'Basic';
				 inputValue: BlBasicLayout new;
				 inputValidation: [ :value | value class = BlBasicLayout ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #smallLeftFlush);
				 helpSelected: 'The layout is linear.';
				 helpNotSelected: 'Set the layout to linear.';
				 label: 'Linear';
				 inputValue: [ BlLinearLayout vertical ];
				 inputValidation: [ :value | value class = BlLinearLayout ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #smallJustified);
				 helpSelected: 'The layout is flow.';
				 helpNotSelected: 'Set the layout to flow.';
				 label: 'Flow';
				 inputValue: [ BlFlowLayout vertical ];
				 inputValidation: [ :value | value class = BlFlowLayout ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #windowMaximize);
				 helpSelected: 'The layout is frame.';
				 helpNotSelected: 'Set the layout to frame.';
				 label: 'Frame';
				 inputValue: [ BlFrameLayout new ];
				 inputValidation: [ :value | value class = BlFrameLayout ];
				 yourself);
		addButtonModel: (PyramidMagicButtonModel new
				 icon: (Smalltalk ui icons iconNamed: #haloScale);
				 helpSelected: 'The layout is proportionnal.';
				 helpNotSelected: 'Set the layout to proportionnal.';
				 label: 'Prop';
				 inputValue: [ BlProportionalLayout new ];
				 inputValidation: [ :value | value class = BlProportionalLayout ];
				 yourself).
	^ property
]

{ #category : #accessing }
PyramidBlocLayoutPlugin class >> linearLayoutOrientation [

	| property |
	property := PyramidProperty new
		            name: 'Linear - Orientation';
		            command:
			            PyramidLayoutChangeOrientationForLinearCommand new;
		            inputPresenterClass:
			            PyramidLinearLayoutOrientationPresenter;
		            yourself.
	property inputPresenterModel help:
		'Change the orientation of the linear layout.'.
	property inputPresenterModel onLabel: 'Vertical'.
	property inputPresenterModel offLabel: 'Horizontal'.
	property inputPresenterModel uncertainLabel: 'Uncertain'.
	^ property
]

{ #category : #accessing }
PyramidBlocLayoutPlugin class >> margin [

	| property |
	property := PyramidProperty new
		            name: 'Margin';
		            command: PyramidMarginCommand new;
		            inputPresenterClass: PyramidInsetsInputPresenter;
		            yourself.
	property inputPresenterModel help: 		'Change the margin. The margin will affect the space between the border and the elements outside. For example:
	- "10" to set a margin of 10 px on each size.
	- "10 20" to set a margin of 10 px on the top and bottom and 20 px on the right and left.
	- "10 20 30 40" to set a margin of 10 px on top, 20 px on left, 30 px on bottom and 40 px on right.'..
	^ property
]

{ #category : #accessing }
PyramidBlocLayoutPlugin class >> padding [

	| property |
	property := PyramidProperty new
		            name: 'Padding';
		            command: PyramidPaddingCommand new;
		            inputPresenterClass: PyramidInsetsInputPresenter;
		            yourself.
	property inputPresenterModel help:
		'Change the padding. The padding will affect the space between the border and the elements inside. For example:
	- "10" to set a padding of 10 px on each size.
	- "10 20" to set a padding of 10 px on the top and bottom and 20 px on the right and left.
	- "10 20 30 40" to set a padding of 10 px on top, 20 px on left, 30 px on bottom and 40 px on right.'.
	^ property
]

{ #category : #accessing }
PyramidBlocLayoutPlugin class >> position [

	| property |
	property := PyramidProperty new
		            name: 'Position';
		            command: PyramidPositionCommand new;
		            inputPresenterClass: PyramidPointInputPresenter;
		            yourself.
	property inputPresenterModel help:
		'Set the position x and y of the element inside his parent.'.
	^ property
]

{ #category : #adding }
PyramidBlocLayoutPlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self propertiesManager mainPresenter
			label: 'Layout'
			icon: (Smalltalk ui icons iconNamed: #box)
			order: 3 ]
]

{ #category : #connecting }
PyramidBlocLayoutPlugin >> connectOn: aPyramidEditor [

	propertiesManager projectModel: aPyramidEditor projectModel.
	propertiesManager commandExecutor:
		aPyramidEditor commandExecutor
]

{ #category : #initialization }
PyramidBlocLayoutPlugin >> initialize [

	propertiesManager := PyramidPropertiesManagerForSelection new.

	"Position | Margin | Padding"
	propertiesManager addProperty: self class position.
	propertiesManager addProperty: self class padding.
	propertiesManager addProperty: self class margin.

	propertiesManager addProperty: self class layout.
	propertiesManager addProperty: self class flowLayoutOrientation.
	propertiesManager addProperty: self class linearLayoutOrientation.
	propertiesManager addProperty: self class constraintsWeight.

	"Constraints - horizontal"
	propertiesManager addProperty: self class constraintsFrameH.
	propertiesManager addProperty: self class constraintsPropH.
	propertiesManager addProperty: self class constraintsBasicH.
	propertiesManager addProperty: self class constraintsBasicHExact.

	"Constraints - vertical"
	propertiesManager addProperty: self class constraintsFrameV.
	propertiesManager addProperty: self class constraintsPropV.
	propertiesManager addProperty: self class constraintsBasicV.
	propertiesManager addProperty: self class constraintsBasicVExact
]

{ #category : #adding }
PyramidBlocLayoutPlugin >> propertiesManager [

	^ propertiesManager
]
