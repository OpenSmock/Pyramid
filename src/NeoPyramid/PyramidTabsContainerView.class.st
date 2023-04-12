Class {
	#name : #PyramidTabsContainerView,
	#superclass : #SpPresenter,
	#instVars : [
		'notebook',
		'builder'
	],
	#category : #'NeoPyramid-views'
}

{ #category : #adding }
PyramidTabsContainerView >> addAllTabs: aCollection [

aCollection do: [ :each | self builder makeTabFrom: each for: self ]
	
]

{ #category : #adding }
PyramidTabsContainerView >> addTab: aSpNotebookPage [

	self notebook addPage: aSpNotebookPage
]

{ #category : #accessing }
PyramidTabsContainerView >> builder [
	^ builder
]

{ #category : #accessing }
PyramidTabsContainerView >> builder: aBuilder [

	builder := aBuilder
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
