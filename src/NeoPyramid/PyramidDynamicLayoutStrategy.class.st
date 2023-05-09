Class {
	#name : #PyramidDynamicLayoutStrategy,
	#superclass : #Object,
	#category : #'NeoPyramid-plugin-dynamic-layout'
}

{ #category : #'as yet unclassified' }
PyramidDynamicLayoutStrategy >> centerLayoutFor: aWindow [

	^ self shouldBeImplemented 
]

{ #category : #accessing }
PyramidDynamicLayoutStrategy >> layoutFor: aWindow [

	| mainLayout |
	mainLayout := SpBoxLayout new
		              spacing: 4;
		              yourself.
	mainLayout add: (self topLayoutFor: aWindow) expand: false.
	mainLayout add: (self centerLayoutFor: aWindow) expand: true.
	^ mainLayout
]

{ #category : #specs }
PyramidDynamicLayoutStrategy >> topLayoutFor: aWindow [

	| layout |
	layout := SpBoxLayout newHorizontal.
	layout add: (aWindow services at: #topLeft) presenter expand: false.
	layout add: SpNullPresenter new expand: true.
	layout add: (aWindow services at: #topCenter) presenter expand: false.
	layout add: SpNullPresenter new expand: true.
	layout add: (aWindow services at: #topRight) presenter expand: false.
	^ layout
]
