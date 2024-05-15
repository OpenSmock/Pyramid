Class {
	#name : 'PyramidPluginTestModeTest',
	#superclass : 'TestCase',
	#instVars : [
		'plugin',
		'spacePlugin',
		'editor'
	],
	#category : 'Pyramid-Bloc-plugin-testmode',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-testmode'
}

{ #category : 'accessing' }
PyramidPluginTestModeTest >> editor [
^ editor
]

{ #category : 'accessing' }
PyramidPluginTestModeTest >> plugin [

	^ plugin
]

{ #category : 'running' }
PyramidPluginTestModeTest >> setUp [

	super setUp.

	plugin := PyramidPluginTestMode new.
	spacePlugin := PyramidSpacePlugin new.
	editor := PyramidEditorBuilder new plugins: { plugin . spacePlugin }; build.
]

{ #category : 'tests' }
PyramidPluginTestModeTest >> testIsTestOnGoing [

	self assert: self plugin isTestOnGoing not.
	self plugin switchToTestMode.
	self assert: self plugin isTestOnGoing.
	self plugin switchToTestMode.
	self assert: self plugin isTestOnGoing not.
]

{ #category : 'tests' }
PyramidPluginTestModeTest >> testSwitchToTestMode [

	| element elementThatReceiveEvent |
	element := BlElement new
		           size: 500 asPoint;
		           background: Color blue;
		           addEventHandler: (BlEventHandler
				            on: BlPrimaryClickEvent
				            do: [ :evt |  ]);
		           yourself.
	self plugin elementAtEvents addEventHandler: (BlEventHandler
			 on: BlPrimaryClickEvent
			 do: [ :evt |  ]).
	self editor projectModel firstLevelElements add: element.

	self plugin elementAtMain forceLayout.
	elementThatReceiveEvent := self plugin elementAtMain
		                           findMouseEventTargetAt:
		                           10 asPoint
		                           + self plugin currentTransformTranslation.
	self deny: elementThatReceiveEvent equals: element.

	self plugin switchToTestMode.
	self plugin elementAtMain forceLayout.
	elementThatReceiveEvent := self plugin elementAtMain
		                           findMouseEventTargetAt:
		                           10 asPoint
		                           + self plugin currentTransformTranslation.
	self assert: elementThatReceiveEvent equals: element.

	self plugin switchToTestMode.
	self plugin elementAtMain forceLayout.
	elementThatReceiveEvent := self plugin elementAtMain
		                           findMouseEventTargetAt:
		                           10 asPoint
		                           + self plugin currentTransformTranslation.
	self deny: elementThatReceiveEvent equals: element
]
