Class {
	#name : #PyramidShadowCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #'as yet unclassified' }
PyramidShadowCommand >> getValueFor: aBlElement [

	 ^ aBlElement effect 
]

{ #category : #'as yet unclassified' }
PyramidShadowCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement effect: anArgument
]
