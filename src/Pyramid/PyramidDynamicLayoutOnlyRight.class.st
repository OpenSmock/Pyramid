Class {
	#name : #PyramidDynamicLayoutOnlyRight,
	#superclass : #PyramidDynamicLayoutStrategy,
	#category : 'Pyramid-plugin-dynamic-layout'
}

{ #category : #'as yet unclassified' }
PyramidDynamicLayoutOnlyRight >> centerLayoutFor: aWindow [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: self class proportionRight;
		  add: (self spaceAndToolBarFor: aWindow);
		  add: (aWindow services at: #tabRight) presenter;
		  yourself
]
