Class {
	#name : #PyramidDynamicWindow,
	#superclass : #PyramidWindow,
	#instVars : [
		'layoutStrategy'
	],
	#category : #'Pyramid-plugin-dynamic-layout'
}

{ #category : #accessing }
PyramidDynamicWindow >> layout [

	^ self layoutStrategy layoutFor: self
]

{ #category : #accessing }
PyramidDynamicWindow >> layoutStrategy [

	layoutStrategy ifNil: [
		layoutStrategy := PyramidDynamicLayoutAllPanels new ].
	^ layoutStrategy
]

{ #category : #accessing }
PyramidDynamicWindow >> layoutStrategy: aStrategy [

	layoutStrategy := aStrategy.
	self panelUpdated
]
