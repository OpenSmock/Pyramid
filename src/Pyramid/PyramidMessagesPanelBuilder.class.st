Class {
	#name : #PyramidMessagesPanelBuilder,
	#superclass : #PyramidPanelBuilder,
	#instVars : [
		'item'
	],
	#category : #'Pyramid-views'
}

{ #category : #adding }
PyramidMessagesPanelBuilder >> addMessage: aPyramidMessage [

	item := aPyramidMessage
]

{ #category : #accessing }
PyramidMessagesPanelBuilder >> item [

	^ item
]

{ #category : #accessing }
PyramidMessagesPanelBuilder >> layout [

^ SpBoxLayout newVertical
				  spacing: 4;
				  yourself
]

{ #category : #accessing }
PyramidMessagesPanelBuilder >> presenterOf: aCollectionOfItems [

	| layout |
	layout := self layout.
	aCollectionOfItems sorted do: [ :each | each addOnLayout: layout ].
	^ SpPresenter new
		  layout: layout;
		  visibleIf: [ aCollectionOfItems isNotEmpty ]; yourself
]

{ #category : #initialization }
PyramidMessagesPanelBuilder >> reset [

	item := nil
]
