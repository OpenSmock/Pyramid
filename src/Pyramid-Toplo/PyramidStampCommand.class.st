Class {
	#name : #PyramidStampCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#instVars : [
		'stamp'
	],
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #getter }
PyramidStampCommand >> getValueFor: anObject [

	^ anObject hasStamp:  self stamp
]

{ #category : #setter }
PyramidStampCommand >> setValueFor: anObject with: aBoolean [

	aBoolean
		ifTrue: [ anObject addStamp: self stamp ]
		ifFalse: [ anObject removeStamp: self stamp ]
]

{ #category : #accessing }
PyramidStampCommand >> stamp [

	^ stamp
]

{ #category : #accessing }
PyramidStampCommand >> stamp: anObject [

	stamp := anObject
]
