Class {
	#name : 'PyramidOutskirtsCommand',
	#superclass : 'PyramidAbstractBlocCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'as yet unclassified' }
PyramidOutskirtsCommand >> getValueFor: aBlElement [

	^ aBlElement outskirts
]

{ #category : 'as yet unclassified' }
PyramidOutskirtsCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement outskirts: anArgument
]
