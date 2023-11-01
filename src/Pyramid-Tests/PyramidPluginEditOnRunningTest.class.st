"
A PyramidPluginEditOnRunningTest is a test class for testing the behavior of PyramidPluginEditOnRunning
"
Class {
	#name : #PyramidPluginEditOnRunningTest,
	#superclass : #TestCase,
	#instVars : [
		'plugin',
		'setting'
	],
	#category : #'Pyramid-Tests-cases-plugin-edit-on-running'
}

{ #category : #tests }
PyramidPluginEditOnRunningTest >> setUp [ 

	super setUp.
	plugin := PyramidPluginEditOnRunning new.
	setting := PyramidPluginEditOnRunning editOnRunning.
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> tearDown [ 

	plugin := nil.
	PyramidPluginEditOnRunning editOnRunning: setting.
	super tearDown.
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testEditOnRunning [

	plugin editOnRunning: true.
	self assert: plugin editOnRunning.
	self assert: PyramidPluginEditOnRunning editOnRunning.
	
	plugin editOnRunning: false.
	self deny: plugin editOnRunning.
	self deny: PyramidPluginEditOnRunning editOnRunning.
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testPlugin [

	self assert: plugin notNil.
]
