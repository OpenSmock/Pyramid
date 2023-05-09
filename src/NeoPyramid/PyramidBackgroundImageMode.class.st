Class {
	#name : #PyramidBackgroundImageMode,
	#superclass : #PyramidBackgroundModeAbstract,
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundImageMode >> icon [

	^ self iconNamed: #smallScreenshot
]

{ #category : #accessing }
PyramidBackgroundImageMode >> label [

	^ 'Image'
]
