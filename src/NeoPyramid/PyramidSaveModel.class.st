Class {
	#name : #PyramidSaveModel,
	#superclass : #Object,
	#instVars : [
		'savingClassName',
		'savingMethodName',
		'savingPackageName',
		'project',
		'classSide'
	],
	#category : #'NeoPyramid-plugin-save'
}

{ #category : #testing }
PyramidSaveModel >> isClassSide [

	classSide ifNil: [ classSide := true ].
	^ classSide
]

{ #category : #testing }
PyramidSaveModel >> onClass [
	classSide := true
]

{ #category : #testing }
PyramidSaveModel >> onInstance [

	classSide := false
]

{ #category : #accessing }
PyramidSaveModel >> project [

	^ project
]

{ #category : #accessing }
PyramidSaveModel >> project: anObject [

	project := anObject
]

{ #category : #accessing }
PyramidSaveModel >> savingClassName [

	savingClassName ifNil: [ savingClassName := '' ].
	^ savingClassName
]

{ #category : #accessing }
PyramidSaveModel >> savingClassName: anObject [

	savingClassName := anObject
]

{ #category : #accessing }
PyramidSaveModel >> savingMethodName [

	savingMethodName ifNil: [ savingMethodName := '' ].
	^ savingMethodName
]

{ #category : #accessing }
PyramidSaveModel >> savingMethodName: anObject [

	savingMethodName := anObject
]

{ #category : #accessing }
PyramidSaveModel >> savingPackageName [

	savingPackageName ifNil: [ savingPackageName := '' ].
	^ savingPackageName
]

{ #category : #accessing }
PyramidSaveModel >> savingPackageName: anObject [

	savingPackageName := anObject
]
