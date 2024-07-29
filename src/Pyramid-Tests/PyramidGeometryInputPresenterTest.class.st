Class {
	#name : #PyramidGeometryInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : 'Pyramid-Tests-cases-plugin-bloc-geometry'
}

{ #category : #accessing }
PyramidGeometryInputPresenterTest >> dummyValues [

	^ {
		  BlRectangleGeometry new.
		  BlEllipseGeometry new.
		  BlRoundedRectangleGeometry new.
		  (BlPolygonGeometry vertices: {
				   (0 @ 0).
				   (100 @ 100).
				   (0 @ 100) }) }
]

{ #category : #tests }
PyramidGeometryInputPresenterTest >> makeNewInput [

	^ PyramidGeometryInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput whenValueChangedDo value: anInput value
]
