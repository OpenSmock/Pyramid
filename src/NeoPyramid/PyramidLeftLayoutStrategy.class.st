Class {
	#name : #PyramidLeftLayoutStrategy,
	#superclass : #PyramidSimpleLayoutStrategy,
	#category : #'NeoPyramid-views'
}

{ #category : #'as yet unclassified' }
PyramidLeftLayoutStrategy >> mainPanelFrom: aPyramidEditorModel [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 1 / 5;
		  add: (self tabPanelFrom: aPyramidEditorModel leftTabs);
				   add: (self centerPanelFrom: aPyramidEditorModel centralViews);
		  yourself
]
