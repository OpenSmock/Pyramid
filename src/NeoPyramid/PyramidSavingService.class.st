Class {
	#name : #PyramidSavingService,
	#superclass : #Object,
	#instVars : [
		'methodBuilder',
		'savingModel',
		'verifier'
	],
	#category : #'NeoPyramid-plugin-save'
}

{ #category : #testing }
PyramidSavingService >> canSave [
	"Verify:
	- savingModel is not nil
	- savingClassName is a valid class name
	- if savingClassName exist it should be in the savingPackageName
	"

	^ self verifier verify: self savingModel.
	
]

{ #category : #'as yet unclassified' }
PyramidSavingService >> errorCannotSave [

	PyramidSaveError signal: 'Cannot save with given model. Check canSave method to more explenation.'
]

{ #category : #accessing }
PyramidSavingService >> initialize [

	verifier := PyramidSaveModelVerifier new
]

{ #category : #accessing }
PyramidSavingService >> methodBuilder [

	^ methodBuilder
]

{ #category : #accessing }
PyramidSavingService >> methodBuilder: anObject [

	methodBuilder := anObject
]

{ #category : #testing }
PyramidSavingService >> save [

	| class |
	self canSave ifFalse: [ self errorCannotSave ].

	class := self savingModel isClassSide
		         ifTrue: [ self savingClass classSide ]
		         ifFalse: [ self savingClass ].

	self methodBuilder classifier
		ifNil: [ class compile: self savingMethod ]
		ifNotNil: [
			class
				compile: self savingMethod
				classified: self methodBuilder classifier ]
]

{ #category : #tests }
PyramidSavingService >> savingClass [

	self class environment
		at: self savingModel savingClassName
		ifPresent: [ :class | ^ class ]
		ifAbsent: [
			^ self class classInstaller make: [ :aClassBuilder |
				aClassBuilder
					name: self savingModel savingClassName;
					package: self savingModel savingPackageName ] ]
]

{ #category : #tests }
PyramidSavingService >> savingMethod [

	^ self methodBuilder build: self savingModel
]

{ #category : #accessing }
PyramidSavingService >> savingModel [

	^ savingModel
]

{ #category : #accessing }
PyramidSavingService >> savingModel: anObject [

	savingModel := anObject
]

{ #category : #accessing }
PyramidSavingService >> verifier [

	^ verifier
]

{ #category : #accessing }
PyramidSavingService >> verifier: aVerifier [

	verifier := aVerifier
]
