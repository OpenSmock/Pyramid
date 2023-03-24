Class {
	#name : #PyMementoAbstract,
	#superclass : #Object,
	#category : #'Pyramid-Plugin-History'
}

{ #category : #'as yet unclassified' }
PyMementoAbstract class >> isAbstract [

	^ self == PyMementoAbstract
]

{ #category : #'as yet unclassified' }
PyMementoAbstract >> restore [

	^ self shouldBeImplemented
]

{ #category : #'window management' }
PyMementoAbstract >> restore: aPipeline [

	^ self shouldBeImplemented
]
