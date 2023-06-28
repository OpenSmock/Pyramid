Class {
	#name : #PyramidDynamicLayoutOnlyLeft,
	#superclass : #PyramidDynamicLayoutStrategy,
	#category : #'Pyramid-plugin-dynamic-layout'
}

{ #category : #'as yet unclassified' }
PyramidDynamicLayoutOnlyLeft >> centerLayoutFor: aWindow [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: self class proportion;
		  add: (aWindow services at: #tabLeft) presenter;
		  add: (self spaceAndToolBarFor: aWindow);
		  yourself
]
