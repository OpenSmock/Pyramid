Class {
	#name : #PyramidDynamicLayoutOnlyCenter,
	#superclass : #PyramidDynamicLayoutStrategy,
	#category : #'Pyramid-plugin-dynamic-layout'
}

{ #category : #'as yet unclassified' }
PyramidDynamicLayoutOnlyCenter >> centerLayoutFor: aWindow [

	^ (self spaceAndToolBarFor: aWindow)
]
