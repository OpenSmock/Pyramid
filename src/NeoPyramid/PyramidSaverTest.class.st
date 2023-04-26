Class {
	#name : #PyramidSaverTest,
	#superclass : #TestCase,
	#instVars : [
		'savingClass',
		'saver',
		'serializer'
	],
	#category : #'NeoPyramid-plugin-save'
}

{ #category : #'as yet unclassified' }
PyramidSaverTest >> makeActiveProject: aCollection [

	| activeProject |
	activeProject := PyramidActiveProjectModel new .
	activeProject roots
		  addAll: aCollection.
		^ activeProject
]

{ #category : #tests }
PyramidSaverTest >> saver [
^ saver
]

{ #category : #tests }
PyramidSaverTest >> savingClass [

	^ savingClass
]

{ #category : #running }
PyramidSaverTest >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"

	serializer := PyramidSerializer new
		              pragmaName: #TEST;
		              classifierName: #'serialized-testing';
		comment:
				   'This class has been automaticly generated.';
		              serializeBlock: [ :roots |
			              Character space join: roots ];
		              yourself.
	saver := PyramidSaver new
		         serializer: serializer;
		         yourself.
	savingClass := self class classInstaller make: [ :aClassBuilder |
		               aClassBuilder
			               name: 'PyramidSaveTestMySavingClass';
			               package: self class category ]
]

{ #category : #running }
PyramidSaverTest >> tearDown [

	savingClass ifNotNil: [ savingClass removeFromSystem ].

	super tearDown
]

{ #category : #tests }
PyramidSaverTest >> testCanSave [
	"Test:
	
	Make a PyramidSave.
	Deny canSave
	Set args
	Assert canSave"

	self deny: self saver canSave.
	self saver saveClass: self savingClass.
	self saver methodName: #''.
	self saver activeProject: (self makeActiveProject: { 'hello'. 'world' }).
	self deny: self saver canSave.
	self saver methodName: #test.
	self assert: self saver canSave
]

{ #category : #tests }
PyramidSaverTest >> testErrorCannotSave [
	"Test:
	
	Make a saver without all elements set.
	Save on new class.
	should raise error"

	self should: [self saver save] raise: PyramidSaverError
	
]

{ #category : #tests }
PyramidSaverTest >> testOnClass [
	"Test:
	
	Make a saver.
	Set save on class.
	Save on new class.
	Deny selector on instance side.
	Assert selector on class side"

	self saver saveClass: self savingClass.
	self saver activeProject: (self makeActiveProject: { 'hello'. 'world' }).
	self saver methodName: #test.
	self saver onClass.
	self saver save.
	self deny: (self savingClass instanceSide canUnderstand: #test).
	self assert: (self savingClass classSide canUnderstand: #test)
]

{ #category : #tests }
PyramidSaverTest >> testOnInstance [
	"Test:
	
	Make a saver.
	Set save on instance.
	Save on new class.
	Deny selector on class side.
	Assert selector on instance side"

	self saver saveClass: self savingClass.
	self saver activeProject: (self makeActiveProject: { 'hello'. 'world' }).
	self saver methodName: #test.
	self saver onInstance.
	self saver save.
	self deny: (self savingClass classSide canUnderstand: #test).
	self assert: (self savingClass instanceSide canUnderstand: #test)
]

{ #category : #tests }
PyramidSaverTest >> testSave [
	"Test:
	
	Make a saver.
	Set save on class.
	Save on new class.
	assert selector is expected string"

	self saver saveClass: self savingClass.
	self saver activeProject:
		(self makeActiveProject: { 'hello'. 'world' }).
	self saver methodName: #test.
	self saver onClass.
	self saver save.
	self assert: self savingClass test equals: 'hello world'
]
