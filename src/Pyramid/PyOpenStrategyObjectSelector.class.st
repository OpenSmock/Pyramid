Class {
	#name : #PyOpenStrategyObjectSelector,
	#superclass : #Object,
	#traits : 'TPyOpenStrategy',
	#classTraits : 'TPyOpenStrategy classTrait',
	#instVars : [
		'sourceObject',
		'sourceSelector'
	],
	#category : #'Pyramid-Business-Open-Strategy'
}

{ #category : #'as yet unclassified' }
PyOpenStrategyObjectSelector >> retreiveRoots [

	| newRoots |
	newRoots := BlSerializer materialize:
		            (self sourceObject perform: self sourceSelector).
	
	newRoots isCollection
		ifTrue: [ ^ newRoots ]
		ifFalse: [ ^ { newRoots } ]
]

{ #category : #protocol }
PyOpenStrategyObjectSelector >> setupRoots: aBusiness [

	self sourceObject ifNil: [
		PySaveClassMissingError signal: 'The source class is missing.' ].

	self sourceSelector ifNil: [
		PySaveMethodMissingError signal: 'The source selector is missing.' ].

	self setupSaveModel: aBusiness.

	aBusiness roots clear.

	(sourceObject respondsTo: sourceSelector)
		ifTrue: [ aBusiness roots addAll: self retreiveRoots ]
]

{ #category : #accessing }
PyOpenStrategyObjectSelector >> setupSaveModel: aBusiness [

	| saveModel |
	saveModel := (aBusiness getPlugin: PyPluginSave) saveModel.

	self sourceObject isClass
		ifTrue: [
			saveModel defaultPackageName: self sourceObject package name.
			saveModel defaultClassName: self sourceObject name.
			saveModel defaultMethodName: self sourceSelector.
			saveModel classSide ]
		ifFalse: [
			saveModel defaultPackageName: self sourceObject class package name.
			saveModel defaultClassName: self sourceObject class name.
			saveModel defaultMethodName: self sourceSelector.
			saveModel instanceSide ]
]

{ #category : #accessing }
PyOpenStrategyObjectSelector >> sourceObject [

	^ sourceObject
]

{ #category : #accessing }
PyOpenStrategyObjectSelector >> sourceObject: anObject [

	sourceObject := anObject
]

{ #category : #accessing }
PyOpenStrategyObjectSelector >> sourceSelector [

	^ sourceSelector
]

{ #category : #accessing }
PyOpenStrategyObjectSelector >> sourceSelector: aSelector [

	sourceSelector := aSelector
]
