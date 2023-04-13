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

	model := PyramidEditorViewModel new.
]

{ #category : #accessing }
PyramidEditorViewBuilder >> model [

	^ model
]
