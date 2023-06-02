Class {
	#name : #PyramidOverlaysManagerTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #tests }
PyramidOverlaysManagerTest >> testAddOverlay [

	| manager overlaysToAdd collection |
	overlaysToAdd := #( 1 1 2 2 3 3 4 4 5 5 6 7 7 8 9 ) collect: [
		                 :position |
		                 | element |
		                 element := BlElement new
			                            id: position printString;
			                            yourself.
		                 PyramidOverlay new
			                 position: position;
			                 element: element;
			                 yourself ].
	collection := OrderedCollection new.
	manager := PyramidOverlaysManager new.
	overlaysToAdd shuffle do: [ :over | manager addOverlay: over ].
	manager rootElement
		allParentsTo: (manager spaceElement childAt: 1)
		do: [ :each |
			self assert: each children size equals: 1.
			collection add: each ].
	self assert: collection size equals: 15.
	self assert: (collection isSortedBy: [ :a :b | a id asSymbol asNumber >= b id asSymbol asNumber])
]

{ #category : #tests }
PyramidOverlaysManagerTest >> testHideAndShowOverlays [

	| manager overlay1 overlay2 |
	manager := PyramidOverlaysManager new.
	overlay1 := PyramidOverlay new
		            position: 1;
		            yourself.
	overlay2 := PyramidOverlay new
		            position: 2;
		            yourself.

	overlay1 element id: #overlay1.
	overlay2 element id: #overlay2.

	"Nothing"
	self assert: manager rootElement parent equals: manager spaceElement.

	"only overlay1"
	manager addOverlay: overlay1.
	self assert: manager rootElement parent equals: overlay1 element.
	self assert: overlay1 element parent equals: manager spaceElement.
	overlay1 hide.
	self assert: manager rootElement parent equals: manager spaceElement.

	"only overlay2"
	manager addOverlay: overlay2.
	self assert: manager rootElement parent equals: overlay2 element.
	self assert: overlay2 element parent equals: manager spaceElement.
	overlay2 hide.
	self assert: manager rootElement parent equals: manager spaceElement.

	"A B A* B*"
	overlay1 show.
	overlay2 show.
	self assert: manager rootElement parent equals: overlay2 element.
	self assert: overlay2 element parent equals: overlay1 element.
	self assert: overlay1 element parent equals: manager spaceElement.
	overlay1 hide.
	overlay2 hide.
	self assert: manager rootElement parent equals: manager spaceElement.

	"B A A* B*"
	overlay2 show.
	overlay1 show.
	self assert: manager rootElement parent equals: overlay2 element.
	self assert: overlay2 element parent equals: overlay1 element.
	self assert: overlay1 element parent equals: manager spaceElement.
	overlay1 hide.
	overlay2 hide.
	self assert: manager rootElement parent equals: manager spaceElement.
]
