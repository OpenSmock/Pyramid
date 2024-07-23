Class {
	#name : #PyramidDynamicLayoutAllPanels,
	#superclass : #PyramidDynamicLayoutStrategy,
	#category : #'Pyramid-plugin-dynamic-layout'
}

{ #category : #'as yet unclassified' }
PyramidDynamicLayoutAllPanels >> centerLayoutFor: aWindow [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: self class proportion;
		  add: (aWindow services at: #tabLeft) presenter;
		  add: (SpPanedLayout newLeftToRight
				   positionOfSlider: self class proportionRightAndLeft;
				   add: (self spaceAndToolBarFor: aWindow);
				   add: (aWindow services at: #tabRight) presenter;
				   yourself);
		  yourself
]
