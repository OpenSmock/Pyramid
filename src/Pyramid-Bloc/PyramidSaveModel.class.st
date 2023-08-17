Class {
	#name : #PyramidSaveModel,
	#superclass : #Object,
	#instVars : [
		'savingClassName',
		'savingMethodName',
		'savingPackageName',
		'classSide',
		'isSaved',
		'projectModel'
	],
	#category : #'Pyramid-Bloc-plugin-save'
}

{ #category : #converting }
PyramidSaveModel >> asTitleString [

	| string |
	string := self savingClassName.
	self isClassSide ifTrue: [ string := string , 'class ' ].
	string := string , '>> #' , self savingMethodName.
	self isSaved ifFalse: [ string := string , ' *' ].
	^ string
]

{ #category : #converting }
PyramidSaveModel >> initialize [

	isSaved := false.
	classSide := true.
	savingPackageName := ''.
	savingClassName := ''.
	savingMethodName := ''
]

{ #category : #testing }
PyramidSaveModel >> isClassSide [

	^ classSide
]

{ #category : #converting }
PyramidSaveModel >> isSaved [
	^ isSaved
]

{ #category : #converting }
PyramidSaveModel >> isSaved: aBoolean [

	isSaved := aBoolean
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

	^ savingClassName
]

{ #category : #accessing }
PyramidSaveModel >> savingClassName: anObject [

	savingClassName := anObject
]

{ #category : #accessing }
PyramidSaveModel >> savingMethodName [

	^ savingMethodName
]

{ #category : #accessing }
PyramidSaveModel >> savingMethodName: anObject [

	savingMethodName := anObject
]

{ #category : #accessing }
PyramidSaveModel >> savingPackageName [

	^ savingPackageName
]

{ #category : #accessing }
PyramidSaveModel >> savingPackageName: anObject [

	savingPackageName := anObject
]
