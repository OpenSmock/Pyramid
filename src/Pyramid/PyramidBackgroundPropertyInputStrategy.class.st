Class {
	#name : #PyramidBackgroundPropertyInputStrategy,
	#superclass : #Object,
	#category : #'Pyramid-plugin-properties-custom'
}

{ #category : #testing }
PyramidBackgroundPropertyInputStrategy >> hasModal [

	^ true
]

{ #category : #accessing }
PyramidBackgroundPropertyInputStrategy >> preview [

	^ SpNullPresenter new
]
