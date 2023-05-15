Class {
	#name : #PyramidBackgroundInputTransparent,
	#superclass : #PyramidBackgroundAbstractPaintInput,
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundInputTransparent >> background [

	^ BlBackground transparent
]

{ #category : #layout }
PyramidBackgroundInputTransparent >> defaultLayout [

	^ SpBoxLayout newHorizontal add: 'Transparent. Nothing to see here.'; yourself 
]
