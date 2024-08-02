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

]

{ #category : #adding }
PyramidBlocGeometryPlugin >> propertiesManager [

	^ propertiesManager
]
