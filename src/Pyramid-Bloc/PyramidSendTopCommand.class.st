Class {
	#name : #PyramidSendTopCommand,
	#superclass : #PyramidAbstractChangePositionWithSiblingsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-siblings'
}

{ #category : #'as yet unclassified' }
PyramidSendTopCommand >> setValueFor: anObject with: anArgument [

	| elevationMax leftChild parent |
	parent := anObject parent.
	elevationMax := anObject parent children
		                inject: Float negativeInfinity
		                into: [ :acc :each |
		                acc max: each elevation elevation ].
	leftChild := parent childAt:
		             (anObject parent children asOrderedCollection
			              findLast: [ :each |
			              each elevation elevation = elevationMax ]).
	leftChild = anObject ifTrue: [ ^ self ].
	anObject zIndex: elevationMax.
	parent removeChild: anObject.
	parent addChild: anObject after: leftChild
]
