Class {
	#name : #PyramidCenterLayoutStrategy,
	#superclass : #PyramidSimpleLayoutStrategy,
	#category : #'NeoPyramid-views-deprecated'
}

{ #category : #'as yet unclassified' }
PyramidCenterLayoutStrategy >> mainPanelFrom: aPyramidEditorModel [

	^ self centerPanelFrom: aPyramidEditorModel centralViews
]
