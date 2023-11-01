"
A PyramidPluginEditOnRunningTest is a test class for testing the behavior of PyramidPluginEditOnRunning
"
Class {
	#name : #PyramidPluginEditOnRunningTest,
	#superclass : #TestCase,
	#instVars : [
		'editOnRunning'
	],
	#category : #'Pyramid-Tests-cases-plugin-edit-on-running'
}

{ #category : #tests }
PyramidPluginEditOnRunningTest >> setUp [ 

	super setUp.
	editOnRunning := PyramidPluginEditOnRunning editOnRunning.
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> tearDown [ 

	super tearDown.
	PyramidPluginEditOnRunning editOnRunning: editOnRunning.
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testEditOnRunning [

	PyramidPluginEditOnRunning editOnRunning: true.
	self assert: PyramidPluginEditOnRunning editOnRunning.
	
	PyramidPluginEditOnRunning editOnRunning: false.
	self deny: PyramidPluginEditOnRunning editOnRunning.
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testPlugin [

	| plugin |
	plugin := PyramidPluginEditOnRunning new.
]
