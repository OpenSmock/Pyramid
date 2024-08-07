Class {
	#name : #PyramidAbstractBorderCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #'as yet unclassified' }
PyramidAbstractBorderCommand >> borderBuilderOf: aBlElement [

	| builder |
	builder := BlBorderBuilder new.
	builder paint: aBlElement border paint.
	builder width: aBlElement border width.
	builder opacity: aBlElement border opacity.
	builder lineCap: aBlElement border style lineCap.
	builder lineJoin: aBlElement border style lineJoin.
	builder miterLimit: aBlElement border style miterLimit.
	builder dashArray: aBlElement border style dashArray.
	builder dashOffset: aBlElement border style dashOffset.
	^ builder
]

{ #category : #'as yet unclassified' }
PyramidAbstractBorderCommand >> setValueFor: aBlElement with: anArgument [

	| builder |
	builder := self borderBuilderOf: aBlElement.
	self updateBuilder: builder with: anArgument value.
	aBlElement border: builder build
]

{ #category : #'as yet unclassified' }
PyramidAbstractBorderCommand >> updateBuilder: aBuilder with: anArgument [

	self shouldBeImplemented 
]
