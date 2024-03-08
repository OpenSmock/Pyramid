"
I create a `SpPresenter` from a `PyramidPropertiesManager` that expose multiple properties of objects inside a collection.

I do that with the message `#buildPresenterFromCollection:andManager:`.

To be exposed, a property must at least have one object that have this property.

In other terms, any property who is not linked to any object in the collection will not display.

"
Class {
	#name : #PyramidHideEmptyPropertyStrategy,
	#superclass : #PyramidPresenterPropertiesStrategy,
	#category : #'Pyramid-property'
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
PyramidHideEmptyPropertyStrategy >> buildPresenterFromCollection: aCollection andManager: aManager [

	| clustersAndProps |
	clustersAndProps := aManager properties collect: [ :each |
		                    (each command clusterOf: aCollection asArray)
		                    -> each ].
	^ self buildPresenterFromClustersAndProperties: clustersAndProps
]

{ #category : #'as yet unclassified' }
PyramidHideEmptyPropertyStrategy >> emptyPresenter [

	| presenter layout |
	presenter := SpPresenter new.
	layout := SpBoxLayout newVertical
		          spacing: 4;
		          add: 'No elements selected';
		          yourself.

	presenter layout: layout.
	^ presenter
]

{ #category : #'as yet unclassified' }
PyramidHideEmptyPropertyStrategy >> presenterWith: aCollection [

	| presenter layout |
	presenter := SpPresenter new.
	layout := SpBoxLayout newVertical
		          spacing: 8;
		          yourself.

	aCollection do: [ :each | layout add: each expand: false ].
	presenter layout: layout.
	^ presenter
]
