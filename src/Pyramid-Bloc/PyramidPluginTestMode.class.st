Class {
	#name : #PyramidPluginTestMode,
	#superclass : #Object,
	#traits : 'TPyramidPlugin + TPyramidEditorExtension',
	#classTraits : 'TPyramidPlugin classTrait + TPyramidEditorExtension classTrait',
	#instVars : [
		'button',
		'spacePlugin',
		'isTestOnGoing',
		'builder'
	],
	#category : #'Pyramid-Bloc-plugin-testmode'
}

{ #category : #adding }
PyramidPluginTestMode >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow
		at: #topRight
		addItem: [ :builder |
		builder makeButtonWithIcon: self button order: 0 ].
]

{ #category : #'as yet unclassified' }
PyramidPluginTestMode >> builder [

	^ builder
]

{ #category : #actions }
PyramidPluginTestMode >> button [ 

	^ button
]

{ #category : #connecting }
PyramidPluginTestMode >> connectOn: aPyramidEditor [

	spacePlugin := aPyramidEditor plugins
		               detect: [ :p | p isKindOf: PyramidSpacePlugin ]
		               ifNone: [  ].
		
	spacePlugin ifNotNil: [ 	builder := spacePlugin builder ]

]

{ #category : #actions }
PyramidPluginTestMode >> initialize [

	isTestOnGoing := false.
	button := SpButtonPresenter new
		          icon: self startTestIcon;
		          help: 'Switch between test/edit mode.';
		          action: [ self switchToTestMode ];
		          yourself
]

{ #category : #accessing }
PyramidPluginTestMode >> isTestOnGoing [
	^ isTestOnGoing
]

{ #category : #accessing }
PyramidPluginTestMode >> isTestOnGoing: aBoolean [

	isTestOnGoing := aBoolean
]

{ #category : #'as yet unclassified' }
PyramidPluginTestMode >> startTestIcon [

	^ Smalltalk ui icons iconNamed: #smallDoIt
]

{ #category : #'as yet unclassified' }
PyramidPluginTestMode >> stopTestIcon [

	^ Smalltalk ui icons iconNamed: #stop
]

{ #category : #actions }
PyramidPluginTestMode >> switchToTestMode [
	"
	if test ok
	0. isTestOnGoing: false.
	1. event element visibility: visible.
	2. displayAddons element visibility: visible.
	if test nok
	0. isTestOnGoing: true.
	1. event element visibility: gone.
	2. displayAddons element visibility: gone."

	| event displayPosition |
	self builder ifNil: [
		self flag:
			'If builder is nil then there is no space plugin loaded on current Pyramid instance.'.
		self inform:
			'No space plugin found. Please reload the Pyramid plugins on WorldMenu.'.
		^ self ].
	event := self elementAtEvents.
	displayPosition := self elementAtDisplaysAddons.
	self isTestOnGoing
		ifTrue: [
			self isTestOnGoing: false.
			self button icon: self startTestIcon.
			event visibility: BlVisibility visible.
			displayPosition visibility: BlVisibility visible ]
		ifFalse: [
			self isTestOnGoing: true.
			self button icon: self stopTestIcon.
			event visibility: BlVisibility gone.
			displayPosition visibility: BlVisibility gone ]
]
