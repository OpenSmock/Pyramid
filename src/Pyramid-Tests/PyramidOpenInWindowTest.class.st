Class {
	#name : #PyramidOpenInWindowTest,
	#superclass : #TestCase,
	#instVars : [
		'window',
		'windowSize',
		'projectModel',
		'space',
		'mainExtension'
	],
	#category : #'Pyramid-Tests-cases-plugin-openInWindow'
}

{ #category : #running }
PyramidOpenInWindowTest >> setUp [

	super setUp.
	window := PyramidPluginOpenInWindow new.
	window projectModel: PyramidProjectModel new.
	window builder: PyramidSpaceBuilder new.
	window builder space: BlSpace new.
]

{ #category : #running }
PyramidOpenInWindowTest >> tearDown [

	space ifNotNil: [
			space close.
			space := nil ].

	PyramidMainExtension currentGridWindowSize: windowSize.

	super tearDown
]

{ #category : #tests }
PyramidOpenInWindowTest >> testOpenSpaceDefaultSizeWhenNoExtension [

	space := window buildSpaceInWindow.
	self assert: space extent equals: 800 @ 600
]

{ #category : #tests }
PyramidOpenInWindowTest >> testOpenSpaceTransfersTheme [

	| theme builderSpace |
	builderSpace := BlSpace new.
	theme := ToBeeDarkTheme new.
	builderSpace toTheme: theme.
	window builder space: builderSpace.
	space := window buildSpaceInWindow.
	self assert: space toTheme equals: theme
]

{ #category : #tests }
PyramidOpenInWindowTest >> testOpenSpaceWithExtension [

	| mockExtension mockSizeElement |
	mockSizeElement := 0 @ 0 extent: 1024 @ 768.
	mockExtension := PyramidMainExtension new.
	mockExtension instVarNamed: 'sizeElement' put: mockSizeElement.
	window builder extensions add: mockExtension.
	space := window buildSpaceInWindow.
	self assert: space extent equals: 1024 @ 768
]
