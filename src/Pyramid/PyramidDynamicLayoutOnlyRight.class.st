Class {
	#name : #PyramidDynamicLayoutOnlyRight,
	#superclass : #PyramidDynamicLayoutStrategy,
	#category : #'Pyramid-plugin-dynamic-layout'
}

{ #category : #'as yet unclassified' }
PyramidDynamicLayoutOnlyRight >> centerLayoutFor: aWindow [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: self class proportionRight;
		  add: (self spaceAndToolBarFor: aWindow);
		  add: (SpPanedLayout newVertical
				   positionOfSlider: self class proportionVertical;
				   add: (aWindow services at: #tabRightTop) presenter;
				   add: (aWindow services at: #tabRightBottom) presenter;
				   yourself);
		  yourself
]
