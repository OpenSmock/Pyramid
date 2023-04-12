Class {
	#name : #PyramidEditorViewBuilder,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'NeoPyramid-views'
}

{ #category : #building }
PyramidEditorViewBuilder >> build [

	^ PyramidEditorView new
		  model: self model;
		  layoutStrategy: PyramidSimpleLayoutStrategy new;
		  yourself
]

{ #category : #initialization }
PyramidEditorViewBuilder >> initialize [

	model := PyramidEditorModel new.
]

{ #category : #accessing }
PyramidEditorViewBuilder >> leftElements [
	^ leftElements
]

{ #category : #accessing }
PyramidEditorViewBuilder >> leftElements: anObject [

	leftElements := anObject
]

{ #category : #'as yet unclassified' }
PyramidEditorViewBuilder >> makeCenterView [

	^ PyramidTabsContainerView new
]

{ #category : #'as yet unclassified' }
PyramidEditorViewBuilder >> makeLeftView [

	| builder leftView |
	builder := PyramidTabBuilder new.
	leftView := PyramidTabsContainerView new.
	self leftElements do: [ :each | builder makeTabFrom: each for: leftView ].
	^ leftView
]

{ #category : #'as yet unclassified' }
PyramidEditorViewBuilder >> makeRightView [

	| builder rightView |
	builder := PyramidTabBuilder new.
	rightView := PyramidTabsContainerView new.
	self rightElements do: [ :each | builder makeTabFrom: each for: rightView ].
	^ rightView
]

{ #category : #'as yet unclassified' }
PyramidEditorViewBuilder >> makeTopView [

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
PyramidEditorViewBuilder >> model [

	^ model
]

{ #category : #accessing }
PyramidEditorViewBuilder >> rightElements [

	^ rightElements
]

{ #category : #accessing }
PyramidEditorViewBuilder >> rightElements: anObject [

	rightElements := anObject
]

{ #category : #accessing }
PyramidEditorViewBuilder >> topElements [

	^ topElements
]

{ #category : #accessing }
PyramidEditorViewBuilder >> topElements: anObject [

	topElements := anObject
]
