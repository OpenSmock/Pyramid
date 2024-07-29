Class {
	#name : #PyramidLibraryPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'categoryPresenter',
		'elementPresenter',
		'imagePresenter',
		'addButtonPresenter'
	],
	#category : #'Pyramid-Bloc-plugin-navigation'
}

{ #category : #accessing }
PyramidLibraryPresenter >> addButtonPresenter [

	^ addButtonPresenter
]

{ #category : #adding }
PyramidLibraryPresenter >> addCategories: aCollection [

	self categoryPresenter items = aCollection ifTrue: [ ^ self ].
	self categoryPresenter
		items: aCollection;
		selectIndex: 1
]

{ #category : #accessing }
PyramidLibraryPresenter >> categoryPresenter [

	^ categoryPresenter
]

{ #category : #initialization }
PyramidLibraryPresenter >> connectPresenters [

	categoryPresenter
		transmitTo: elementPresenter
		transform: [ :category |
			category ifNil: [ #(  ) ] ifNotNil: [ category elements ] ]
		postTransmission: [ :destination | destination selectIndex: 1 ]
]

{ #category : #layout }
PyramidLibraryPresenter >> defaultLayout [

	| panedSelection imageAndButton |
	panedSelection := SpPanedLayout newHorizontal
		                  add: self categoryPresenter;
		                  add: self elementPresenter;
		                  yourself.
	imageAndButton := SpBoxLayout newVertical
		                  add: self imagePresenter expand: true;
		                  add: self addButtonPresenter expand: false;
		                  yourself.
	^ SpPanedLayout newHorizontal
		  positionOfSlider: 2/3;
		  add: panedSelection;
		  add: imageAndButton;
		  yourself
]

{ #category : #accessing }
PyramidLibraryPresenter >> elementPresenter [

	^ elementPresenter
]

{ #category : #accessing }
PyramidLibraryPresenter >> imagePresenter [

	^ imagePresenter
]

{ #category : #initialization }
PyramidLibraryPresenter >> initializeCategories [

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

{ #category : #initialization }
PyramidLibraryPresenter >> initializePresenters [

	categoryPresenter := SpTablePresenter new
		                     hideColumnHeaders;
		                     addColumn: ((SpImageTableColumn
				                       title: 'Category-Icon'
				                       evaluated: [ :each | each icon ]) width: 20);
		                     addColumn: (SpStringTableColumn
				                      title: 'Category-Name'
				                      evaluated: [ :each | each name ]);
		                     yourself.
	elementPresenter := SpTablePresenter new
		                    hideColumnHeaders;
		                    addColumn: ((SpImageTableColumn
				                      title: 'Element-Icon'
				                      evaluated: [ :each | each icon ]) width: 20);
		                    addColumn: (SpStringTableColumn
				                     title: 'Element-Name'
				                     evaluated: [ :each | each name ]);
		                    whenSelectedItemChangedDo: [ :e |
			                    self addButtonPresenter enabled: e isNotNil.
			                    self addButtonPresenter action: [
					                    self addNewElement: e ].
			                    e
				                    ifNil: [
					                    self imagePresenter image:
							                    (Form extent: 1 asPoint) ]
				                    ifNotNil: [
					                    self imagePresenter image: e asForm ] ].
	imagePresenter := SpImagePresenter new
		                  autoScale: true;
		                  yourself.
	addButtonPresenter := SpButtonPresenter new
		                      label: 'Add new element';
		                      icon: (Smalltalk ui icons iconNamed: #add);
		                      enabled: false;
		                      yourself.
	self focusOrder
		add: categoryPresenter;
		add: elementPresenter;
		add: addButtonPresenter.
	
	self initializeCategories
]
