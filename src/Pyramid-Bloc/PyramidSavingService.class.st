Class {
	#name : #PyramidSavingService,
	#superclass : #Object,
	#instVars : [
		'methodBuilder',
		'saveModel',
		'verifier'
	],
	#category : #'Pyramid-Bloc-plugin-save'
}

{ #category : #testing }
PyramidSavingService >> canSave [
	"Verify:
	- savingModel is not nil
	- savingClassName is a valid class name
	- if savingClassName exist it should be in the savingPackageName
	"

	^ self verifier verify: self saveModel
]

{ #category : #'as yet unclassified' }
PyramidSavingService >> errorCannotSave [

	PyramidSaveError signal: 'Cannot save with given model. Check canSave method to more explenation.'
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

	class := self saveModel isClassSide
		         ifTrue: [ self savingClass classSide ]
		         ifFalse: [ self savingClass ].

	self methodBuilder classifier
		ifNil: [ class compile: self savingMethod ]
		ifNotNil: [
			class
				compile: self savingMethod
				classified: self methodBuilder classifier ]
]

{ #category : #accessing }
PyramidSavingService >> saveModel [

	^ saveModel
]

{ #category : #accessing }
PyramidSavingService >> saveModel: anObject [

	saveModel := anObject
]

{ #category : #tests }
PyramidSavingService >> savingClass [

	| class |
	class := self class environment classNamed:
		         self saveModel savingClassName.
	class ifNotNil: [ ^ class ].
	^ self class classInstaller make: [ :aClassBuilder |
		  aClassBuilder
			  name: self saveModel savingClassName;
			  package: self saveModel savingPackageName ]
]

{ #category : #tests }
PyramidSavingService >> savingMethod [

	^ self methodBuilder build: self saveModel
]

{ #category : #accessing }
PyramidSavingService >> verifier [

	verifier ifNil: [ verifier := PyramidSaveModelVerifier verifierNoError ].
	^ verifier
]

{ #category : #accessing }
PyramidSavingService >> verifier: aVerifier [

	verifier := aVerifier
]
