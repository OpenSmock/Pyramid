Class {
	#name : #TPyramidSerchablePluginTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #tests }
TPyramidSerchablePluginTest >> testFindPluginNamed [

	| mock errorHasTrigger |
	errorHasTrigger := false.
	mock := PyramidSearchablePluginMock new.
	mock beEmpty.

	[ mock findPluginNamed: #PyramidFakePlugin ]
		on: PyramidPluginNotFoundError
		do: [ :err |
			errorHasTrigger := true.
			self assert: err querry equals: #PyramidFakePlugin.
			self assert: mock plugins equals: err plugins ].
	self assert: errorHasTrigger.
	errorHasTrigger := false.
	mock beUnique.
	[ mock findPluginNamed: #PyramidFakePlugin ]
		on: PyramidPluginNotFoundError
		do: [ :err | self fail ].
	self deny: errorHasTrigger.
	mock beMulti.
	[ mock findPluginNamed: #PyramidFakePlugin ]
		on: PyramidSamePluginReference
		do: [ :err |
			errorHasTrigger := true.
			self assert: err ref class equals: PyramidFakePlugin.
			self assert: mock plugins equals: err plugins ].
	self assert: errorHasTrigger.
]
