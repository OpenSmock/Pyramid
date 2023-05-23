Class {
	#name : #PyramidBackgroundPropertyInputStrategy,
	#superclass : #Object,
	#category : #'Pyramid-Bloc-custom-specs'
}

{ #category : #testing }
PyramidBackgroundPropertyInputStrategy >> hasModal [

	^ true
]

{ #category : #accessing }
PyramidBackgroundPropertyInputStrategy >> preview [

	^ SpNullPresenter new
]
