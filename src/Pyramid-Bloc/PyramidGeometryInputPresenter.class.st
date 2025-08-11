Class {
	#name : #PyramidGeometryInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'whenValueChangedDo',
		'geometry',
		'geometryDictionary'
	],
	#category : #'Pyramid-Bloc-plugin-bloc-geometry'
}

{ #category : #layout }
PyramidGeometryInputPresenter >> defaultLayout [

	| defaultLayout |
	defaultLayout := SpBoxLayout newHorizontal
		                 spacing: 4;
		                 yourself.
		
	self geometryDictionary valuesDo: [ :each |
		defaultLayout add: each buttonPresenter width: 24 ].
	
	^ defaultLayout
]

{ #category : #accessing }
PyramidGeometryInputPresenter >> geometry [
	"Return a BlElementGeometry"

	^ geometry
]

{ #category : #accessing }
PyramidGeometryInputPresenter >> geometry: aBlElementGeometry [

	geometry := aBlElementGeometry
]

{ #category : #accessing }
PyramidGeometryInputPresenter >> geometryDictionary [

	^ geometryDictionary
]

{ #category : #initialization }
PyramidGeometryInputPresenter >> initializeGeometryButtons [

	geometryDictionary
		at: BlRectangleGeometry
		put: (PyramidGeometryInputModel new
				 input: self;
				 help: 'Change the geometry to a rectangle.';
				 defaultGeometry: BlRectangleGeometry new;
				 blocIcon: (BlElement new
						  extent: 16 asPoint;
						  geometry: BlRectangleGeometry new;
						  yourself);
				 yourself).

	geometryDictionary
		at: BlEllipseGeometry
		put: (PyramidGeometryInputModel new
				 input: self;
				 help: 'Change the geometry to an ellipse.';
				 defaultGeometry: BlEllipseGeometry new;
				 blocIcon: (BlElement new
						  extent: 16 asPoint;
						  geometry: BlEllipseGeometry new;
						  yourself);
				 yourself).

	geometryDictionary
		at: BlRoundedRectangleGeometry
		put: (PyramidGeometryInputModel new
				 input: self;
				 help: 'Change the geometry to an ellipse.';
				 defaultGeometry: (BlRoundedRectangleGeometry cornerRadius: 12);
				 blocIcon: (BlElement new
						  extent: 16 asPoint;
						  geometry: (BlRoundedRectangleGeometry cornerRadius: 5);
						  yourself);
				 yourself).

	geometryDictionary
		at: BlPolygonGeometry
		put: (PyramidGeometryInputModel new
				 input: self;
				 help: 'Change the geometry to a polygon geometry.';
				 defaultGeometry: (BlPolygonGeometry vertices: {
								  (8 @ 0).
								  (13 @ 16).
								  (0 @ 6).
								  (16 @ 6).
								  (3 @ 16) } * 3);
				 blocIcon: (BlElement new
						  extent: 16 asPoint;
						  geometry: (BlPolygonGeometry vertices: {
										   (8 @ 0).
										   (13 @ 16).
										   (0 @ 6).
										   (16 @ 6).
										   (3 @ 16) });
						  yourself);
				 yourself)
]

{ #category : #initialization }
PyramidGeometryInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :geo |  ].
	geometryDictionary := OrderedDictionary new.
	self initializeGeometryButtons.
	self value: PyramidUnknowState new
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenter >> setNormalAndSelect: buttonModel [

	self geometryDictionary valuesDo: [ :each | each normal ].
	buttonModel defaultGeometry: self geometry.
	buttonModel selected
]

{ #category : #initialization }
PyramidGeometryInputPresenter >> setUnknow [

	self geometryDictionary valuesDo: [ :each | each error ].
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenter >> value [

	^ self geometry
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenter >> value: aBlGeometry [

	self geometry: aBlGeometry.
	self geometryDictionary
		at: aBlGeometry class
		ifPresent: [ :buttonModel | self setNormalAndSelect: buttonModel ]
		ifAbsent: [ self setUnknow ]
]

{ #category : #accessing }
PyramidGeometryInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
