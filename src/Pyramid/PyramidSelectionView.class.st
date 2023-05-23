Class {
	#name : #PyramidSelectionView,
	#superclass : #SpPresenter,
	#traits : 'TPyramidActiveProjectModelObserver',
	#classTraits : 'TPyramidActiveProjectModelObserver classTrait',
	#instVars : [
		'activeProject',
		'list',
		'playground'
	],
	#category : #'Pyramid-plugin-selection'
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
PyramidSelectionView >> connectPlaygroundTo: anObject [

	self playground interactionModel:
		(SpCodeObjectInteractionModel on: anObject).
		self flag: #TODO. "remplacer ici par un interraction model custom en changeant la méthode doItReceiver par la meme chose mais en envoyant avant un message commande custom."
]

{ #category : #'as yet unclassified' }
PyramidSelectionView >> currentSelection [

	^ self activeProject selection elements
]

{ #category : #layout }
PyramidSelectionView >> defaultLayout [

	^ SpPanedLayout newVertical
		  add: self list;
		  add: self playground;
		  yourself
]

{ #category : #initialization }
PyramidSelectionView >> initializePresenters [

	list := self newList.
	playground := self newCode.
]

{ #category : #accessing }
PyramidSelectionView >> list [
^ list
]

{ #category : #accessing }
PyramidSelectionView >> playground [
	^ playground
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

	self list items: self currentSelection.
	self currentSelection ifEmpty: [
		self connectPlaygroundTo: nil.
		^ self ].
	self currentSelection size = 1 ifTrue: [
		self connectPlaygroundTo: self currentSelection first.
		^ self ].
	self connectPlaygroundTo: self currentSelection
]
