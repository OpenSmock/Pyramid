Class {
	#name : #PyramidMenuPanelBuilder,
	#superclass : #PyramidPanelBuilder,
	#instVars : [
		'item',
		'emptyGroups',
		'multiGroups',
		'singleGroups'
	],
	#category : #'Pyramid-views'
}

{ #category : #adding }
PyramidMenuPanelBuilder >> addGroupEmptySelection: aGroupBlock order: aNumber [

	self emptyGroups add: aNumber -> aGroupBlock
]

{ #category : #adding }
PyramidMenuPanelBuilder >> addGroupMultiSelection: aGroupBlock order: aNumber [

	self multiGroups add: aNumber -> aGroupBlock
]

{ #category : #adding }
PyramidMenuPanelBuilder >> addGroupSingleSelection: aGroupBlock order: aNumber [

	self singleGroups add: aNumber -> aGroupBlock
]

{ #category : #'as yet unclassified' }
PyramidMenuPanelBuilder >> buildMenuFrom: aGroupOfBlocks with: aTarget [

	| menu group |
	menu := SpMenuPresenter new.

	(aGroupOfBlocks sorted: [ :a :b | a key <= b key ])do: [ :each |
		group := SpMenuGroupPresenter new.
		each value value: group value: aTarget.
		menu addMenuGroup: group ].
	^ menu
]

{ #category : #accessing }
PyramidMenuPanelBuilder >> emptyGroups [

	^ emptyGroups
]

{ #category : #initialization }
PyramidMenuPanelBuilder >> initialize [

	emptyGroups := OrderedCollection new.
	multiGroups := OrderedCollection new.
	singleGroups := OrderedCollection new
]

{ #category : #accessing }
PyramidMenuPanelBuilder >> item [
]

{ #category : #'as yet unclassified' }
PyramidMenuPanelBuilder >> menuFor: aCollection [

	aCollection ifEmpty: [ ^ self buildMenuFrom: self emptyGroups with: nil ].
	aCollection size = 1 ifTrue: [
		^ self buildMenuFrom: self singleGroups with: aCollection first ].
	^ self buildMenuFrom: self multiGroups with: aCollection
]

{ #category : #accessing }
PyramidMenuPanelBuilder >> multiGroups [

	^ multiGroups
]

{ #category : #accessing }
PyramidMenuPanelBuilder >> presenterOf: aCollectionOfItems [

	^ SpNullPresenter new
]

{ #category : #initialization }
PyramidMenuPanelBuilder >> reset [
]

{ #category : #accessing }
PyramidMenuPanelBuilder >> singleGroups [

	^ singleGroups
]
