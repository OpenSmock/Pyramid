Class {
	#name : #PyramidToolbarPanelBuilder,
	#superclass : #PyramidPanelBuilder,
	#instVars : [
		'item',
		'isHorizontal'
	],
	#category : 'Pyramid-views'
}

{ #category : #accessing }
PyramidToolbarPanelBuilder >> height [

	^ 32
]

{ #category : #accessing }
PyramidToolbarPanelBuilder >> isHorizontal [

	isHorizontal ifNil: [ isHorizontal := true ].
	^ isHorizontal
]

{ #category : #accessing }
PyramidToolbarPanelBuilder >> isHorizontal: anObject [

	isHorizontal := anObject
]

{ #category : #accessing }
PyramidToolbarPanelBuilder >> item [

	^ item
]

{ #category : #accessing }
PyramidToolbarPanelBuilder >> item: anObject [

	item := anObject
]

{ #category : #accessing }
PyramidToolbarPanelBuilder >> layout [
	self isHorizontal ifTrue: [ ^ SpBoxLayout newHorizontal spacing: 4; yourself ] ifFalse: [ ^ SpBoxLayout newVertical spacing: 4; yourself ]
]

{ #category : #accessing }
PyramidToolbarPanelBuilder >> makeButtonWithIcon: anObject order: aNumber [

	item := PyramidToolbarItem new
		        presenter: anObject;
		        order: aNumber;
		        constraints: self squareButtonConstraints;
		        yourself
]

{ #category : #accessing }
PyramidToolbarPanelBuilder >> makeEmptyWith: aConstraintsBlock order: aNumber [

	item := PyramidToolbarItem new
		        presenter: SpNullPresenter new;
		        order: aNumber;
		        constraints: aConstraintsBlock;
		        yourself
]

{ #category : #accessing }
PyramidToolbarPanelBuilder >> presenterOf: aCollectionOfItems [

	| layout |
	layout := self layout.
	aCollectionOfItems sorted do: [ :each | each addOnLayout: layout ].
	^ SpPresenter new
		  layout: layout;
		  yourself
]

{ #category : #initialization }
PyramidToolbarPanelBuilder >> reset [

	item:= nil
]

{ #category : #'as yet unclassified' }
PyramidToolbarPanelBuilder >> squareButtonConstraints [

	^ [ :c | c width: self width. c height: self height ]
]

{ #category : #accessing }
PyramidToolbarPanelBuilder >> width [
	^ 32
]
