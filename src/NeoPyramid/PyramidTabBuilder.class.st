Class {
	#name : #PyramidTabBuilder,
	#superclass : #Object,
	#category : #'NeoPyramid-views-deprecated'
}

{ #category : #'as yet unclassified' }
PyramidTabBuilder >> makeTabFrom: aPyramidTab for: aPyramidTabsView [

	| tab |
	tab := SpNotebookPage
		       title: aPyramidTab title
		       icon: aPyramidTab icon
		       provider: aPyramidTab presenter.
	self flag: #TODO. "Make closable"
	"aPyramidTab isClosable ifTrue: [ self addClosableCallback: tab ]."
	aPyramidTabsView addTab: tab
]
