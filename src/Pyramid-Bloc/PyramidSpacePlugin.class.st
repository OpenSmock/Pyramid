Class {
	#name : #PyramidSpacePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'resetSpaceButton',
		'spaceSwitch'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #'class initialization' }
PyramidSpacePlugin class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #adding }
PyramidSpacePlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow
		at: #space
		addItem: [ :builder | builder makePresenter: self spaceSwitch ].
	aPyramidSimpleWindow at: #topLeft addItem: [ :builder |
		builder makeButtonWithIcon: self resetSpaceButton order: 5 ]
]

{ #category : #'as yet unclassified' }
PyramidSpacePlugin >> connectOn: aPyramidEditor [

	| spacePresenter |
	spacePresenter := PyramidSpacePresenter new.
	self spaceSwitch editor: aPyramidEditor.
	self spaceSwitch spacePresenter: spacePresenter
]

{ #category : #initialization }
PyramidSpacePlugin >> initialize [

	spaceSwitch := PyramidSpaceSwitchPresenter new.
	resetSpaceButton := SpButtonPresenter new
		                    icon: (self iconNamed: #smallUpdate);
		                    action: [ self resetSpacePresenter ];
		                    yourself
]

{ #category : #initialization }
PyramidSpacePlugin >> resetSpaceButton [
	^ resetSpaceButton
]

{ #category : #initialization }
PyramidSpacePlugin >> resetSpacePresenter [

	self spaceSwitch spacePresenter: PyramidSpacePresenter new
]

{ #category : #'as yet unclassified' }
PyramidSpacePlugin >> spaceSwitch [

	^ spaceSwitch
]
