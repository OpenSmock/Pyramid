Class {
	#name : #PyramidToButtonLabelCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-plugin-editor'
}

{ #category : #testing }
PyramidToButtonLabelCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject class = ToButton  ]
]

{ #category : #getter }
PyramidToButtonLabelCommand >> getValueFor: anObject [

	^ anObject labelText ifNil: [ '' ]
]

{ #category : #setter }
PyramidToButtonLabelCommand >> setValueFor: anObject with: aString [

	anObject labelText: aString
]
