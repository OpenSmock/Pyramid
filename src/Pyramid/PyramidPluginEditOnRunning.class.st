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

{ #category : #'as yet unclassified' }
PyramidPluginEditOnRunning >> connectOn: aPyramidEditor [

	"do nothing"
]
