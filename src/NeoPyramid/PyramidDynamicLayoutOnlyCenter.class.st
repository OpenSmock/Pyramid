Class {
	#name : #PyramidDynamicLayoutOnlyCenter,
	#superclass : #PyramidDynamicLayoutStrategy,
	#category : #'NeoPyramid-plugin-dynamic-layout'
}

{ #category : #'as yet unclassified' }
PyramidDynamicLayoutOnlyCenter >> centerLayoutFor: aWindow [

	^ (self spaceAndToolBarFor: aWindow)
]
