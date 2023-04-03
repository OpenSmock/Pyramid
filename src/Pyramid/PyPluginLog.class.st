Class {
	#name : #PyPluginLog,
	#superclass : #Object,
	#traits : 'TPyEditorPlugin',
	#classTraits : 'TPyEditorPlugin classTrait',
	#instVars : [
		'logger'
	],
	#category : #'Pyramid-Plugin-Logger'
}

{ #category : #initialization }
PyPluginLog >> initialize [ 
	logger := PyCommandLogger new.
]

{ #category : #displaying }
PyPluginLog >> installOn: aBusiness [

	aBusiness pipeline addWorkersBeforeTerminate: self logger
]

{ #category : #accessing }
PyPluginLog >> logger [
	^logger
]
