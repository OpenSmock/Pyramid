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
		 help: self startTestHelp;
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
PyramidPluginTestMode >> noBuilderFoundHelp [

	^ 'An error as occure. Please reload plugins on worldmenu > Library > Pyramid > reload plugins.'
]

{ #category : #'as yet unclassified' }
PyramidPluginTestMode >> startTestHelp [

	^ 'Switch to test mode.'
]

{ #category : #'as yet unclassified' }
PyramidPluginTestMode >> startTestIcon [

	^ self iconNamed: #smallDoIt
]

{ #category : #'as yet unclassified' }
PyramidPluginTestMode >> stopTestHelp [

	^ 'Switch to edit mode.'
]

{ #category : #'as yet unclassified' }
PyramidPluginTestMode >> stopTestIcon [

	^ self iconNamed: #stop
]

{ #category : #actions }
PyramidPluginTestMode >> switchToTestMode [
	"
	if test ok
	0. enabledTesting: false.
	1. event element visibility: visible.""
	if test nok
	0. enabledTesting: true.
	1. event element visibility: gone."

	| event displayPosition |
	self builder ifNil: [ self button help: self noBuilderFoundHelp. ^ self ].
	event := self elementAtEvents.
	displayPosition := self elementAtDisplaysAddons.
	self isTestOnGoing
		ifTrue: [
			self isTestOnGoing: false.
			self button icon: self startTestIcon.
			self button help: self startTestHelp.
			event visibility: BlVisibility visible.
			displayPosition visibility: BlVisibility visible ]
		ifFalse: [
			self isTestOnGoing: true.
			self button icon: self stopTestIcon.
			self button help: self stopTestHelp.
			event visibility: BlVisibility gone.
			displayPosition visibility: BlVisibility gone ]
]
