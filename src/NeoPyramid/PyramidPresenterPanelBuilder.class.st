Class {
	#name : #PyramidPresenterPanelBuilder,
	#superclass : #PyramidPanelBuilder,
	#instVars : [
		'item'
	],
	#category : #'NeoPyramid-aaa-views'
}

{ #category : #'as yet unclassified' }
PyramidPresenterPanelBuilder >> item [ 
	^ item
]

{ #category : #'as yet unclassified' }
PyramidPresenterPanelBuilder >> makePresenter: aPresenter [

	item := aPresenter
]

{ #category : #accessing }
PyramidPresenterPanelBuilder >> presenterOf: aCollectionOfItems [

	aCollectionOfItems ifEmpty: [ ^ SpNullPresenter new ].
	^ aCollectionOfItems first
]

{ #category : #initialization }
PyramidPresenterPanelBuilder >> reset [
 item := nil
]
