Class {
	#name : #PyramidLibraryController,
	#superclass : #Object,
	#instVars : [
		'library',
		'popoverOrigin',
		'editor',
		'addElementsBlock',
		'idGenerator'
	],
	#category : #'Pyramid-Bloc-plugin-navigation'
}

{ #category : #adding }
PyramidLibraryController >> addCategories: aCollection [

	self library categoryPresenter items = aCollection ifTrue: [ ^ self ].
	self library categoryPresenter
		items: aCollection;
		selectIndex: 1
]

{ #category : #accessing }
PyramidLibraryController >> addElementsBlock [

	^ addElementsBlock
]

{ #category : #accessing }
PyramidLibraryController >> addElementsBlock: anObject [

	addElementsBlock := anObject
]

{ #category : #adding }
PyramidLibraryController >> addNewElement: aLibraryElement [

	self addElementsBlock value: aLibraryElement asArray
]

{ #category : #accessing }
PyramidLibraryController >> editor [

	^ editor
]

{ #category : #accessing }
PyramidLibraryController >> editor: anObject [

	editor := anObject
]

{ #category : #'as yet unclassified' }
PyramidLibraryController >> idGenerator [

	^ idGenerator
]

{ #category : #initialization }
PyramidLibraryController >> initialize [

	addElementsBlock := [ :e |  ].
	idGenerator := Generator on: [ :generator |
		  | index |
		  index := 1.
		  [
		  Character alphabet do: [ :each |
			  | next suffix |
			  next := each asUppercase asString.
			  suffix := index = 1
				            ifTrue: [ '' ]
				            ifFalse: [ index asString ].
			  generator yield: next , suffix ].
		  index := index + 1 ] repeat ]
]

{ #category : #initialization }
PyramidLibraryController >> initializeCategories [

	| pragmas sorted |
	pragmas := Pragma allNamed: #pyramidLibraryCategory:.
	sorted := pragmas sorted: [ :a :b |
		          a arguments first < b arguments first ].
	self addCategories: (sorted flatCollect: [ :each |
			 each method
				 receiver: self
				 withArguments: #(  )
				 executeMethod: each method ])
]

{ #category : #accessing }
PyramidLibraryController >> library [

	^ library
]

{ #category : #accessing }
PyramidLibraryController >> library: anObject [

	library := anObject
]

{ #category : #'as yet unclassified' }
PyramidLibraryController >> openForRoot [

	self addElementsBlock: [ :arrayOfElement |
		self renameElements: arrayOfElement.
		self editor propertiesManager commandExecutor
			use: PyramidAddAllToCollectionCommand new
			on: { self editor projectModel firstLevelElements }
			with: arrayOfElement ].
	self openInPopover
]

{ #category : #'as yet unclassified' }
PyramidLibraryController >> openForSelection [

	self addElementsBlock: [ :arrayOfElement |
		self editor propertiesManager commandExecutor
			use: PyramidAddChildrenCommand new
			on: self editor projectModel selection
			with: arrayOfElement ].
	self openInPopover
]

{ #category : #'as yet unclassified' }
PyramidLibraryController >> openInPopover [

	self popoverOrigin ifNil: [ ^ self ].
	(PyramidPopoverFactory
		 makeWithPresenter: self library
		 relativeTo: self popoverOrigin
		 position: SpPopoverPosition right) popup
]

{ #category : #accessing }
PyramidLibraryController >> popoverOrigin [

	^ popoverOrigin
]

{ #category : #accessing }
PyramidLibraryController >> popoverOrigin: anObject [

	popoverOrigin := anObject
]

{ #category : #'as yet unclassified' }
PyramidLibraryController >> renameElements: aCollection [

	aCollection do: [ :each | each id: self idGenerator next ]
]
