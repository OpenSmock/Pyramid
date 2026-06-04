Class {
	#name : #PyramidGeometryCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-plugin-editor'
}

{ #category : #testing }
PyramidGeometryCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [ anObject class = BlElement ]
]

{ #category : #getter }
PyramidGeometryCommand >> getValueFor: aBlElement [ 

	^ aBlElement geometry
]

{ #category : #setter }
PyramidGeometryCommand >> setValueFor: aBlElement with: anArgument [ 

	aBlElement geometry: anArgument
]
