Class {
	#name : #PyPluginSave,
	#superclass : #Object,
	#traits : 'TPyEditorPlugin',
	#classTraits : 'TPyEditorPlugin classTrait',
	#instVars : [
		'saveCore'
	],
	#category : #'Pyramid-Plugin-Save'
}

{ #category : #initialization }
PyPluginSave >> initialize [

	saveCore := PySaveCore new.
]

{ #category : #displaying }
PyPluginSave >> installOn: aBusiness [
	saveCore roots: aBusiness roots

	
]
