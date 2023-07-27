Class {
	#name : #PyramidSaveModel,
	#superclass : #Object,
	#instVars : [
		'savingClassName',
		'savingMethodName',
		'savingPackageName',
		'classSide',
		'projectModel'
	],
	#category : #'Pyramid-plugin-save'
}

{ #category : #converting }
PyramidSaveModel >> asTitleString [
	| string |
	string := '[', self savingClassName ,'] '.
	self isClassSide ifTrue: [ string := string , 'class ' ].
	string := string , '>> ' , self savingMethodName.
	^ string
]

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
PyramidSaveModel >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidSaveModel >> projectModel: anObject [

	projectModel := anObject
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
