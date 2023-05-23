Class {
	#name : #PyramidBackgroundPropertyInputTransparent,
	#superclass : #PyramidBackgroundPropertyInputStrategy,
	#instVars : [
		'preview'
	],
	#category : #'Pyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundPropertyInputTransparent >> preview [

	preview ifNil: [ preview :=  SpLabelPresenter new
		  label: 'Transparent';
		  yourself ].
	^ preview
]
