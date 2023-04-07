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

	self plugins add: aPluginClass
]

{ #category : #initialization }
PyramidPluginManager >> initialize [

	plugins := OrderedCollection new
]

{ #category : #'as yet unclassified' }
PyramidPluginManager >> makeEditor [

	^ PyramidEditor new
		  plugins: (self plugins collect: [ :class | class new ]);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPluginManager >> plugins [

	^ plugins
]
