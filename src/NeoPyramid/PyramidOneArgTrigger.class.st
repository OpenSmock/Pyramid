Class {
	#name : #PyramidOneArgTrigger,
	#superclass : #PyramidPropertyInputTrigger,
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #'as yet unclassified' }
PyramidOneArgTrigger >> argBlock: aCallbackBlock input: input collection: collection [

	^ [ :arg | aCallbackBlock value: input value: collection ]
]
