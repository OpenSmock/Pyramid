Class {
	#name : #PyramidDynamicLayoutStrategy,
	#superclass : #Object,
	#category : #'Pyramid-plugin-dynamic-layout'
}

{ #category : #'as yet unclassified' }
PyramidDynamicLayoutStrategy class >> proportion [

	^ 1 / 4
]

{ #category : #'as yet unclassified' }
PyramidDynamicLayoutStrategy class >> proportionRight [

	^ 1 - self proportion
]

{ #category : #'as yet unclassified' }
PyramidDynamicLayoutStrategy class >> proportionRightAndLeft [

	^ (1 - (2 * self proportion)) / (1 - self proportion)
]

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

{ #category : #'as yet unclassified' }
PyramidDynamicLayoutStrategy >> spaceAndToolBarFor: aWindow [
	"^ (aWindow services at: #space) presenter"

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: (aWindow services at: #space) presenter expand: true;
		  yourself
]

{ #category : #specs }
PyramidDynamicLayoutStrategy >> topLayoutFor: aWindow [

	| layout |
	layout := SpBoxLayout newHorizontal.
	layout add: (aWindow services at: #topLeft) presenter expand: true.
	layout add: SpNullPresenter new expand: true.
	layout add: (aWindow services at: #topCenter) presenter expand: true.
	layout add: SpNullPresenter new expand: true.
	layout add: (aWindow services at: #topRight) presenter expand: false.
	^ layout
]
