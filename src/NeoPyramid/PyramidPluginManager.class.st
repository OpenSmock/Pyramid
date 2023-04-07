Class {
	#name : #PyramidPluginManager,
	#superclass : #Object,
	#instVars : [
		'plugins'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #NeoPyramid
}

{ #category : #initialization }
PyramidPluginManager class >> initialize [

	uniqueInstance := self basicNew initialize
]

{ #category : #'instance creation' }
PyramidPluginManager class >> new [

	^ self uniqueInstance
]

{ #category : #'instance creation' }
PyramidPluginManager class >> uniqueInstance [

	uniqueInstance ifNil: [ self initialize ].
	^ uniqueInstance
]

{ #category : #adding }
PyramidPluginManager >> addPlugin: aPluginClass [

	self plugins at: aPluginClass put: aPluginClass new.

	
]

{ #category : #initialization }
PyramidPluginManager >> initialize [

	plugins := Dictionary new
]

{ #category : #'as yet unclassified' }
PyramidPluginManager >> makeGlobalView [

	| builder leftElements topElements rightElements |
	builder := PyramidGlobalViewBuilder new.
	leftElements := OrderedCollection new.
	topElements := OrderedCollection new.
	rightElements := OrderedCollection new.

	self plugins values do: [ :each |
		topElements := topElements , each topElements.
		leftElements := leftElements , each leftElements.
		rightElements := rightElements , each rightElements ].
	^ builder
		  topElements: topElements;
		  leftElements: leftElements;
		  rightElements: rightElements;
		  build
]

{ #category : #'as yet unclassified' }
PyramidPluginManager >> plugins [

	^ plugins
]
