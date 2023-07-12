Class {
	#name : #PyramidSpacePluginDeprecated,
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
PyramidSpacePluginDeprecated class >> initialize [

	"PyramidPluginManager uniqueInstance addPlugin: self"
]

{ #category : #adding }
PyramidSpacePluginDeprecated >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow
		at: #space
		addItem: [ :builder | builder makePresenter: self spaceSwitch ].
	aPyramidSimpleWindow at: #topLeft addItem: [ :builder |
		builder makeButtonWithIcon: self resetSpaceButton order: 5 ]
]

{ #category : #'as yet unclassified' }
PyramidSpacePluginDeprecated >> connectOn: aPyramidEditor [

	| spacePresenter |
	spacePresenter := PyramidSpacePresenter new.
	self spaceSwitch editor: aPyramidEditor.
	self spaceSwitch spacePresenter: spacePresenter
]

{ #category : #initialization }
PyramidSpacePluginDeprecated >> initialize [

	spaceSwitch := PyramidSpaceSwitchPresenter new.
	resetSpaceButton := SpButtonPresenter new
		                    icon: (self iconNamed: #smallUpdate);
		                    action: [ self resetSpacePresenter ];
		help: 'Refresh space in case of an issue';
		                    yourself
]

{ #category : #initialization }
PyramidSpacePluginDeprecated >> resetSpaceButton [
	^ resetSpaceButton
]

{ #category : #initialization }
PyramidSpacePluginDeprecated >> resetSpacePresenter [

	self spaceSwitch spacePresenter: PyramidSpacePresenter new
]

{ #category : #'as yet unclassified' }
PyramidSpacePluginDeprecated >> spaceSwitch [

	^ spaceSwitch
]
