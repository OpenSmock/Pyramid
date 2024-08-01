Class {
	#name : #PyramidEditorBuilder,
	#superclass : #Object,
	#traits : 'TPyramidFindPlugin',
	#classTraits : 'TPyramidFindPlugin classTrait',
	#instVars : [
		'plugins',
		'editor',
		'window',
		'projectModel',
		'commandExecutor'
	],
	#category : #'Pyramid-core'
}

{ #category : #building }
PyramidEditorBuilder >> build [

	self plugins:
		(self plugins select: [ :each | each class shouldInstall ]).

	self plugins do: [ :each | each configureBuilder: self ].

	self editor window: self window.
	self editor plugins: self plugins.
	self editor projectModel: self projectModel.
	self editor commandExecutor: self commandExecutor.

	self plugins do: [ :each | each addPanelsOn: self window ].
	self plugins do: [ :each | each connectOn: self editor ].
	^ editor
]

{ #category : #accessing }
PyramidEditorBuilder >> commandExecutor [

	commandExecutor ifNil: [ commandExecutor := self defaultCommandExecutor ].
	^ commandExecutor
]

{ #category : #accessing }
PyramidEditorBuilder >> commandExecutor: anObject [

	commandExecutor ifNotNil: [
		PyramidBuilderAlreadyConfiguredError signal:
			'The commandExecutor is already set by another plugin.' ].
	commandExecutor := anObject
]

{ #category : #default }
PyramidEditorBuilder >> defaultCommandExecutor [

	^ PyramidCallbackCommandExecutor new
		  afterDo: [ self projectModel informElementsChanged ];
		  wrappee: PyramidMainCommandExecutor new; yourself
]

{ #category : #default }
PyramidEditorBuilder >> defaultEditor [

	^ PyramidEditor new
]

{ #category : #default }
PyramidEditorBuilder >> defaultProjectModel [

	^ PyramidProjectModel new
]

{ #category : #default }
PyramidEditorBuilder >> defaultWindow [

	^ PyramidSimpleWindow new
]

{ #category : #accessing }
PyramidEditorBuilder >> editor [

	editor ifNil: [ editor := self defaultEditor ].
	^ editor
]

{ #category : #accessing }
PyramidEditorBuilder >> editor: anObject [

	editor ifNotNil: [
		PyramidBuilderAlreadyConfiguredError signal:
			'The editor is already set by another plugin.' ].
	editor := anObject
]

{ #category : #accessing }
PyramidEditorBuilder >> plugins [

	plugins ifNil: [ plugins := {  } ].
	^ plugins
]

{ #category : #accessing }
PyramidEditorBuilder >> plugins: anObject [

	plugins := anObject
]

{ #category : #accessing }
PyramidEditorBuilder >> projectModel [

	projectModel ifNil: [ projectModel := self defaultProjectModel ].
	^ projectModel
]

{ #category : #accessing }
PyramidEditorBuilder >> projectModel: aPyramidWindow [

	projectModel ifNotNil: [
		PyramidBuilderAlreadyConfiguredError signal:
			'The projectModel is already set by another plugin !' ].
	projectModel := aPyramidWindow
]

{ #category : #accessing }
PyramidEditorBuilder >> window [

	window ifNil: [ window := self defaultWindow ].
	^ window
]

{ #category : #accessing }
PyramidEditorBuilder >> window: aPyramidWindow [

	window ifNotNil: [
		PyramidBuilderAlreadyConfiguredError signal: 'The window is already set by another plugin !' ].
	window := aPyramidWindow
]
