Class {
	#name : #PyPluginSave,
	#superclass : #Object,
	#traits : 'TPyEditorPlugin',
	#classTraits : 'TPyEditorPlugin classTrait',
	#instVars : [
		'saveCore',
		'saveModel',
		'validator'
	],
	#category : #'Pyramid-Plugin-Save'
}

{ #category : #initialization }
PyPluginSave >> initialize [

	saveCore := PySaveCore new.
	saveModel := PySaveModel new.
	validator := PySaveValidator new.

	saveCore model: saveModel
]

{ #category : #displaying }
PyPluginSave >> installOn: aBusiness [
	saveCore roots: aBusiness roots

	
]

{ #category : #accessing }
PyPluginSave >> saveCore [

	^ saveCore
]

{ #category : #accessing }
PyPluginSave >> saveModel [

	^ saveModel
]

{ #category : #accessing }
PyPluginSave >> validator [
	^ validator
]
