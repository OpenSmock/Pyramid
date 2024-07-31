Class {
	#name : #PyramidEditorTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #tests }
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
	self assert: (editor projectModel firstLevelElements includes: element).
	self deny: (space root children includes: element).

	editor close.
	(Duration milliSeconds: 10) wait.

	self assert: editor window isClosed.
	self deny: (editor projectModel firstLevelElements includes: element).
	self assert: (space root children includes: element)
]

{ #category : #tests }
PyramidEditorTest >> openNewEditor [

	| editor spec |
	editor := PyramidEditor buildEditor.
	editor open.
	
	spec := editor window spec.
	(Duration milliSeconds: 10) wait.
	self currentWorld doOneCycle.
	self assert: editor window isOpen.
	self assert: spec window isInWorld.

	editor close.
	(Duration milliSeconds: 10) wait.
	self currentWorld doOneCycle.
	self assert: editor window isClosed.
	self deny: spec window isInWorld
]

{ #category : #running }
PyramidEditorTest >> setUp [
	super setUp.

	"Need to initialize the plugin inorder to be sure they are loaded on the baseline when we use the CI."
	PyramidPluginManager imagePluginClasses do: [ :each | each initialize ].
]

{ #category : #tests }
PyramidEditorTest >> testOpenFromBlSpace [

	Smalltalk isInteractiveGraphic ifFalse: [ ^ self skip ].
	self openFromBlSpace
	
]

{ #category : #tests }
PyramidEditorTest >> testOpenFromBlSpaceWithSpacePluginUninstalled [

	PyramidPluginManager uniqueInstance removePlugin: PyramidSpacePlugin.
	self openFromBlSpace.
	PyramidPluginManager uniqueInstance addPlugin: PyramidSpacePlugin
]

{ #category : #tests }
PyramidEditorTest >> testOpenNewEditor [
	"This test does not work on a headless vm. The current CI use a headless vm."

	Smalltalk isInteractiveGraphic ifFalse: [ ^ self skip ].
	self openNewEditor.
]

{ #category : #tests }
PyramidEditorTest >> testOpenNewEditorWithSpacePluginUninstalled [
	
	PyramidPluginManager uniqueInstance removePlugin: PyramidSpacePlugin.
	self openNewEditor.
	PyramidPluginManager uniqueInstance addPlugin: PyramidSpacePlugin.
	
]
