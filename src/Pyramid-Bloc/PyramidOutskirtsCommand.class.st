Class {
	#name : #PyramidOutskirtsCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #getter }
PyramidOutskirtsCommand >> getValueFor: aBlElement [

	^ aBlElement outskirts
]

{ #category : #setter }
PyramidOutskirtsCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement outskirts: anArgument
]
