Class {
	#name : #PyramidNavigationPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'libraryPanel',
		'selectionPanel',
		'navigationModel'
	],
	#category : #'Pyramid-Bloc-plugin-navigation'
}

{ #category : #layout }
PyramidNavigationPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: self libraryPanel expand: false;
		  add: self selectionPanel expand: true;
		  yourself
]

{ #category : #accessing }
PyramidNavigationPresenter >> editor: aPyramidEditor [

	self libraryPanel editor: aPyramidEditor.
	self selectionPanel editor: aPyramidEditor
]

{ #category : #initialization }
PyramidNavigationPresenter >> initializePresenters [

	navigationModel := PyramidNavigationModel new.

	libraryPanel := PyramidNavigationToolsPresenter new
		                navigationModel: self navigationModel;
		                yourself.
	selectionPanel := PyramidNavigationTreePresenter new
		                  navigationModel: self navigationModel;
		                  yourself
]

{ #category : #accessing }
PyramidNavigationPresenter >> libraryPanel [

	^ libraryPanel
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
