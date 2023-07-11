Class {
	#name : #PyramidEditorTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #tests }
PyramidEditorTest >> testOpenNewEditorWithSpacePluginInstalled [
	"This test does not work on a headless vm. The current CI use a headless vm."

	| editor spec |
	Smalltalk isInteractiveGraphic ifFalse: [ ^ self skip ].
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

{ #category : #tests }
PyramidEditorTest >> testOpenNewEditorWithSpacePluginUninstalled [

	| editor spec |
	editor := PyramidEditorBuilder new
		          plugins:
			          (PyramidPluginManager uniqueInstance pluginClasses
				           reject: [ :class | class name = #PyramidSpacePlugin ]
				           thenCollect: [ :class | class new ]);
		          build.

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
