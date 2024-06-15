Class {
	#name : 'PyramidElementToAddFactoryPresenter',
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
PyramidElementToAddFactoryPresenter >> categories [

	^ categories
]

{ #category : 'accessing' }
PyramidElementToAddFactoryPresenter >> categories: anObject [

	categories := anObject.
	self categoryPresenter items: anObject
]

{ #category : 'accessing' }
PyramidElementToAddFactoryPresenter >> categoryPresenter [

	^ categoryPresenter
]

{ #category : 'layout' }
PyramidElementToAddFactoryPresenter >> defaultLayout [

	^ SpPanedLayout newHorizontal add: self categoryPresenter; add: self factoryPresenter ; yourself.
]

{ #category : 'accessing' }
PyramidElementToAddFactoryPresenter >> factoryPresenter [

	^ factoryPresenter
]

{ #category : 'initialization - deprecated' }
PyramidElementToAddFactoryPresenter >> initialize [

	super initialize.
	whenItemChangeDo := [ :e |  ].

]

{ #category : 'initialization - deprecated' }
PyramidElementToAddFactoryPresenter >> initializePresenter [

	whenItemChangeDo := [ :e |  ].
	categoryPresenter := SpTablePresenter new
		                     addColumn: ((SpImageTableColumn
				                       title: 'Icon'
				                       evaluated: [ :aCategory | aCategory icon ])
				                      width: 20;
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
				                     width: 20;
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
PyramidElementToAddFactoryPresenter >> selectedCategory [

	^ selectedCategory
]

{ #category : 'accessing' }
PyramidElementToAddFactoryPresenter >> selectedCategory: anObject [

	selectedCategory := anObject.
	anObject ifNil: [ ^ self ].
	self factoryPresenter items: anObject factories
]

{ #category : 'accessing' }
PyramidElementToAddFactoryPresenter >> selectedFactory [

	^ selectedFactory
]

{ #category : 'accessing' }
PyramidElementToAddFactoryPresenter >> selectedFactory: anObject [

	selectedFactory := anObject.
	self whenItemChangeDo value: anObject
]

{ #category : 'accessing' }
PyramidElementToAddFactoryPresenter >> whenItemChangeDo [

	^ whenItemChangeDo
]

{ #category : 'accessing' }
PyramidElementToAddFactoryPresenter >> whenItemChangeDo: anObject [

	whenItemChangeDo := anObject
]
