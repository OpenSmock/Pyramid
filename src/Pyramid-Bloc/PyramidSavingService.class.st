Class {
	#name : #PyramidSavingService,
	#superclass : #Object,
	#instVars : [
		'saveModel',
		'verifier'
	],
	#classInstVars : [
		'currentMethodBuilder',
		'stash',
		'ston',
		'currentMethodBuilderSelector'
	],
	#category : #'Pyramid-Bloc-plugin-save'
}

{ #category : #'as yet unclassified' }
PyramidSavingService class >> allSaveMethodBuilders [

	^ (Pragma allNamed: #pyramidSaveMethodBuilder:) collect: [ :pragma | pragma arguments first -> pragma methodSelector ]

	
]

{ #category : #'as yet unclassified' }
PyramidSavingService class >> currentMethodBuilder [

	^ self perform: self currentMethodBuilderSelector
]

{ #category : #accessing }
PyramidSavingService class >> currentMethodBuilderSelector [

	currentMethodBuilderSelector ifNil: [ currentMethodBuilderSelector := #stash ].
	^ currentMethodBuilderSelector
]

{ #category : #accessing }
PyramidSavingService class >> currentMethodBuilderSelector: anObject [

	currentMethodBuilderSelector := anObject
]

{ #category : #'as yet unclassified' }
PyramidSavingService class >> saveMethodBuilderSettingOn: aBuilder [

	<systemsettings>
	(aBuilder pickOne: #currentMethodBuilderSelector)
		parent: #pyramid;
		label: 'Select the serialization format';
		target: self;
		default: #stash;
		domainValues: self allSaveMethodBuilders;
		description:
			'Change the serialization format when saving a project.'
]

{ #category : #'as yet unclassified' }
PyramidSavingService class >> stash [

	<pyramidSaveMethodBuilder: 'Serialize as Source Code'>
	^ PyramidSavingMethodBuilder new
		         classifier: #'pyramid-serialized-bloc';
		         comment: [
			         'This class has been generated using Pyramid.<r><r><t>By: <1s><r><t><2s> <3s>'
				         expandMacrosWith: ''
				         with: Date today yyyymmdd
				         with: Time now print24 ];
		         pragma: 'pyStash';
		         serializeBlock: [ :collection |
			         '[ <1s> ] value' expandMacrosWith:
					         (BlStashSerializer serialize: collection) ];
		         yourself
]

{ #category : #'as yet unclassified' }
PyramidSavingService class >> ston [

	<pyramidSaveMethodBuilder: 'Serialize as STON object'>
	^ PyramidSavingMethodBuilder new
		        classifier: #'pyramid-serialized-bloc';
		        comment: [
			        'This class has been generated using Pyramid.<r><r><t>By: <1s><r><t><2s> <3s>'
				        expandMacrosWith: ''
				         with: Date today yyyymmdd
				         with: Time now print24 ];
		        pragma: 'pySTON';
		        serializeBlock: [ :collection |
			        '<1p>' expandMacrosWith:
					        (BlStonSerializer serialize: collection) ];
		        yourself
]

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

	^ self class currentMethodBuilder
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
