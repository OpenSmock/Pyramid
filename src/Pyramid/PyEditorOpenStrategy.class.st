Class {
	#name : #PyEditorOpenStrategy,
	#superclass : #Object,
	#category : #'Pyramid-Business'
}

{ #category : #protocol }
PyEditorOpenStrategy >> open: aBusiness [

	self setupRoots: aBusiness.
	self setupWindow: aBusiness.
]

{ #category : #protocol }
PyEditorOpenStrategy >> setupRoots: aBusiness [
]

{ #category : #protocol }
PyEditorOpenStrategy >> setupWindow: aBusiness [

	| window |
	window := aBusiness view open.
	window resize: 1024 @ 720.
	window title: 'Pyramid Editor'.
	window whenClosedDo: [ self whenWindowClosed: aBusiness ]
]

{ #category : #'as yet unclassified' }
PyEditorOpenStrategy >> whenWindowClosed: aBusiness [

	
]
