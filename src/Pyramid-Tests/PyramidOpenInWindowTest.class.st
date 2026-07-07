Class {
	#name : #PyramidOpenInWindowTest,
	#superclass : #TestCase,
	#instVars : [
		'window',
		'windowSize',
		'projectModel',
		'openedSpaces'
	],
	#category : #'Pyramid-Tests-cases-plugin-openInWindow'
}

{ #category : #running }
PyramidOpenInWindowTest >> setUp [

	super setUp.
	projectModel := PyramidProjectModel new.
	window := PyramidPluginOpenInWindow new.
	window projectModel: projectModel.
	window builder: PyramidSpaceBuilder new.
	windowSize := PyramidMainExtension currentGridWindowSize.
]

{ #category : #running }
PyramidOpenInWindowTest >> tearDown [

	PyramidMainExtension currentGridWindowSize: windowSize.
	super tearDown
]

{ #category : #tests }
PyramidOpenInWindowTest >> testOpenSpaceInWindowAddsProjectElements [

	| space |

	space := window openSpaceInWindow.
	self assert: space root children size equals: 1.
	self
		assert: space root children first children size
		equals: window projectModel firstLevelElements size
]

{ #category : #tests }
PyramidOpenInWindowTest >> testOpenSpaceInWindowContainerMatchesParent [
    | space container |
    space := window openSpaceInWindow.
    container := space root children first.
    self assert: container constraints horizontal resizer equals: BlLayoutResizer matchParent.
    self assert: container constraints vertical resizer equals: BlLayoutResizer matchParent.
]

{ #category : #tests }
PyramidOpenInWindowTest >> testOpenSpaceInWindowUsesBuilderTheme [

	| initialSpace rootElement theme openedSpace |
	theme := ToRawDarkTheme new.
	rootElement := BlElement new.
	rootElement localTheme: theme.

	initialSpace := BlSpace new.
	initialSpace root: rootElement.

	window builder: (PyramidSpaceBuilder new space: initialSpace).

	openedSpace := window openSpaceInWindow.

	self assert: openedSpace root localTheme equals: theme
]

{ #category : #tests }
PyramidOpenInWindowTest >> testOpenSpaceInWindowWithBuilderHavingNilSpace [
    | space |
    window builder: (PyramidSpaceBuilder new space: nil).
    space := window openSpaceInWindow.
    self assert: space isNotNil
]

{ #category : #tests }
PyramidOpenInWindowTest >> testOpenSpaceInWindowWithBuilderSpaceHavingNilRoot [

	| initialSpace space |
	initialSpace := BlSpace new.
	window builder: (PyramidSpaceBuilder new space: initialSpace).
	space := window openSpaceInWindow.
	self assert: space isNotNil.
]

{ #category : #tests }
PyramidOpenInWindowTest >> testWindowDefaultExtent [

	| space |
	space := window openSpaceInWindow.
	self assert: space extent equals: 800 @ 600
]

{ #category : #tests }
PyramidOpenInWindowTest >> testWindowExtentUsesConfiguredGridSize [

	| space |
	PyramidMainExtension currentGridWindowSize: 2000 @ 1000.
	space := window openSpaceInWindow.

	self assert: space extent equals: 2000 @ 1000
]
