Class {
	#name : #PyramidPanelModel,
	#superclass : #Object,
	#instVars : [
		'builder',
		'items',
		'window',
		'presenter'
	],
	#category : #'NeoPyramid-aaa-views'
}

{ #category : #accessing }
PyramidPanelModel class >> presenter [

	^ self new
		  builder: PyramidPresenterPanelBuilder new;
		  yourself
]

{ #category : #accessing }
PyramidPanelModel class >> tab [

	^ self new
		  builder: PyramidTabPanelBuilder new;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPanelModel class >> toolbarHorizontal [

^ self new
		  builder: (PyramidToolbarPanelBuilder new isHorizontal: true; yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPanelModel class >> toolbarVertical [

	^ self new
		  builder: (PyramidToolbarPanelBuilder new
				   isHorizontal: false;
				   yourself);
		  yourself
]

{ #category : #adding }
PyramidPanelModel >> addItem: aBlock [

	self builder reset.
	aBlock value: self builder.
	self items add: self builder item.
	self informItemsChanged.
]

{ #category : #accessing }
PyramidPanelModel >> builder [

	^ builder
]

{ #category : #accessing }
PyramidPanelModel >> builder: anObject [

	builder := anObject
]

{ #category : #'as yet unclassified' }
PyramidPanelModel >> informItemsChanged [

	presenter := self builder presenterOf: self items.
	self window panelUpdated
]

{ #category : #adding }
PyramidPanelModel >> initialize [

	items := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
PyramidPanelModel >> installOn: aPyramidWindow at: aServiceName [
	aPyramidWindow services at:aServiceName put: self.
	self window: aPyramidWindow.
]

{ #category : #accessing }
PyramidPanelModel >> items [

	^ items
]

{ #category : #accessing }
PyramidPanelModel >> presenter [

	presenter ifNil: [ presenter := self builder presenterOf: self items ].
	^ presenter
]

{ #category : #adding }
PyramidPanelModel >> removeItem: anItem [

	self items remove: anItem.
	self informItemsChanged.
]

{ #category : #accessing }
PyramidPanelModel >> window [

	^ window
]

{ #category : #accessing }
PyramidPanelModel >> window: anObject [

	window := anObject
]
