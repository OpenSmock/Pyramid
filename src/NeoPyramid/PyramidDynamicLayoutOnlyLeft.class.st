Class {
	#name : #PyramidDynamicLayoutOnlyLeft,
	#superclass : #PyramidDynamicLayoutStrategy,
	#category : #'NeoPyramid-plugin-dynamic-layout'
}

{ #category : #'as yet unclassified' }
PyramidDynamicLayoutOnlyLeft >> centerLayoutFor: aWindow [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 1 / 5;
		  add: (aWindow services at: #tabLeft) presenter;
		  add: (self spaceAndToolBarFor: aWindow);
		  yourself
]
