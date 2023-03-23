Class {
	#name : #PyBuildProperty,
	#superclass : #Object,
	#instVars : [
		'view',
		'controller'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyBuildProperty class >> build: aString withForm: aFormClass withCommand: aCommandClass [

	^ self
		  build: aString
		  withSingleForm: aFormClass
		  withMultiForm: aFormClass
		  withCommand: aCommandClass
		  withSelection: PySelection new
]

{ #category : #'as yet unclassified' }
PyBuildProperty class >> build: aString withForm: aFormClass withCommand: aCommandClass withSelection: aSelection [

	^ self build: aString withSingleForm: aFormClass withMultiForm: aFormClass withCommand: aCommandClass withSelection: aSelection
]

{ #category : #'as yet unclassified' }
PyBuildProperty class >> build: aString withSingleForm: aSingleFormClass withMultiForm: aMultiFormClass withCommand: aCommandClass [

	^ self build: aString withSingleForm: aSingleFormClass withMultiForm: aMultiFormClass withCommand: aCommandClass withSelection: PySelection new
]

{ #category : #'as yet unclassified' }
PyBuildProperty class >> build: aString withSingleForm: aSingleFormClass withMultiForm: aMultiFormClass withCommand: aCommandClass withSelection: aSelection [

	| view controller |
	view := PyViewProperty new.
	view sectionName: aString.
	view singleFormClass: aSingleFormClass.
	view mutliFormClass: aMultiFormClass.

	controller := PyControllerProperty new.
	controller command: aCommandClass new.

	view controller: controller.
	controller view: view.

	^ self new view: view; controller: controller; selection: aSelection; yourself
]

{ #category : #accessing }
PyBuildProperty >> controller [
	^ controller
]

{ #category : #accessing }
PyBuildProperty >> controller: aPyControllerProperty [ 
	controller := aPyControllerProperty
]

{ #category : #accessing }
PyBuildProperty >> pipeline: aPyPipeline [ 
	self controller pipeline: aPyPipeline 
]

{ #category : #accessing }
PyBuildProperty >> selection: aPySelection [ 
	view selection: aPySelection.
	controller selection: aPySelection
]

{ #category : #accessing }
PyBuildProperty >> view [
	^ view
]

{ #category : #accessing }
PyBuildProperty >> view: aPyViewProperty [ 
	view := aPyViewProperty
]
