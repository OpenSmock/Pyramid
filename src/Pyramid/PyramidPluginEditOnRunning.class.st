Class {
	#name : #PyramidPluginEditOnRunning,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'editOnRunning'
	],
	#classInstVars : [
		'editOnRunning'
	],
	#category : #'Pyramid-plugin-edit-on-running'
}

{ #category : #accessing }
PyramidPluginEditOnRunning class >> editOnRunning [

	^ editOnRunning ifNil: [ editOnRunning := true ]
]

{ #category : #accessing }
PyramidPluginEditOnRunning class >> editOnRunning: aBoolean [

	editOnRunning := aBoolean
]

{ #category : #initialization }
PyramidPluginEditOnRunning class >> install [
	"Do some stuff here when the plugin used class oriented behavior"
	
	self installBlUniverseListeners.
]

{ #category : #'universe management' }
PyramidPluginEditOnRunning class >> installBlUniverseListeners [
	
	BlParallelUniverse all do:[ :universe |
		universe 
			when: BlParallelUniverseHostSpaceCreatedSignal 
			do:[ :e | self receiveBlParallelUniverseHostSpaceCreatedSignal: e ].
	].
]

{ #category : #'universe management' }
PyramidPluginEditOnRunning class >> receiveBlParallelUniverseHostSpaceCreatedSignal: anEvent [

	self editOnRunning ifFalse: [ ^ self ].
]

{ #category : #adding }
PyramidPluginEditOnRunning >> addPanelsOn: aPyramidSimpleWindow [

	"do nothing"
]

{ #category : #actions }
PyramidPluginEditOnRunning >> configureBuilder: aPyramidEditorBuilder [

	"do nothing"
]

{ #category : #connecting }
PyramidPluginEditOnRunning >> connectOn: aPyramidEditor [

	"do nothing"
]
