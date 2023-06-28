Class {
	#name : #PyramidBackgroundPropertyInputStrategy,
	#superclass : #Object,
	#category : #'Pyramid-Bloc-custom-specs-background'
}

{ #category : #testing }
PyramidBackgroundPropertyInputStrategy >> hasModal [

	^ true
]

{ #category : #accessing }
PyramidBackgroundPropertyInputStrategy >> preview [

	^ SpNullPresenter new
]
