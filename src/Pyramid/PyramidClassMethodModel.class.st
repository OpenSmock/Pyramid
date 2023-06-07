Class {
	#name : #PyramidClassMethodModel,
	#superclass : #Object,
	#instVars : [
		'targetClass',
		'methodString',
		'methodSelector',
		'methodArguments'
	],
	#category : #'Pyramid-properties-custom'
}

{ #category : #initialization }
PyramidClassMethodModel >> initialize [

methodArguments := {  }
]

{ #category : #accessing }
PyramidClassMethodModel >> methodArguments [

	^ methodArguments
]

{ #category : #accessing }
PyramidClassMethodModel >> methodArguments: anArray [

	methodArguments := anArray
]

{ #category : #accessing }
PyramidClassMethodModel >> methodSelector [

	^ methodSelector
]

{ #category : #accessing }
PyramidClassMethodModel >> methodSelector: anObject [

	methodSelector := anObject
]

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
