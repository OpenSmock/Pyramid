Class {
	#name : #PyramidEditorPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'propertiesManager'
	],
	#category : #'Pyramid-plugin-editor'
}

{ #category : #accessing }
PyramidEditorPlugin class >> cornerRadii [

	| property |
	property := PyramidProperty new
		            name: 'Corner radius';
		            command: PyramidRoundedRectangleCornerRadiiCommand new;
		            inputPresenterClass: PyramidCornerRadiiInputPresenter;
		            yourself.
	property inputPresenterModel help:
		'Change the corner radius of the geometry. For example:
	- "10" to set a radius of 10 px on each corner.
	- "10 20" to set a radius of 10 px on the top-left and bottom-right corner and 20 px on the top-right and bottom-left corner.
	- "10 20 30 40" to set a radius of 10 px on top-left, 20 px on top-right, 30 px on bottom-right and 40 px on bottom-left.'.
	^ property
]

{ #category : #accessing }
PyramidEditorPlugin class >> geometry [

	| property |
	property := PyramidProperty new
		            name: 'Geo';
		            command: PyramidGeometryCommand new;
		            inputPresenterClass: PyramidMagicButtonsInputPresenter;
		            yourself.
	self geometryClasses do: [ :each |
		property inputPresenterModel addButtonModel:
			each asPyramidMagicButton ].
	^ property
]

{ #category : #'as yet unclassified' }
PyramidEditorPlugin class >> geometryClasses [

	^ {
		  BlRectangleGeometry.
		  BlRoundedRectangleGeometry.
		  BlSquareGeometry.
		  BlEllipseGeometry.
		  BlCircleGeometry.
		  BlAnnulusSectorGeometry.
		  BlTriangleGeometry.
		  BlLineGeometry.
		  BlPolylineGeometry.
		  BlBezierCurveGeometry.
		  BlPolygonGeometry }
]

{ #category : #'as yet unclassified' }
PyramidEditorPlugin class >> toButtonEndIcon [

	| property |
	property := PyramidProperty new
		            name: 'EndIcon';
		            command: PyramidToButtonEndIconCommand new;
		            inputPresenterClass: PyramidIconInputPresenter;
		            yourself.
	^ property
]

{ #category : #'as yet unclassified' }
PyramidEditorPlugin class >> toButtonIcon [

	| property |
	property := PyramidProperty new
		            name: 'Icon';
		            command: PyramidToButtonIconCommand new;
		            inputPresenterClass: PyramidIconInputPresenter;
		            yourself.
	^ property
]

{ #category : #'as yet unclassified' }
PyramidEditorPlugin class >> toButtonLabel [

	| property |
	property := PyramidProperty new
		            name: 'Text';
		            command: PyramidToButtonLabelCommand new;
		            inputPresenterClass: PyramidTextInputPresenter;
		            yourself.
	^ property
]

{ #category : #'as yet unclassified' }
PyramidEditorPlugin class >> toImageInnerImage [

	| property |
	property := PyramidProperty new
		            name: 'InnerImage';
		            command: PyramidToImageInnerImageCommand new;
		            inputPresenterClass: PyramidIconInputPresenter;
		            yourself.
	^ property
]

{ #category : #'as yet unclassified' }
PyramidEditorPlugin class >> toLabelText [

	| property |
	property := PyramidProperty new
		            name: 'Text';
		            command: PyramidToLabelTextCommand new;
		            inputPresenterClass: PyramidTextInputPresenter;
		            yourself.
	^ property
]

{ #category : #adding }
PyramidEditorPlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
			builder
				makeTab: propertiesManager mainPresenter
				label: 'Editor'
				icon: (Smalltalk ui icons iconNamed: #box)
				order: 5 ]
]

{ #category : #connecting }
PyramidEditorPlugin >> connectOn: aPyramidEditor [

	propertiesManager projectModel: aPyramidEditor projectModel.
	propertiesManager commandExecutor: aPyramidEditor commandExecutor
]

{ #category : #initialization }
PyramidEditorPlugin >> initialize [

	propertiesManager := PyramidPropertiesManagerForSelection new.

	"BlElements properties"
	propertiesManager addProperty: self class geometry.
	propertiesManager addProperty: self class cornerRadii.

	"ToButton properties"
	propertiesManager addProperty: self class toButtonLabel.
	propertiesManager addProperty: self class toButtonIcon.
	propertiesManager addProperty: self class toButtonEndIcon.

	"ToImage properties"
	propertiesManager addProperty: self class toImageInnerImage.

	"ToLabel properties"
	propertiesManager addProperty: self class toLabelText
]
