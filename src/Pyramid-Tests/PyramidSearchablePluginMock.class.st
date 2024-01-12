Class {
	#name : #PyramidSearchablePluginMock,
	#superclass : #Object,
	#traits : 'TPyramidSerchablePlugin',
	#classTraits : 'TPyramidSerchablePlugin classTrait',
	#instVars : [
		'plugins'
	],
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #controlling }
PyramidSearchablePluginMock >> beEmpty [

	plugins := {  }
]

{ #category : #controlling }
PyramidSearchablePluginMock >> beMulti [

	plugins := {
		           PyramidFakePlugin new.
		           Object new.
		PyramidFakePlugin new}
]

{ #category : #controlling }
PyramidSearchablePluginMock >> beUnique [

	plugins := { PyramidFakePlugin new. Object new }
]

{ #category : #accessing }
PyramidSearchablePluginMock >> plugins [
	"return the collection of instances of plugins."

	^ plugins
]
