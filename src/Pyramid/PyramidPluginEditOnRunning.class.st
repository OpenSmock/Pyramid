Class {
	#name : #PyramidPluginEditOnRunning,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
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

{ #category : #initialization }
PyramidPluginEditOnRunning >> initialize [

	super initialize.
	self start.
]

{ #category : #events }
PyramidPluginEditOnRunning >> receiveBlParallelUniverseHostSpaceCreatedSignal: anEvent [

	
]

{ #category : #'start-stop' }
PyramidPluginEditOnRunning >> start [
	"Install BlUniverse listeners"
	
	BlParallelUniverse all do:[ :u |
		u when: BlParallelUniverseHostSpaceCreatedSignal do:[ :e | self receiveBlParallelUniverseHostSpaceCreatedSignal: e ].
	].
]

{ #category : #'start-stop' }
PyramidPluginEditOnRunning >> stop [
	"Remove BlUniverse listeners"
	
	"not necessary to remove"
]
