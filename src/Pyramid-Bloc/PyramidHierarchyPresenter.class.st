Class {
	#name : #PyramidHierarchyPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tree',
		'search'
	],
	#category : #'Pyramid-Bloc-plugin-hierarchy'
}

{ #category : #accessing }
PyramidHierarchyPresenter >> activeProject: aPyramidProject [

	self search activeProject: aPyramidProject
]

{ #category : #accessing }
PyramidHierarchyPresenter >> connectOn: aPyramidEditor [

	self search activeProject: aPyramidEditor activeProject.
	self tree connectOn: aPyramidEditor
]

{ #category : #initialization }
PyramidHierarchyPresenter >> defaultLayout [

	^ SpBoxLayout newVertical spacing: 4; add: self tree; add: self search; yourself
]

{ #category : #initialization }
PyramidHierarchyPresenter >> initializePresenters [

	tree := PyramidTreePresenter new.
	search := PyramidSearchAndSelectPresenter new.
]

{ #category : #accessing }
PyramidHierarchyPresenter >> search [

	^ search
]

{ #category : #initialization }
PyramidHierarchyPresenter >> tree [
^ tree
]
