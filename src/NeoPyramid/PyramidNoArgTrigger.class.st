Class {
	#name : #PyramidNoArgTrigger,
	#superclass : #PyramidPropertyInputTrigger,
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #'as yet unclassified' }
PyramidNoArgTrigger >> argBlock: aCallbackBlock input: input collection: collection [

	^ [ aCallbackBlock value: input value: collection ]
]
