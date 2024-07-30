Class {
	#name : #PyramidNavigationPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'toolPanel',
		'selectionPanel',
		'navigationModel',
		'library'
	],
	#category : #'Pyramid-Bloc-plugin-navigation'
}

{ #category : #layout }
PyramidNavigationPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: self toolPanel expand: false;
		  add: self selectionPanel expand: true;
		  yourself
]

{ #category : #accessing }
PyramidNavigationPresenter >> editor: aPyramidEditor [

	self toolPanel editor: aPyramidEditor.
	self selectionPanel editor: aPyramidEditor.
	self library libraryController editor: aPyramidEditor.
]

{ #category : #initialization }
PyramidNavigationPresenter >> initializePresenters [

	library := PyramidLibraryPresenter new.
	library libraryController initializeCategories.
	navigationModel := PyramidNavigationModel new.
	toolPanel := PyramidNavigationToolsPresenter new
		             navigationModel: self navigationModel;
		             library: self library;
		             yourself.
	selectionPanel := PyramidNavigationTreePresenter new
		                  navigationModel: self navigationModel;
		                  yourself
]

{ #category : #accessing }
PyramidNavigationPresenter >> library [

	^ library
]

{ #category : #accessing }
PyramidNavigationPresenter >> navigationModel [

	^ navigationModel
]

{ #category : #api }
PyramidNavigationPresenter >> roots: aCollection [

	self selectionPanel roots: aCollection
]

{ #category : #accessing }
PyramidNavigationPresenter >> selectionPanel [

	^ selectionPanel
]

{ #category : #accessing }
PyramidNavigationPresenter >> toolPanel [

	^ toolPanel
]
