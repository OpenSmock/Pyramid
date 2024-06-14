Class {
	#name : 'NeoPyramidLibraryFactoryPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'categoryPresenter',
		'factoryPresenter',
		'categories',
		'selectedCategory',
		'selectedFactory',
		'whenItemChangeDo'
	],
	#category : 'Pyramid-Bloc-plugin-tree-library',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-tree-library'
}

{ #category : 'accessing' }
NeoPyramidLibraryFactoryPresenter >> categories [

	^ categories
]

{ #category : 'accessing' }
NeoPyramidLibraryFactoryPresenter >> categories: anObject [

	categories := anObject.
	self categoryPresenter items: anObject
]

{ #category : 'accessing' }
NeoPyramidLibraryFactoryPresenter >> categoryPresenter [

	^ categoryPresenter
]

{ #category : 'layout' }
NeoPyramidLibraryFactoryPresenter >> defaultLayout [

	^ SpPanedLayout newHorizontal add: self categoryPresenter; add: self factoryPresenter ; yourself.
]

{ #category : 'accessing' }
NeoPyramidLibraryFactoryPresenter >> factoryPresenter [

	^ factoryPresenter
]

{ #category : 'initialization - deprecated' }
NeoPyramidLibraryFactoryPresenter >> initialize [

	super initialize.
	whenItemChangeDo := [ :e |  ].

]

{ #category : 'initialization - deprecated' }
NeoPyramidLibraryFactoryPresenter >> initializePresenter [

	whenItemChangeDo := [ :e | ].
	categoryPresenter := SpTablePresenter new
		                     addColumn: ((SpImageTableColumn
				                       title: 'Icon'
				                       evaluated: [ :aCategory | aCategory icon ])
				                      width: 50;
				                      yourself);
		                     addColumn:
		                     (SpStringTableColumn
			                      title: 'Name'
			                      evaluated: #name);
		                     whenSelectedItemChangedDo: [ :category |
		                     self selectedCategory: category ];
		                     beResizable;
		                     yourself.
	factoryPresenter := SpTablePresenter new
	 addColumn: ((SpImageTableColumn
				                      title: 'Icon'
				                      evaluated: [ :aFactory |
					                      aFactory elementIcon ])
				                     width: 50;
				                     yourself);
		                    addColumn:
			                    (SpStringTableColumn
				                     title: 'Name'
				                     evaluated: #elementName);
		                    whenSelectedItemChangedDo: [ :factory |
			                    self selectedFactory: factory ];
		                    beResizable;
		                    yourself
]

{ #category : 'accessing' }
NeoPyramidLibraryFactoryPresenter >> selectedCategory [

	^ selectedCategory
]

{ #category : 'accessing' }
NeoPyramidLibraryFactoryPresenter >> selectedCategory: anObject [

	selectedCategory := anObject.
	anObject ifNil: [ ^ self ].
	self factoryPresenter items: anObject factories
]

{ #category : 'accessing' }
NeoPyramidLibraryFactoryPresenter >> selectedFactory [

	^ selectedFactory
]

{ #category : 'accessing' }
NeoPyramidLibraryFactoryPresenter >> selectedFactory: anObject [

	selectedFactory := anObject.
	self whenItemChangeDo value: anObject
]

{ #category : 'accessing' }
NeoPyramidLibraryFactoryPresenter >> whenItemChangeDo [

	^ whenItemChangeDo
]

{ #category : 'accessing' }
NeoPyramidLibraryFactoryPresenter >> whenItemChangeDo: anObject [

	whenItemChangeDo := anObject
]
