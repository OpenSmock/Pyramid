Class {
	#name : #PyramidDynamicLayoutOnlyRight,
	#superclass : #PyramidDynamicLayoutStrategy,
	#category : #'Pyramid-plugin-dynamic-layout'
}

{ #category : #'as yet unclassified' }
PyramidDynamicLayoutOnlyRight >> centerLayoutFor: aWindow [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 4 / 5;
		  add: (self spaceAndToolBarFor: aWindow);
		  add: (aWindow services at: #tabRight) presenter;
		  yourself
]
