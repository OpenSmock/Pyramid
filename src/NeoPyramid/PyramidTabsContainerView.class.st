Class {
	#name : #PyramidTabsContainerView,
	#superclass : #SpPresenter,
	#instVars : [
		'notebook'
	],
	#category : #NeoPyramid
}

{ #category : #adding }
PyramidTabsContainerView >> addClosableTab: aPyramidElementView [

	| page |
	page := SpNotebookPage
		        title: aPyramidElementView title
		        icon: aPyramidElementView icon
		        provider: aPyramidElementView presenter.
	page beCloseable.
	self notebook addPage: page
]

{ #category : #adding }
PyramidTabsContainerView >> addTab: aPyramidElementView [
	| page |
page := SpNotebookPage
		  title: aPyramidElementView title
		  icon: aPyramidElementView icon
		  provider: aPyramidElementView presenter.
	self notebook addPage: page
]

{ #category : #layout }
PyramidTabsContainerView >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: self notebook;
		  yourself
]

{ #category : #initialization }
PyramidTabsContainerView >> initializePresenters [

	notebook := SpNotebookPresenter new.
]

{ #category : #accessing }
PyramidTabsContainerView >> notebook [
	^ notebook
]

{ #category : #'as yet unclassified' }
PyramidTabsContainerView >> whenTabClose: aBlock [
	
]
