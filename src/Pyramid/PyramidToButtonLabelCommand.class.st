Class {
	#name : #PyramidToButtonLabelCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-plugin-element'
}

{ #category : #testing }
PyramidToButtonLabelCommand >> canBeUsedFor: anObject [
    ^ anObject class = ToButton
]

{ #category : #getter }
PyramidToButtonLabelCommand >> getValueFor: aToButton [

	^ aToButton labelText ifNil: [ '' ]
]

{ #category : #setter }
PyramidToButtonLabelCommand >> setValueFor: aToButton with: aString [
    aToButton labelText: aString
]
