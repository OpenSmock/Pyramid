Class {
	#name : #PyramidBackgroundCompositeMode,
	#superclass : #PyramidBackgroundModeAbstract,
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundCompositeMode >> icon [

	^ self iconNamed: #recentMessages
]

{ #category : #accessing }
PyramidBackgroundCompositeMode >> label [
^ 'Composite'
]
