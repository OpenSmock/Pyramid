Class {
	#name : 'PyramidEditorBuilderTest',
	#superclass : 'TestCase',
	#category : 'Pyramid-Tests-cases-core',
	#package : 'Pyramid-Tests',
	#tag : 'cases-core'
}

{ #category : 'tests' }
PyramidEditorBuilderTest >> testBuild [

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
