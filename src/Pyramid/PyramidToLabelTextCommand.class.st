Class {
	#name : #PyramidToLabelTextCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-plugin-editor'
}

{ #category : #testing }
PyramidToLabelTextCommand >> canBeUsedFor: anObject [

	^  (super canBeUsedFor: anObject) and: [anObject class = ToLabel]
]

{ #category : #getter }
PyramidToLabelTextCommand >> getValueFor: aToLabel [

	^ aToLabel text asString ifNil: [ '' ] 
]

{ #category : #setter }
PyramidToLabelTextCommand >> setValueFor: aToLabel with: aString [

	aToLabel text: aString
]
