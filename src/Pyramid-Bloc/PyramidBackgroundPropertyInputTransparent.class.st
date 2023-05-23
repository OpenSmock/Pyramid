Class {
	#name : #PyramidBackgroundPropertyInputTransparent,
	#superclass : #PyramidBackgroundPropertyInputStrategy,
	#instVars : [
		'preview'
	],
	#category : #'Pyramid-Bloc-custom-specs'
}

{ #category : #accessing }
PyramidBackgroundPropertyInputTransparent >> preview [

	preview ifNil: [ preview :=  SpLabelPresenter new
		  label: 'Transparent';
		  yourself ].
	^ preview
]
