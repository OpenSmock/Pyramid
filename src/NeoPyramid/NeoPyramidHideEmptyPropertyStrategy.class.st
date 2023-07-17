Class {
	#name : #NeoPyramidHideEmptyPropertyStrategy,
	#superclass : #NeoPyramidPresenterPropertiesStrategy,
	#category : #'NeoPyramid-property'
}

{ #category : #'as yet unclassified' }
NeoPyramidHideEmptyPropertyStrategy >> buildPresenterFromClustersAndProperties: aCollection [

	| notEmptyClustersAndProperties presenters |
	notEmptyClustersAndProperties := aCollection select: [ :each |
		                                 each key isNotEmpty ].
	presenters := notEmptyClustersAndProperties collect: [ :each |
		              each value buildPresenterFromCluster: each key ].
	^ self presenterWith: presenters
]

{ #category : #'as yet unclassified' }
NeoPyramidHideEmptyPropertyStrategy >> presenterWith: aCollection [

	| presenter layout |
	presenter := SpPresenter new.
	layout := SpBoxLayout newVertical
		          spacing: 4;
		          yourself.

	aCollection do: [ :each | layout add: each expand: false ].
	presenter layout: layout.
	^ presenter
]
