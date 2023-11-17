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

	aSpace when: BlSpaceShownEvent doOnce: [ :event |
		BlSpace pulseUntilEmptyTaskQueue: aSpace timeout: 200 milliSeconds.
		aSpace close ].
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> setUp [ 

	super setUp.
	
	"Preserve user settings"
	setting := PyramidPluginEditOnRunning editOnRunning.
	
	PyramidPluginEditOnRunning uninstall.
	PyramidPluginEditOnRunning install.
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
	self deny: (PyramidPluginEditOnRunning spaceIds includes: space id).
	self deny: (space root shortcuts includes: (PyramidPluginEditOnRunning shortcut)).
	
	space show.	
	self assert: (PyramidPluginEditOnRunning spaceIds includes: space id).
	self assert: (space root shortcuts includes: (PyramidPluginEditOnRunning shortcut)).
	
	self closeSpace: space.
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testEditOnRunning [

	PyramidPluginEditOnRunning editOnRunning: true.
	self assert: PyramidPluginEditOnRunning editOnRunning.
	
	PyramidPluginEditOnRunning editOnRunning: false.
	self deny: PyramidPluginEditOnRunning editOnRunning.
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testKeyCombination [

	self assert: (PyramidPluginEditOnRunning keyCombination isKindOf: BlKeyCombination) 

]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testNotEditEditor [
	| space |

	PyramidPluginEditOnRunning editOnRunning: true.
	
	space := PyramidEditor new.
	self deny: (PyramidPluginEditOnRunning spaceIds includes: space id).
	self deny: (space root shortcuts includes: (PyramidPluginEditOnRunning shortcut)).
	
	space show.	
	self assert: (PyramidPluginEditOnRunning spaceIds includes: space id).
	self assert: (space root shortcuts includes: (PyramidPluginEditOnRunning shortcut)).
	
	self closeSpace: space.
]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testShortcut [

	self assert: (PyramidPluginEditOnRunning shortcut isKindOf: BlShortcutWithAction).

]

{ #category : #tests }
PyramidPluginEditOnRunningTest >> testSpaceIds [

	self assert: PyramidPluginEditOnRunning spaceIds isEmpty.

]
