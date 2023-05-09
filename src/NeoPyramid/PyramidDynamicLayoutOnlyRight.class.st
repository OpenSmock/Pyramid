Class {
	#name : #PyramidDynamicLayoutOnlyRight,
	#superclass : #PyramidDynamicLayoutStrategy,
	#category : #'NeoPyramid-plugin-dynamic-layout'
}

{ #category : #'as yet unclassified' }
PyramidDynamicLayoutOnlyRight >> centerLayoutFor: aWindow [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 4 / 5;
		  add: (aWindow services at: #center) presenter;
		  add: (aWindow services at: #tabRight) presenter;
		  yourself
]
