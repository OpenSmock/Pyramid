Class {
	#name : #PyramidSpaceBuilderTest,
	#superclass : #TestCase,
	#category : 'Pyramid-Tests-cases-plugin-space'
}

{ #category : #tests }
PyramidSpaceBuilderTest >> testAddAllOverlaysNamed [

	| collectionOfName builder element e1 e2 e3|
	"0 element"
	collectionOfName := {  }.
	builder := PyramidSpaceBuilder new.
	builder addAllOverlaysNamed: collectionOfName.
	builder build.
	self assert: builder overlays size equals: 0.

	"1 element"
	collectionOfName := { #test }.
	builder := PyramidSpaceBuilder new.
	builder addAllOverlaysNamed: collectionOfName.
	builder build.
	self assert: builder overlays size equals: 1.
	element := builder elementAt: #test.
	self assert: element id asSymbol equals: #test.
	self assert: (builder overlays at: #test) element equals: element.
	self
		assert: builder topMostOverlay
		equals: (builder overlays at: #test).
	self assert: builder space root children size equals: 1.
	self
		assert: builder space root children first
		equals: element.

	"n elements"
	collectionOfName := { #test1. #test2. #test3 }.
	builder := PyramidSpaceBuilder new.
	builder addAllOverlaysNamed: collectionOfName.
	builder build.
	self assert: builder overlays size equals: 3.
	e1 := builder elementAt: #test1.
	e2 := builder elementAt: #test2.
	e3 := builder elementAt: #test3.
	self assert: e1 id asSymbol equals: #test1.
	self assert: e2 id asSymbol equals: #test2.
	self assert: e3 id asSymbol equals: #test3.
	self assert: (builder overlays at: #test1) element equals: e1.
	self assert: (builder overlays at: #test2) element equals: e2.
	self assert: (builder overlays at: #test3) element equals: e3.
	self
		assert: builder topMostOverlay
		equals: (builder overlays at: #test1).
	self assert: builder space root children size equals: 1.
	self
		assert: builder space root children first
		equals: e1.
	self assert: builder space root children first children size equals: 1.
	self
		assert: builder space root children first children first
		equals: e2.
		self assert: builder space root children first children first children size equals: 1.
	self
		assert: builder space root children first children first children first
		equals: e3
		
]

{ #category : #tests }
PyramidSpaceBuilderTest >> testAddExtension [

	| builder extension |
	builder := PyramidSpaceBuilder new.
	extension := PyramidFakeExtension new.
	self deny: extension isInstalled.
	self assert: builder extensions size equals: 0.
	
	builder addExtension: extension.
	self assert: extension isInstalled.
	self assert: builder extensions size equals: 1.
	self assert: (builder extensions includes: extension).
]

{ #category : #tests }
PyramidSpaceBuilderTest >> testAddOverlayNamed [

	| builder overlay1 overlay2 anError |
	builder := PyramidSpaceBuilder new.
	self assert: builder overlays size equals: 0.
	"test add an overlay on empty builder"
	builder addOverlayNamed: #test1.
	self assert: builder overlays size equals: 1.
	overlay1 := builder overlays at: #test1.
	self assert: overlay1 equals: builder topMostOverlay.
	self assert: overlay1 class equals: PyramidSpaceMainOverlay.

	"test add a new overlay"
	builder addOverlayNamed: #test2.
	self assert: builder overlays size equals: 2.
	overlay2 := builder overlays at: #test2.
	self assert: overlay2 equals: builder topMostOverlay.
	self assert: overlay2 class equals: PyramidSpaceOverlayDecorator.
	self assert: overlay2 wrappee equals: overlay1.

	"test add an existing overlay"
	[
	builder addOverlayNamed: #test2.
	self fail ]
		on: PyramidExistingOverlayError
		do: [ :e | anError := e ].
	self assert: (anError isKindOf: PyramidExistingOverlayError ).
]

{ #category : #tests }
PyramidSpaceBuilderTest >> testEditor [

	| builder extension |
	builder := PyramidSpaceBuilder new.
	extension := PyramidFakeExtension new.
	builder addExtension: extension.
	self assert: extension isInstalled.
	self deny: extension editor.
	self deny: extension projectModel.

	builder editor: PyramidEditor new.
	"stub for a PyramidEditor"
	self assert: extension editor.
	self assert: extension projectModel
]
