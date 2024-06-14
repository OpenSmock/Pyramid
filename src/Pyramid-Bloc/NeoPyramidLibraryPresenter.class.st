Class {
	#name : 'NeoPyramidLibraryPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'selector',
		'preview',
		'addButton',
		'libraryModel',
		'currentFactory'
	],
	#category : 'Pyramid-Bloc-plugin-tree-library',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-tree-library'
}

{ #category : 'as yet unclassified' }
NeoPyramidLibraryPresenter class >> defaultEmptyFactory [

	^ NeoPyramidLibraryFactoryEmpty new
]

{ #category : 'accessing' }
NeoPyramidLibraryPresenter >> addButton [

	^ addButton
]

{ #category : 'accessing' }
NeoPyramidLibraryPresenter >> currentFactory [

	currentFactory ifNil: [ currentFactory := self class defaultEmptyFactory ].
	^ currentFactory
]

{ #category : 'accessing' }
NeoPyramidLibraryPresenter >> currentFactory: anObject [

	currentFactory := anObject.
	self preview image: self currentFactory makeForm.
	self addButton enabled: self currentFactory canMakeNewElement
]

{ #category : 'layout' }
NeoPyramidLibraryPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpLabelPresenter new
				   label: 'Library';
				   displayBold: [ :a | true ];
				   yourself)
		  expand: false;
		  add: (SpPanedLayout newHorizontal
				   add: self selector;
				   add: (SpBoxLayout newVertical
						    spacing: 4;
						    add: self preview expand: true;
						    add: self addButton expand: false;
						    yourself);
				   yourself) height: 400;
		  yourself
]

{ #category : 'requirements' }
NeoPyramidLibraryPresenter >> elementToAdd [

	^ self currentFactory makeElement
]

{ #category : 'initialization - deprecated' }
NeoPyramidLibraryPresenter >> initializePresenter [

	addButton := SpButtonPresenter new
		             label: 'Add';
		             icon: (Smalltalk ui icons iconNamed: #add);
		             enabled: false;
		             yourself.
	selector := NeoPyramidLibraryFactoryPresenter new whenItemChangeDo: [
		            :aFactory | self currentFactory: aFactory ].
	preview := SpImagePresenter new autoScale: true.
	libraryModel := NeoPyramidLibraryModel defaultLibrary.
	self refresh
]

{ #category : 'accessing' }
NeoPyramidLibraryPresenter >> libraryModel [

	^ libraryModel
]

{ #category : 'accessing' }
NeoPyramidLibraryPresenter >> libraryModel: anObject [

	libraryModel := anObject.
	self refresh
]

{ #category : 'accessing' }
NeoPyramidLibraryPresenter >> preview [

	^ preview
]

{ #category : 'accessing' }
NeoPyramidLibraryPresenter >> refresh [

	self currentFactory: nil.
	self selector categories: self libraryModel allCategories
]

{ #category : 'accessing' }
NeoPyramidLibraryPresenter >> selector [

	^ selector
]
