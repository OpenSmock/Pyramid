Class {
	#name : #PyramidLibraryPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'categoryPresenter',
		'elementPresenter',
		'imagePresenter',
		'addButtonPresenter',
		'libraryController'
	],
	#category : #'Pyramid-Bloc-plugin-navigation'
}

{ #category : #accessing }
PyramidLibraryPresenter >> addButtonPresenter [

	^ addButtonPresenter
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
		postTransmission: [ :destination | destination selectIndex: 1 ].
		
	categoryPresenter items ifEmpty: [ ^ self ].
	categoryPresenter selectFirst.
]

{ #category : #accessing }
PyramidLibraryPresenter >> defaultExtent [

	^ 600 @ 400
]

{ #category : #layout }
PyramidLibraryPresenter >> defaultLayout [

	| panedSelection imageAndButton panedLayout |
	panedSelection := SpPanedLayout newHorizontal
		                  add: self categoryPresenter;
		                  add: self elementPresenter;
		                  yourself.
	imageAndButton := SpBoxLayout newVertical
		                  add: self imagePresenter expand: true;
		                  add: self addButtonPresenter expand: false;
		                  yourself.
	panedLayout := SpPanedLayout newHorizontal
		               positionOfSlider: 2 / 3;
		               add: panedSelection;
		               add: imageAndButton;
		               yourself.
	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal add: panedLayout width: self defaultExtent x)
		  height: self defaultExtent y
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
PyramidLibraryPresenter >> initializePresenters [

	libraryController := PyramidLibraryController new
		                     library: self;
		                     yourself.
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
					                    self libraryController addNewElement: e ].
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
		add: addButtonPresenter
]

{ #category : #accessing }
PyramidLibraryPresenter >> libraryController [

	^ libraryController
]

{ #category : #accessing }
PyramidLibraryPresenter >> libraryController: anObject [

	libraryController := anObject.
	libraryController library: self.
]
