Class {
	#name : #PyramidToLabelTextCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-plugin-element'
}

{ #category : #testing }
PyramidToLabelTextCommand >> canBeUsedFor: anObject [

	^ anObject class = ToLabel
]

{ #category : #getter }
PyramidToLabelTextCommand >> getValueFor: aToLabel [

	^ aToLabel text ifNil: [ '' ]
]

{ #category : #setter }
PyramidToLabelTextCommand >> setValueFor: aToLabel with: aString [

	aToLabel text: aString
]
