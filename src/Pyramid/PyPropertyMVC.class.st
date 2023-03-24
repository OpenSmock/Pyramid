Class {
	#name : #PyPropertyMVC,
	#superclass : #Object,
	#instVars : [
		'view',
		'controller'
	],
	#category : #'Pyramid-Editor-Panels-Properties'
}

{ #category : #'as yet unclassified' }
PyPropertyMVC class >> build: aString withForm: aFormClass withCommand: aCommandClass [

	^ self
		  build: aString
		  withSingleForm: aFormClass
		  withMultiForm: aFormClass
		  withCommand: aCommandClass
		  withSelection: PySelection new
]

{ #category : #'as yet unclassified' }
PyPropertyMVC class >> build: aString withForm: aFormClass withCommand: aCommandClass withSelection: aSelection [

	^ self build: aString withSingleForm: aFormClass withMultiForm: aFormClass withCommand: aCommandClass withSelection: aSelection
]

{ #category : #'as yet unclassified' }
PyPropertyMVC class >> build: aString withSingleForm: aSingleFormClass withMultiForm: aMultiFormClass withCommand: aCommandClass [

	^ self build: aString withSingleForm: aSingleFormClass withMultiForm: aMultiFormClass withCommand: aCommandClass withSelection: PySelection new
]

{ #category : #'as yet unclassified' }
PyPropertyMVC class >> build: aString withSingleForm: aSingleFormClass withMultiForm: aMultiFormClass withCommand: aCommandClass withSelection: aSelection [

	| view controller |
	view := PyPropertyView new.
	view sectionName: aString.
	view singleFormClass: aSingleFormClass.
	view mutliFormClass: aMultiFormClass.

	controller := PyPropertyController new.
	controller command: aCommandClass new.

	view controller: controller.
	controller view: view.

	^ self new view: view; controller: controller; selection: aSelection; yourself
]

{ #category : #accessing }
PyPropertyMVC >> controller [
	^ controller
]

{ #category : #accessing }
PyPropertyMVC >> controller: aPyControllerProperty [ 
	controller := aPyControllerProperty
]

{ #category : #accessing }
PyPropertyMVC >> pipeline: aPyPipeline [ 
	self controller pipeline: aPyPipeline 
]

{ #category : #accessing }
PyPropertyMVC >> selection: aPySelection [ 
	view selection: aPySelection.
	controller selection: aPySelection
]

{ #category : #accessing }
PyPropertyMVC >> view [
	^ view
]

{ #category : #accessing }
PyPropertyMVC >> view: aPyViewProperty [ 
	view := aPyViewProperty
]
