Class {
	#name : #PyramidBackgroundInputWithModalPresenter,
	#superclass : #PyramidInputWithModalPresenter,
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #initialization }
PyramidBackgroundInputWithModalPresenter >> initializePresenters [

	super initializePresenters.
	self presenter: PyramidBackgroundPreviewPresenter new.
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputWithModalPresenter >> value: anObject [

	self presenter value: anObject
]
