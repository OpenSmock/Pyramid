"
A PyramidPluginManagerTest is a test class for testing the behavior of PyramidPluginManager
"
Class {
	#name : #PyramidPluginManagerTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #tests }
PyramidPluginManagerTest >> testIsPluginInstalled [
	"Test incorrect values"

	| pluginClasses |
	
	
	
	self deny:
		(PyramidPluginManager uniqueInstance isPluginInstalled: nil).

	"Test if all plugins are installed"
	pluginClasses := PyramidPluginManager imagePluginClasses.
	
	"Force #initialize before the test because it doesn't do it in the CI apparently."
	pluginClasses do: [ :each | each initialize ].
	
	self assert: pluginClasses notEmpty.
	pluginClasses do: [ :c |
		self assert:
			(PyramidPluginManager uniqueInstance isPluginInstalled: c) ]
]

{ #category : #tests }
PyramidPluginManagerTest >> testUniqueInstance [

	self assert: PyramidPluginManager uniqueInstance class equals: PyramidPluginManager.
]
