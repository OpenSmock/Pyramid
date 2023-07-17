Class {
	#name : #PyramidHideEmptyPropertyStrategy,
	#superclass : #PyramidPresenterPropertiesStrategy,
	#category : #'NeoPyramid-property'
}

{ #category : #'as yet unclassified' }
PyramidHideEmptyPropertyStrategy >> buildPresenterFromClustersAndProperties: aCollection [

	| notEmptyClustersAndProperties presenters |
	notEmptyClustersAndProperties := aCollection select: [ :each |
		                                 each key isNotEmpty ].
	presenters := notEmptyClustersAndProperties collect: [ :each |
		              each value buildPresenterFromCluster: each key ].
	presenters ifEmpty: [ ^ self emptyPresenter ].
	^ self presenterWith: presenters
]

{ #category : #'as yet unclassified' }
PyramidHideEmptyPropertyStrategy >> emptyPresenter [

	| presenter layout |
	presenter := SpPresenter new.
	layout := SpBoxLayout newVertical
		          spacing: 4;
		add: 'No element selectionned';
		          yourself.

	presenter layout: layout.
	^ presenter
]

{ #category : #'as yet unclassified' }
PyramidHideEmptyPropertyStrategy >> presenterWith: aCollection [

	| presenter layout |
	presenter := SpPresenter new.
	layout := SpBoxLayout newVertical
		          spacing: 4;
		          yourself.

	aCollection do: [ :each | layout add: each expand: false ].
	presenter layout: layout.
	^ presenter
]
