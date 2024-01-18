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
PyramidEditorBuilderTest >> testCheckDependencies [

	| editorBuilder pluginA pluginB |
	pluginA := PyramidFakePluginA new.
	pluginB := PyramidFakePluginB new.
	editorBuilder := PyramidEditorBuilder new.
	editorBuilder
		plugins: {
				pluginA.
				pluginB };
		checkDependencies;
		yourself.
	self assert: editorBuilder cannotBuildPluginsMessages size equals: 0.
	self assert: editorBuilder plugins size equals: 2.
	self assert: (editorBuilder plugins includes: pluginA).
	self assert: (editorBuilder plugins includes: pluginB).

	editorBuilder
		plugins: { pluginB };
		checkDependencies;
		yourself.
	self assert: editorBuilder cannotBuildPluginsMessages size equals: 1.
	self assert: editorBuilder plugins size equals: 0.

	self
		assert: editorBuilder cannotBuildPluginsMessages first source
		equals: pluginB.
	self assert:
		(editorBuilder cannotBuildPluginsMessages first because isKindOf:
			 PyramidPluginNotFoundError).
	self
		assert:
		editorBuilder cannotBuildPluginsMessages first because querry
		equals: PyramidFakePluginA
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

	self assert: editorBuilder cannotBuildPluginsMessages size equals: 1.
	self
		assert: editorBuilder cannotBuildPluginsMessages first source
		equals: plugin3.
	self
		assert: editorBuilder cannotBuildPluginsMessages first because
		equals: becauseObject
]

{ #category : #tests }
PyramidEditorBuilderTest >> testOrderPluginsBeforeBuild [

	| pluginsList pluginsListAfterBuild |
	pluginsList := {
		               PyramidFakePluginA new.
		               PyramidFakePluginB new.
		               PyramidFakePluginC new.
		               PyramidFakePluginD new.
		               PyramidFakePluginE new.
		               PyramidFakePluginF new.
		               PyramidFakePluginG new }
		               asOrderedCollection.

	1 to: 20 do: [ :i |
		pluginsListAfterBuild := PyramidEditorBuilder new
			                         plugins: pluginsList shuffled;
			                         orderPluginsBeforeBuild;
			                         plugins.
		self
			assert: (pluginsListAfterBuild at: 1)
			equals: (pluginsList at: 1).
		self
			assert: (pluginsListAfterBuild at: 2)
			equals: (pluginsList at: 2).
		self
			assert: (pluginsListAfterBuild at: 3)
			equals: (pluginsList at: 3).
		self
			assert: (pluginsListAfterBuild at: 4)
			equals: (pluginsList at: 4).
		self
			assert: (pluginsListAfterBuild at: 5)
			equals: (pluginsList at: 5).
		self
			assert: (pluginsListAfterBuild at: 6)
			equals: (pluginsList at: 6).
		self
			assert: (pluginsListAfterBuild at: 7)
			equals: (pluginsList at: 7).
		self assert: pluginsListAfterBuild asSet size equals: 7 ]
]
