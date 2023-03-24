Class {
	#name : #PyPropertyStrategySelectionMixed,
	#superclass : #PyPropertyStrategy,
	#category : #'Pyramid-Editor-Panels-Properties'
}

{ #category : #'as yet unclassified' }
PyPropertyStrategySelectionMixed >> updateForm: aView [

	aView editButton enabled: true.
	aView singleForm enabled: true.
	aView singleForm differentsValue.
	aView updatePopover.
]
