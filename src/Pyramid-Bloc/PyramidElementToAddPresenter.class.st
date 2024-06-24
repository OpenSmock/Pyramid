Class {
	#name : 'PyramidElementToAddPresenter',
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
PyramidElementToAddPresenter class >> defaultEmptyFactory [

	^ PyramidElementToAddFactoryEmpty new
]

{ #category : 'accessing' }
PyramidElementToAddPresenter >> addButton [

	^ addButton
]

{ #category : 'accessing' }
PyramidElementToAddPresenter >> currentFactory [

	currentFactory ifNil: [ currentFactory := self class defaultEmptyFactory ].
	^ currentFactory
]

{ #category : 'accessing' }
PyramidElementToAddPresenter >> currentFactory: anObject [

	currentFactory := anObject.
	self preview image: self currentFactory makeForm.
	self addButton enabled: self currentFactory canMakeNewElement
]

{ #category : 'layout' }
PyramidElementToAddPresenter >> defaultLayout [

	^ SpPanedLayout newHorizontal
				   add: self selector;
				   add: (SpBoxLayout newVertical
						    spacing: 4;
						    add: self preview expand: true;
						    add: self addButton expand: false;
						    yourself);
				   yourself
]

{ #category : 'requirements' }
PyramidElementToAddPresenter >> elementToAdd [

	^ self currentFactory makeElement
]

{ #category : 'initialization - deprecated' }
PyramidElementToAddPresenter >> initializePresenter [

	addButton := SpButtonPresenter new
		             label: 'Add';
		             icon: (Smalltalk ui icons iconNamed: #add);
		             enabled: false;
		             yourself.
	selector := PyramidElementToAddFactoryPresenter new whenItemChangeDo: [
		            :aFactory | self currentFactory: aFactory ].
	preview := SpImagePresenter new autoScale: true.
	libraryModel := PyramidElementToAddModel defaultLibrary.
	self refresh
]

{ #category : 'accessing' }
PyramidElementToAddPresenter >> libraryModel [

	^ libraryModel
]

{ #category : 'accessing' }
PyramidElementToAddPresenter >> libraryModel: anObject [

	libraryModel := anObject.
	self refresh
]

{ #category : 'accessing' }
PyramidElementToAddPresenter >> preview [

	^ preview
]

{ #category : 'accessing' }
PyramidElementToAddPresenter >> refresh [

	self currentFactory: nil.
	self selector categories: self libraryModel allCategories
]

{ #category : 'accessing' }
PyramidElementToAddPresenter >> selector [

	^ selector
]
