Class {
	#name : #PyramidBlocGeometryPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'propertiesManager'
	],
	#category : #'Pyramid-Bloc-plugin-bloc-geometry'
}

{ #category : #accessing }
PyramidBlocGeometryPlugin class >> cornerRadii [

	| property |
	property := PyramidProperty new
		            name: 'Corner radius';
		            command: PyramidRoundedRectangleCornerRadiiCommand new;
		            inputPresenterClass:
			            PyramidCornerRadiiInputPresenter;
		            yourself.
	property inputPresenterModel help:
		'Change the corner radius of the geometry. For example:
	- "10" to set a radius of 10 px on each corner.
	- "10 20" to set a radius of 10 px on the top-left and bottom-right corner and 20 px on the top-right and bottom-left corner.
	- "10 20 30 40" to set a radius of 10 px on top-left, 20 px on top-right, 30 px on bottom-right and 40 px on bottom-left.'.
	^ property
]

{ #category : #accessing }
PyramidBlocGeometryPlugin class >> geometry [

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
PyramidBlocGeometryPlugin class >> geometryClasses [

	^ {
		  BlRectangleGeometry.
		  BlRoundedRectangleGeometry.
		  BlSquareGeometry.
		  BlEllipseGeometry.
		  BlCircleGeometry.
		  BlAnnulusSectorGeometry.
		  BlTriangleGeometry.
		  BlLineGeometry .
		  BlPolylineGeometry.
		  BlBezierCurveGeometry.
		  BlPolygonGeometry }
]

{ #category : #adding }
PyramidBlocGeometryPlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self propertiesManager mainPresenter
			label: 'Geo'
			icon: (Smalltalk ui icons iconNamed: #box)
			order: 4 ]
]

{ #category : #connecting }
PyramidBlocGeometryPlugin >> connectOn: aPyramidEditor [

	propertiesManager projectModel: aPyramidEditor projectModel.
	propertiesManager commandExecutor:
		aPyramidEditor commandExecutor
]

{ #category : #initialization }
PyramidBlocGeometryPlugin >> initialize [

	propertiesManager := PyramidPropertiesManagerForSelection new.

	propertiesManager addProperty: self class geometry.
	propertiesManager addProperty: self class cornerRadii.
]

{ #category : #adding }
PyramidBlocGeometryPlugin >> propertiesManager [

	^ propertiesManager
]
