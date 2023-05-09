Class {
	#name : #PyramidBackgroundPaintMode,
	#superclass : #PyramidBackgroundModeAbstract,
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundPaintMode >> icon [

	^ self iconNamed: #paint
]

{ #category : #accessing }
PyramidBackgroundPaintMode >> label [

	^ 'Paint'
]
