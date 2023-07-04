Class {
	#name : #PyramidEditorTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-Cases'
}

{ #category : #tests }
PyramidEditorTest >> testOpenNewEditor [

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
