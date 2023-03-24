Class {
	#name : #PyPluginHistory,
	#superclass : #Object,
	#traits : 'TPyEditorPlugin',
	#classTraits : 'TPyEditorPlugin classTrait',
	#instVars : [
		'history'
	],
	#category : #'Pyramid-Plugin-History'
}

{ #category : #accessing }
PyPluginHistory >> history [
	^ history
]

{ #category : #initialization }
PyPluginHistory >> initialize [ 
	history := PyCommandHistory new.
]

{ #category : #displaying }
PyPluginHistory >> installOn: aBusiness [

	aBusiness pipeline addWorkerFirst: self history
]
