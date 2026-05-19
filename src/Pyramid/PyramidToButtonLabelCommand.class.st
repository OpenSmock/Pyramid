Class {
	#name : #PyramidToButtonLabelCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-plugin-editor'
}

{ #category : #testing }
PyramidToButtonLabelCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [ anObject class = ToButton ]
]

{ #category : #getter }
PyramidToButtonLabelCommand >> getValueFor: aToButton [

	^ aToButton labelText ifNil: [ '' ]
]

{ #category : #setter }
PyramidToButtonLabelCommand >> setValueFor: aToButton with: aString [
    aToButton labelText: aString
]
