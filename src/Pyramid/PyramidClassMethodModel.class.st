Class {
	#name : #PyramidClassMethodModel,
	#superclass : #Object,
	#instVars : [
		'targetClass',
		'methodString'
	],
	#category : #'Pyramid-properties-custom'
}

{ #category : #accessing }
PyramidClassMethodModel >> methodString [

	^ methodString
]

{ #category : #accessing }
PyramidClassMethodModel >> methodString: anObject [

	methodString := anObject
]

{ #category : #accessing }
PyramidClassMethodModel >> targetClass [

	^ targetClass
]

{ #category : #accessing }
PyramidClassMethodModel >> targetClass: anObject [

	targetClass := anObject
]
