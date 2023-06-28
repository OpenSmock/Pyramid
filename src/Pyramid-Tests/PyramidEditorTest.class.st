Class {
	#name : #PyramidEditorTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-Cases'
}

{ #category : #tests }
PyramidEditorTest >> testOpenNewEditor [ 

	| editor |
	editor := PyramidPluginManager uniqueInstance makeEditor.
	editor window open.
	self assert: editor window isOpen.
	
	editor window close.
	self assert: editor window isClosed.
]
