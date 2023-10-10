Class {
	#name : 'PyramidSendBottomCommand',
	#superclass : 'PyramidAbstractChangePositionWithSiblingsCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-siblings',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-siblings'
}

{ #category : 'as yet unclassified' }
PyramidSendBottomCommand >> setValueFor: anObject with: anArgument [

	| elevationMin rightChild parent |
	parent := anObject parent.
	elevationMin := anObject parent children
		                inject: Float infinity
		                into: [ :acc :each |
		                acc min: each elevation elevation ].
	rightChild := parent childAt:
		              (anObject parent children asOrderedCollection
			               findFirst: [ :each |
			               each elevation elevation = elevationMin ]).
	rightChild = anObject ifTrue: [ ^ self ].
	parent removeChild: anObject.
	parent addChild: anObject before: rightChild
]
