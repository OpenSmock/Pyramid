Class {
	#name : #PyramidDynamicWindow,
	#superclass : #PyramidWindow,
	#instVars : [
		'layoutStrategy'
	],
	#category : #'NeoPyramid-plugin-dynamic-layout'
}

{ #category : #initialization }
PyramidDynamicWindow >> initialize [

	PyramidPanelModel toolbarHorizontal installOn: self at: #topLeft.
	PyramidPanelModel toolbarHorizontal installOn: self at: #topCenter.
	PyramidPanelModel toolbarHorizontal installOn: self at: #topRight.

	PyramidPanelModel presenter installOn: self at: #center.

	PyramidPanelModel tab installOn: self at: #tabLeft.
	PyramidPanelModel tab installOn: self at: #tabRight
]

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
