Class {
	#name : #PyramidSelectionView,
	#superclass : #SpPresenter,
	#traits : 'TPyramidProjectModelObserver',
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'list',
		'playground',
		'projectModel'
	],
	#category : #'Pyramid-plugin-selection'
}

{ #category : #'as yet unclassified' }
PyramidSelectionView >> connectPlaygroundTo: anObject [

	self playground interactionModel:
		(SpCodeObjectInteractionModel on: anObject).
		self flag: #TODO. "remplacer ici par un interraction model custom en changeant la méthode doItReceiver par la meme chose mais en envoyant avant un message commande custom."
]

{ #category : #'as yet unclassified' }
PyramidSelectionView >> currentSelection [

	^ self projectModel selection
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

{ #category : #accessing }
PyramidSelectionView >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidSelectionView >> projectModel: aPyramidActiveProject [

	projectModel := aPyramidActiveProject.
	projectModel addObserver: self.
	self updateSelection
]

{ #category : #'as yet unclassified' }
PyramidSelectionView >> pyramidSelectionChanged [

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
