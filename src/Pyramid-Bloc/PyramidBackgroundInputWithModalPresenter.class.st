Class {
	#name : #PyramidBackgroundInputWithModalPresenter,
	#superclass : #PyramidInputWithModalPresenter,
	#category : 'Pyramid-Bloc-plugin-bloc'
}

{ #category : #initialization }
PyramidBackgroundInputWithModalPresenter >> initializePresenters [

	super initializePresenters.
	self presenter: PyramidBackgroundPreviewPresenter new.
	self presenterModal: PyramidBackgroundInputPresenter new
]
