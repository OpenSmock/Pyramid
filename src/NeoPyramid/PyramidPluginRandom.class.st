Class {
	#name : #PyramidPluginRandom,
	#superclass : #Object,
	#category : #NeoPyramid
}

{ #category : #initialization }
PyramidPluginRandom class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #accessing }
PyramidPluginRandom >> leftElements [

	^ { PyramidTabElement random . PyramidTabElement random }
]

{ #category : #accessing }
PyramidPluginRandom >> rightElements [

	^ { PyramidTabElement random . PyramidTabElement random }
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
