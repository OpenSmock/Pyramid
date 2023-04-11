Class {
	#name : #PyramidPluginRandom,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#category : #'NeoPyramid-core'
}

{ #category : #initialization }
PyramidPluginRandom class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #'as yet unclassified' }
PyramidPluginRandom >> buildGlobalViewOn: aBuilder [

	aBuilder leftElements addAll: self leftElements.
	aBuilder rightElements addAll: self rightElements.
	aBuilder topElements addAll: self topElements.
]

{ #category : #'as yet unclassified' }
PyramidPluginRandom >> connectOn: aPyramidEditor [
	
]

{ #category : #accessing }
PyramidPluginRandom >> leftElements [

	^ { PyramidTab random . PyramidTab random }
]

{ #category : #accessing }
PyramidPluginRandom >> rightElements [

	^ { PyramidTab random . PyramidTab random }
]

{ #category : #accessing }
PyramidPluginRandom >> topElements [

	^ {
		  PyramidButton random alignStart.
		  PyramidButton random alignStart.
		  PyramidButton random alignStart.
		  PyramidButton random alignCenter.
		  PyramidButton random alignCenter.
		  PyramidButton random alignCenter.
		  PyramidButton random alignEnd.
		PyramidButton random alignEnd.
		  PyramidButton random alignEnd }
]
