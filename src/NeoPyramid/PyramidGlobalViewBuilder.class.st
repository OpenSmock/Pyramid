Class {
	#name : #PyramidGlobalViewBuilder,
	#superclass : #Object,
	#instVars : [
		'leftElements',
		'rightElements',
		'topElements'
	],
	#category : #'NeoPyramid-views'
}

{ #category : #building }
PyramidGlobalViewBuilder >> build [
	| topView leftView centerView rightView globalView |
	topView := self makeTopView.
	leftView := self makeLeftView.
	centerView := self makeCenterView.
	rightView := self makeRightView.
	globalView := PyramidGlobalView new topView: topView;leftView: leftView;centerView: centerView;rightView: rightView;yourself.
	^ globalView
]

{ #category : #accessing }
PyramidGlobalViewBuilder >> leftElements [
	^ leftElements
]

{ #category : #accessing }
PyramidGlobalViewBuilder >> leftElements: anObject [

	leftElements := anObject
]

{ #category : #'as yet unclassified' }
PyramidGlobalViewBuilder >> makeCenterView [

	^ PyramidTabsContainerView new
]

{ #category : #'as yet unclassified' }
PyramidGlobalViewBuilder >> makeLeftView [

	| builder leftView |
	builder := PyramidTabBuilder new.
	leftView := PyramidTabsContainerView new.
	self leftElements do: [ :each | builder makeTabFrom: each for: leftView ].
	^ leftView
]

{ #category : #'as yet unclassified' }
PyramidGlobalViewBuilder >> makeRightView [

	| builder rightView |
	builder := PyramidTabBuilder new.
	rightView := PyramidTabsContainerView new.
	self rightElements do: [ :each | builder makeTabFrom: each for: rightView ].
	^ rightView
]

{ #category : #'as yet unclassified' }
PyramidGlobalViewBuilder >> makeTopView [

	| topView builder |
	builder := PyramidButtonBuilder new buttonContraints: [ :c |
		           c height: 36.
		           c width: 36 ].
	topView := PyramidButtonsBarView new boxLayout: (SpBoxLayout newLeftToRight
			             spacing: 4;
			             hAlignEnd;
			             yourself).
	self topElements do: [ :each |
		builder makeButtonFrom: each for: topView ].
	topView updateLayout.
	^ topView
]

{ #category : #accessing }
PyramidGlobalViewBuilder >> rightElements [

	^ rightElements
]

{ #category : #accessing }
PyramidGlobalViewBuilder >> rightElements: anObject [

	rightElements := anObject
]

{ #category : #accessing }
PyramidGlobalViewBuilder >> topElements [

	^ topElements
]

{ #category : #accessing }
PyramidGlobalViewBuilder >> topElements: anObject [

	topElements := anObject
]
