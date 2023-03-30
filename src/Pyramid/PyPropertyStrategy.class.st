Class {
	#name : #PyPropertyStrategy,
	#superclass : #Object,
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyPropertyStrategy >> updateForm: aView [
	
	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
PyPropertyStrategy >> updateView: aView [

	aView popoverHide.
	aView updateSectionLabel.
	self updateForm: aView
]
