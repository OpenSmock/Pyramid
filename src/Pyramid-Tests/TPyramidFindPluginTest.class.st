Class {
	#name : #TPyramidFindPluginTest,
	#superclass : #TestCase,
	#traits : 'TPyramidFindPlugin',
	#classTraits : 'TPyramidFindPlugin classTrait',
	#instVars : [
		'object1',
		'object2',
		'object3'
	],
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #accessing }
TPyramidFindPluginTest >> object1 [

	^ object1
]

{ #category : #accessing }
TPyramidFindPluginTest >> object2 [

	^ object2
]

{ #category : #accessing }
TPyramidFindPluginTest >> object3 [

	^ object3
]

{ #category : #accessing }
TPyramidFindPluginTest >> plugins [
	"Return a collection of TPyramidPlugin instances."

	^ {
		  self object1.
		  self object2.
		  self object3.
		  self object3 }
]

{ #category : #accessing }
TPyramidFindPluginTest >> setUp [

	super setUp.

	object1 := PyramidFakePlugin1 new.
	object2 := PyramidFakePlugin2 new.
	object3 := PyramidFakePlugin3 new
]

{ #category : #tests }
TPyramidFindPluginTest >> testFindPlugin [

	self
		assert: (self findPlugin: PyramidFakePlugin1)
		equals: self object1.
	self
		assert: (self findPlugin: #PyramidFakePlugin2)
		equals: self object2.
	[
	self findPlugin: #PyramidFakePlugin3.
	self fail ]
		on: PyramidMultiplePluginsFoundError
		do: [ :err |
			self assert: err plugins size equals: 2.
			self assert: err plugins first equals: self object3.
			self assert: err plugins last equals: self object3 ].
	[
	self findPlugin: PyramidFakePlugin3.
	self fail ]
		on: PyramidMultiplePluginsFoundError
		do: [ :err |
			self assert: err plugins size equals: 2.
			self assert: err plugins first equals: self object3.
			self assert: err plugins last equals: self object3 ].
	[
	self findPlugin: #PyramidFakePlugin4.
	self fail ]
		on: PyramidNoPluginFoundError
		do: [ :err |
			self assert: err query equals: #PyramidFakePlugin4.
 ]
]
