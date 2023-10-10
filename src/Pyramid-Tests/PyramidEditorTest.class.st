Class {
	#name : 'PyramidEditorTest',
	#superclass : 'TestCase',
	#category : 'Pyramid-Tests-cases-core',
	#package : 'Pyramid-Tests',
	#tag : 'cases-core'
}

{ #category : 'tests' }
PyramidEditorTest >> openFromBlSpace [

	| editor space element |
	Smalltalk isInteractiveGraphic ifFalse: [ ^ self skip ].
	element := BlElement new.
	space := BlSpace new.
	space root addChild: element.

	self assert: (space root children includes: element).

	editor := space editWithPyramid.
	(Duration milliSeconds: 10) wait.

	self assert: editor window isOpen.
	self assert: (editor projectModel roots includes: element).
	self deny: (space root children includes: element).

	editor window close.
	(Duration milliSeconds: 10) wait.

	self assert: editor window isClosed.
	self deny: (editor projectModel roots includes: element).
	self assert: (space root children includes: element)
]

{ #category : 'tests' }
PyramidEditorTest >> openNewEditor [

	| editor spec |
	editor := PyramidPluginManager uniqueInstance makeEditor.
	spec := editor window open.
	(Duration milliSeconds: 10) wait.
	self currentWorld doOneCycle.
	self assert: editor window isOpen.
	self assert: spec window isInWorld.

	editor window close.
	(Duration milliSeconds: 10) wait.
	self currentWorld doOneCycle.
	self assert: editor window isClosed.
	self deny: spec window isInWorld
]

{ #category : 'tests' }
PyramidEditorTest >> testOpenFromBlSpace [

	Smalltalk isInteractiveGraphic ifFalse: [ ^ self skip ].
	self openFromBlSpace
	
]

{ #category : 'tests' }
PyramidEditorTest >> testOpenFromBlSpaceWithSpacePluginUninstalled [

	PyramidPluginManager uniqueInstance removePlugin: PyramidSpacePlugin.
	self openFromBlSpace.
	PyramidPluginManager uniqueInstance addPlugin: PyramidSpacePlugin
]

{ #category : 'tests' }
PyramidEditorTest >> testOpenNewEditor [
	"This test does not work on a headless vm. The current CI use a headless vm."

	Smalltalk isInteractiveGraphic ifFalse: [ ^ self skip ].
	self openNewEditor.
]

{ #category : 'tests' }
PyramidEditorTest >> testOpenNewEditorWithSpacePluginUninstalled [
	
	PyramidPluginManager uniqueInstance removePlugin: PyramidSpacePlugin.
	self openNewEditor.
	PyramidPluginManager uniqueInstance addPlugin: PyramidSpacePlugin.
	
]
