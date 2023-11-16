"
A PyramidPluginEditOnRunningTest is a test class for testing the behavior of PyramidPluginEditOnRunning
"
Class {
	#name : #PyramidPluginEditOnRunningTest,
	#superclass : #TestCase,
	#instVars : [
		'setting'
	],
	#category : #'Pyramid-Tests-cases-plugin-edit-on-running'
}

{ #category : #tests }
PyramidPluginEditOnRunningTest >> setUp [ 

	super setUp.
	setting := PyramidPluginEditOnRunning editOnRunning.
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> tearDown [ 

	PyramidPluginEditOnRunning editOnRunning: setting.
	super tearDown.
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testEditOnRunning [

	PyramidPluginEditOnRunning editOnRunning: true.
	self assert: PyramidPluginEditOnRunning editOnRunning.
	
	PyramidPluginEditOnRunning editOnRunning: false.
	self deny: PyramidPluginEditOnRunning editOnRunning.
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testInitializePlugin [
	"Test if the plugin is installed because this is a core plugin that need to be installed"

	self assert: (PyramidPluginManager uniqueInstance isPluginInstalled: PyramidPluginEditOnRunning)
]
