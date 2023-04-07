Class {
	#name : #PyramidTabsContainerView,
	#superclass : #SpPresenter,
	#instVars : [
		'notebook'
	],
	#category : #'NeoPyramid-views'
}

{ #category : #adding }
PyramidTabsContainerView >> addTab: aSpNotebookPage [

	self notebook addPage: aSpNotebookPage
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
