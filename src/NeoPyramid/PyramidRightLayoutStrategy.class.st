Class {
	#name : #PyramidRightLayoutStrategy,
	#superclass : #PyramidSimpleLayoutStrategy,
	#category : #'NeoPyramid-views-deprecated'
}

{ #category : #'as yet unclassified' }
PyramidRightLayoutStrategy >> mainPanelFrom: aPyramidEditorModel [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 4 / 5;
		  add: (self centerPanelFrom: aPyramidEditorModel centralViews);
		  add: (self tabPanelFrom: aPyramidEditorModel rightTabs);
		  yourself
]
