Class {
	#name : #PyramidTabPanelBuilder,
	#superclass : #PyramidPanelBuilder,
	#instVars : [
		'presenter',
		'item'
	],
	#category : #'Pyramid-views'
}

{ #category : #accessing }
PyramidTabPanelBuilder >> item [

	^ item
]

{ #category : #'as yet unclassified' }
PyramidTabPanelBuilder >> makeTab: aPresenter label: aString icon: anIcon order: aNumber [

	item := PyramidTabItem new
		        presenter: aPresenter;
		        order: aNumber;
		        label: aString;
		        icon: anIcon;
		        yourself
]

{ #category : #accessing }
PyramidTabPanelBuilder >> notebook [
^ SpNotebookPresenter new
]

{ #category : #accessing }
PyramidTabPanelBuilder >> presenterOf: aCollectionOfItems [

	| notebook |
	notebook := self notebook.
	aCollectionOfItems sorted do: [ :each | each addOnNotebook: notebook ].
	^ notebook
]

{ #category : #initialization }
PyramidTabPanelBuilder >> reset [

	item := nil
]
