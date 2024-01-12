Class {
	#name : #PyramidEditorBuilderTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #tests }
PyramidEditorBuilderTest >> testBuild [

	| editor plugin1 plugin2 plugin3 |
	plugin1 := PyramidFakePlugin new.
	plugin2 := PyramidFakePlugin new.
	plugin3 := PyramidFakePluginThatCannotBeBuilt new.
	editor := PyramidEditorBuilder new
		          plugins: {
				          plugin1.
				          plugin2.
							 plugin3 };
		          build.

	self assert: (editor plugins includes: plugin1).
	self assert: (editor plugins includes: plugin2).
	self deny: (editor plugins includes: plugin3).

	self assert: plugin1 isInstalled.
	self assert: plugin2 isInstalled.
	self deny: plugin3 isInstalled
]

{ #category : #tests }
PyramidEditorBuilderTest >> testDoNotBuildWithBecause [

	| editorBuilder plugin1 plugin2 plugin3 becauseObject |
	plugin1 := PyramidFakePlugin new.
	plugin2 := PyramidFakePlugin new.
	plugin3 := PyramidFakePlugin new.
	becauseObject := Object new.
	editorBuilder := PyramidEditorBuilder new
		          plugins: {
				          plugin1.
				          plugin2.
				          plugin3 };
		          yourself.
	editorBuilder doNotBuildWith: plugin3 because: becauseObject.

	self assert: (editorBuilder plugins includes: plugin1).
	self assert: (editorBuilder plugins includes: plugin2).
	self deny: (editorBuilder plugins includes: plugin3).
	
	self assert: editorBuilder cannotBuildPlugins size equals: 1.
	self assert: editorBuilder cannotBuildPlugins first source equals: plugin3.
	self assert: editorBuilder cannotBuildPlugins first because equals: becauseObject.
]
