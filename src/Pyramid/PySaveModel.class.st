Class {
	#name : #PySaveModel,
	#superclass : #Object,
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

	instanceSide := false
]

{ #category : #accessing }
PySaveModel >> defaultClassName [

	defaultClassName ifNil: [ defaultClassName := '' ].
	^ defaultClassName
]

{ #category : #accessing }
PySaveModel >> defaultClassName: aString [

	defaultClassName := aString
]

{ #category : #accessing }
PySaveModel >> defaultMethodName [
	defaultMethodName ifNil: [ defaultMethodName := '' ].
	^ defaultMethodName
]

{ #category : #accessing }
PySaveModel >> defaultMethodName: aString [

	defaultMethodName := aString
]

{ #category : #accessing }
PySaveModel >> defaultPackageName [
defaultPackageName ifNil: [ defaultPackageName := '' ].
	^ defaultPackageName
]

{ #category : #accessing }
PySaveModel >> defaultPackageName: aString [

	defaultPackageName := aString
]

{ #category : #accessing }
PySaveModel >> instanceSide [

	instanceSide := true
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
