Class {
	#name : #PyramidCommandTestContainer,
	#superclass : #Object,
	#instVars : [
		'targetNoProp',
		'targetWithProp',
		'prop'
	],
	#category : #'Pyramid-Tests-cases-command'
}

{ #category : #'as yet unclassified' }
PyramidCommandTestContainer class >> no: aTargetNoProp with: aTargetWithProp prop: aProp [

^ self new targetNoProp: aTargetNoProp; targetWithProp: aTargetWithProp; prop: aProp; yourself
]

{ #category : #accessing }
PyramidCommandTestContainer >> prop [

	^ prop
]

{ #category : #accessing }
PyramidCommandTestContainer >> prop: anObject [

	prop := anObject
]

{ #category : #accessing }
PyramidCommandTestContainer >> targetNoProp [

	^ targetNoProp
]

{ #category : #accessing }
PyramidCommandTestContainer >> targetNoProp: anObject [

	targetNoProp := anObject
]

{ #category : #accessing }
PyramidCommandTestContainer >> targetWithProp [

	^ targetWithProp
]

{ #category : #accessing }
PyramidCommandTestContainer >> targetWithProp: anObject [

	targetWithProp := anObject
]
