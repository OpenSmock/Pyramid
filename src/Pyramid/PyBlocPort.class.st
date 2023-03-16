Class {
	#name : #PyBlocPort,
	#superclass : #SpInputPort,
	#category : #'Pyramid-Utilities'
}

{ #category : #'handling transmission' }
PyBlocPort >> applyIncomingTransmission: anObject from: outPort to: aPresenter [

	aPresenter receiveNewBlElement: anObject
]
