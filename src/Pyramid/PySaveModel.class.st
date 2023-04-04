Class {
	#name : #PySaveModel,
	#superclass : #Object,
	#classTraits : 'TPySaveModel classTrait',
	#instVars : [
		'instanceSide',
		'defaultClassName',
		'defaultMethodName',
		'defaultPackageName'
	],
	#category : #'Pyramid-Plugin-Save'
}

{ #category : #accessing }
PySaveModel >> classSide [

	instanceSide := false.
	self notifyObservers
]

{ #category : #accessing }
PySaveModel >> defaultClassName [

	defaultClassName ifNil: [ defaultClassName := '' ].
	^ defaultClassName
]

{ #category : #accessing }
PySaveModel >> defaultClassName: aString [

	defaultClassName := aString.
	self notifyObservers
]

{ #category : #accessing }
PySaveModel >> defaultMethodName [
	defaultMethodName ifNil: [ defaultMethodName := '' ].
	^ defaultMethodName
]

{ #category : #accessing }
PySaveModel >> defaultMethodName: aString [

	defaultMethodName := aString.
	self notifyObservers
]

{ #category : #accessing }
PySaveModel >> defaultPackageName [
defaultPackageName ifNil: [ defaultPackageName := '' ].
	^ defaultPackageName
]

{ #category : #accessing }
PySaveModel >> defaultPackageName: aString [

	defaultPackageName := aString.
	self notifyObservers
]

{ #category : #accessing }
PySaveModel >> instanceSide [

	instanceSide := true.
	self notifyObservers
]

{ #category : #accessing }
PySaveModel >> isClassSide [

	^ self isInstanceSide not
]

{ #category : #accessing }
PySaveModel >> isInstanceSide [

	instanceSide ifNil: [ instanceSide := false ].
	^ instanceSide
]
