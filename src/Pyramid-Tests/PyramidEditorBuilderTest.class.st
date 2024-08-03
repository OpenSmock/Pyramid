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

{ #category : #tests }
PyramidEditorBuilderTest >> testCommandExecutor [

	| builder target1 target2 editor |
	target1 := PyramidMainCommandExecutor new.
	target2 := PyramidMainCommandExecutor new.

	"Default value is not nil"
	builder := PyramidEditorBuilder new.
	self assert: builder commandExecutor isNotNil.

	"editor is correctly set"
	builder := PyramidEditorBuilder new.
	builder commandExecutor: target1.
	self assert: builder commandExecutor equals: target1.
	editor := builder build.
	self assert: editor commandExecutor equals: target1.

	"cannot set twice"
	builder := PyramidEditorBuilder new.
	builder commandExecutor: target1.
	self assert: builder commandExecutor equals: target1.
	[
	builder commandExecutor: target2.
	self fail ]
		on: PyramidBuilderAlreadyConfiguredError
		do: [ self assert: true ]
]

{ #category : #tests }
PyramidEditorBuilderTest >> testEditor [

	| builder target1 target2 editor |
	target1 := PyramidEditor new.
	target2 := PyramidEditor new.

	"Default value is not nil"
	builder := PyramidEditorBuilder new.
	self assert: builder editor isNotNil.

	"editor is correctly set"
	builder := PyramidEditorBuilder new.
	builder editor: target1.
	self assert: builder editor equals: target1.
	editor := builder build.
	self assert: editor equals: target1.

	"cannot set twice"
	builder := PyramidEditorBuilder new.
	builder editor: target1.
	self assert: builder editor equals: target1.
	[
	builder editor: target2.
	self fail ]
		on: PyramidBuilderAlreadyConfiguredError
		do: [ self assert: true ]
]

{ #category : #tests }
PyramidEditorBuilderTest >> testProjectModel [

	| builder target1 target2 editor |
	target1 := PyramidProjectModel new.
	target2 := PyramidProjectModel new.

	"Default value is not nil"
	builder := PyramidEditorBuilder new.
	self assert: builder projectModel isNotNil.

	"editor is correctly set"
	builder := PyramidEditorBuilder new.
	builder projectModel: target1.
	self assert: builder projectModel equals: target1.
	editor := builder build.
	self assert: editor projectModel equals: target1.

	"cannot set twice"
	builder := PyramidEditorBuilder new.
	builder projectModel: target1.
	self assert: builder projectModel equals: target1.
	[
	builder projectModel: target2.
	self fail ]
		on: PyramidBuilderAlreadyConfiguredError
		do: [ self assert: true ]
]

{ #category : #tests }
PyramidEditorBuilderTest >> testWindow [

	| builder target1 target2 editor |
	target1 := PyramidSimpleWindow new.
	target2 := PyramidSimpleWindow new.

	"Default value is not nil"
	builder := PyramidEditorBuilder new.
	self assert: builder window isNotNil.

	"editor is correctly set"
	builder := PyramidEditorBuilder new.
	builder window: target1.
	self assert: builder window equals: target1.
	editor := builder build.
	self assert: editor window equals: target1.

	"cannot set twice"
	builder := PyramidEditorBuilder new.
	builder window: target1.
	self assert: builder window equals: target1.
	[
	builder window: target2.
	self fail ]
		on: PyramidBuilderAlreadyConfiguredError
		do: [ self assert: true ]
]
