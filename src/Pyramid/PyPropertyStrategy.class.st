Class {
	#name : #PyPropertyStrategy,
	#superclass : #Object,
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #testing }
PyPropertyStrategy >> isEditButtonEnabled [
	^ self shouldBeImplemented 
]

{ #category : #testing }
PyPropertyStrategy >> isSingleFormEnabled [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
PyPropertyStrategy >> updateForm: aView [
	
	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
PyPropertyStrategy >> updateView: aView [

	aView popoverHide.
	aView updateSectionLabel.
	
	aView editButton enabled: self isEditButtonEnabled.
	aView singleForm enabled: self isSingleFormEnabled.
	
	self updateForm: aView
]
