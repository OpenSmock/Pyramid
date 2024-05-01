Class {
	#name : #PyramidEditorBuilderTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #tests }
PyramidEditorBuilderTest >> testBuild1 [

	| editor plugin1 plugin2 |
	plugin1 := PyramidFakePlugin new.
	plugin2 := PyramidFakePlugin new.
	editor := PyramidEditorBuilder new
		          plugins: {
				          plugin1.
				          plugin2 };
		          build.

	self assert: (editor plugins includes: plugin1).
	self assert: (editor plugins includes: plugin2).

	self assert: plugin1 isInstalled.
	self assert: plugin2 isInstalled
]

{ #category : #tests }
PyramidEditorBuilderTest >> testBuild2 [

	| editor plugin1 plugin2 |
	plugin1 := PyramidFakePlugin new.
	plugin2 := PyramidFakePluginThatShouldNotBeInstalled new.
	editor := PyramidEditorBuilder new
		          plugins: {
				          plugin1.
				          plugin2 };
		          build.

	self assert: (editor plugins includes: plugin1).
	self deny: (editor plugins includes: plugin2).

	self assert: plugin1 isInstalled.
	self deny: plugin2 isInstalled
]
