Class {
	#name : #PyramidSelectionView,
	#superclass : #SpPresenter,
	#traits : 'TPyramidActiveProjectModelObserver',
	#classTraits : 'TPyramidActiveProjectModelObserver classTrait',
	#instVars : [
		'activeProject',
		'list'
	],
	#category : #'NeoPyramid-plugin-selection'
}

{ #category : #accessing }
PyramidSelectionView >> activeProject [

	^ activeProject
]

{ #category : #accessing }
PyramidSelectionView >> activeProject: aPyramidActiveProject [

	activeProject := aPyramidActiveProject.
	activeProject addObserver: self.
	self updateSelection
]

{ #category : #'as yet unclassified' }
PyramidSelectionView >> currentSelection [

	^ self activeProject selection elements
]

{ #category : #layout }
PyramidSelectionView >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: self list expand: true;
		  yourself
]

{ #category : #initialization }
PyramidSelectionView >> initializePresenters [

	list := self newList.

]

{ #category : #accessing }
PyramidSelectionView >> list [
^ list
]

{ #category : #'as yet unclassified' }
PyramidSelectionView >> pyramidActiveProjectChangedChanged [

	self updateSelection
]

{ #category : #'as yet unclassified' }
PyramidSelectionView >> pyramidSelectionChangedOnActiveProject [

	self updateSelection
]

{ #category : #'as yet unclassified' }
PyramidSelectionView >> updateSelection [

	self list items: self currentSelection
]
