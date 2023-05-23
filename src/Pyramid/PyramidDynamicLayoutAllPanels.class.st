Class {
	#name : #PyramidDynamicLayoutAllPanels,
	#superclass : #PyramidDynamicLayoutStrategy,
	#category : #'Pyramid-plugin-dynamic-layout'
}

{ #category : #'as yet unclassified' }
PyramidDynamicLayoutAllPanels >> centerLayoutFor: aWindow [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 1 / 5;
		  add: (aWindow services at: #tabLeft) presenter;
		  add: (SpPanedLayout newLeftToRight
				   positionOfSlider: 3 / 4;
				   add: (self spaceAndToolBarFor: aWindow);
				   add: (aWindow services at: #tabRight) presenter;
				   yourself);
		  yourself
]
