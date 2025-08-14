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

{ #category : #utils }
PyramidPluginEditOnRunningTest >> closeSpace: aSpace [

	aSpace addEventHandlerOn: BlSpaceShownEvent doOnce: [ :event |
		BlSpace pulseUntilEmptyTaskQueue: aSpace timeout: 200 milliSeconds.
		aSpace close ]
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> setUp [

	super setUp.

	"Preserve user settings"
	setting := PyramidPluginEditOnRunning editOnRunning.

	PyramidPluginEditOnRunning uninstall.
	PyramidPluginEditOnRunning install.
	
	PyramidPluginEditOnRunning initialize.
	PyramidSpacePlugin initialize.
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> tearDown [ 

	PyramidPluginEditOnRunning editOnRunning: setting.
	super tearDown.
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testBlSpaceShortcutAddAndRemove [

	| space |
	PyramidPluginEditOnRunning editOnRunning: true.

	space := BlSpace new.
	self deny:
		(space root shortcuts includes: PyramidPluginEditOnRunning shortcut).

	space show.
	self assert:
		(space root shortcuts includes: PyramidPluginEditOnRunning shortcut).

	self closeSpace: space
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testCannotEditTheEditor [

	| space editor |
	PyramidPluginEditOnRunning editOnRunning: true.

	editor := PyramidEditor buildEditor.
	"get the space of the editor"
	space := (editor findPlugin: PyramidSpacePlugin) builder space.

	"check than the shortcut is not installed"
	self deny:
		(space root shortcuts includes: PyramidPluginEditOnRunning shortcut)
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

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testKeyCombination [

	self assert: (PyramidPluginEditOnRunning keyCombination isKindOf: BlKeyCombination) 

]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testOnlyOnePyramidBreakpoint [

	PyramidPluginEditOnRunning install.
	PyramidPluginEditOnRunning install.
	PyramidPluginEditOnRunning install.
	Smalltalk image garbageCollect.
	Smalltalk image garbageCollect.
	Smalltalk image garbageCollect.
	self assert: PyramidBreakpoint allInstances size equals: 1.
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testShortcut [

	self assert: (PyramidPluginEditOnRunning shortcut isKindOf: BlShortcutWithAction).

]
