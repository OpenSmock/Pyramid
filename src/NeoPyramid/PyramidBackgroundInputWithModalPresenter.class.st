Class {
	#name : #PyramidBackgroundInputWithModalPresenter,
	#superclass : #PyramidInputWithModalPresenter,
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #initialization }
PyramidBackgroundInputWithModalPresenter >> initializePresenters [

	super initializePresenters.
	self presenter: PyramidBackgroundPreviewPresenter new.
	self presenterModal: PyramidBackgroundInputPresenter new
]
