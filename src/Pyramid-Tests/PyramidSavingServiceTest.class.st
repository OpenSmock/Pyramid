Class {
	#name : #PyramidSavingServiceTest,
	#superclass : #TestCase,
	#instVars : [
		'methodBuilder',
		'savingService',
		'savingClass'
	],
	#category : #'Pyramid-Tests-Cases'
}

{ #category : #running }
PyramidSavingServiceTest >> savingClass [

	^ savingClass
]

{ #category : #running }
PyramidSavingServiceTest >> savingService [

	^ savingService
]

{ #category : #running }
PyramidSavingServiceTest >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"

	methodBuilder := PyramidSavingMethodBuilder new
		                 classifier: #'pyramid-serialized-bloc';
		                 serializeBlock: [ :collection | 'test' ];
		                 yourself.

	savingService := PyramidSavingService new
		                 methodBuilder: methodBuilder;
		                 yourself.

	savingClass := self class classInstaller make: [ :aClassBuilder |
		               aClassBuilder
			               name: 'PyramidSaveTestMySavingClass';
			               package: self class category ]
]

{ #category : #running }
PyramidSavingServiceTest >> tearDown [

	savingClass ifNotNil: [ savingClass removeFromSystem ].

	super tearDown
]

{ #category : #tests }
PyramidSavingServiceTest >> testCanSave [
	"Test:
	
	Make a PyramidSave.
	Deny canSave
	Set args
	Assert canSave"

	| model |
	self deny: self savingService canSave.

	model := PyramidSaveModel new.
	self savingService savingModel: model.
	self deny: self savingService canSave.

	model project: PyramidProjectModel new.
	self deny: self savingService canSave.

	model savingClassName: 'errorPyramidSavingClass'.
	model savingMethodName: 'aPyramidSavingMethod'.
	model savingPackageName: 'PyramidSavingPackage'.
	self deny: self savingService canSave.

	model savingClassName: 'PyramidSavingClass'.
	model savingMethodName: 'Error Pyramid Saving Method'.
	model savingPackageName: 'PyramidSavingPackage'.
	self deny: self savingService canSave.

	model savingClassName: 'PyramidSavingClass'.
	model savingMethodName: 'aPyramidSavingMethod'.
	model savingPackageName: 'errorPyramidSavingPackage'.
	self deny: self savingService canSave.

	model savingClassName: 'PyramidSavingClass'.
	model savingMethodName: 'aPyramidSavingMethod'.
	model savingPackageName: 'PyramidSavingPackage'.
	self assert: self savingService canSave.

	model savingClassName: 'PyramidSavingClass'.
	model savingMethodName: 'aPyramidSavingMethod'.
	model savingPackageName: 'PyramidSavingPackage-abc'.
	self deny: self savingService canSave.

	model savingClassName: 'PyramidSavingClass'.
	model savingMethodName: 'aPyramidSavingMethod'.
	model savingPackageName: 'PyramidSavingPackage-Abc-Def'.
	self assert: self savingService canSave.

	model savingClassName: self savingClass name.
	model savingMethodName: 'aPyramidSavingMethod'.
	model savingPackageName: self savingClass package name.
	self assert: self savingService canSave.

	model savingClassName: self savingClass name.
	model savingMethodName: 'aPyramidSavingMethod'.
	model savingPackageName: self savingClass package name , 'notTheSame'.
	self deny: self savingService canSave
]

{ #category : #tests }
PyramidSavingServiceTest >> testErrorCannotSave [
	"Test:
	
	Make a saver without all elements set.
	Save on new class.
	should raise error"

	self should: [ self savingService save ] raise: PyramidSaveError
]

{ #category : #tests }
PyramidSavingServiceTest >> testSave [
	"Test:

	Save on class side.
	Assert the method is present class side.
	Save on instance side.
	Assert the method is present instance side."

	| model |
	model := PyramidSaveModel new.
	model project: PyramidProjectModel new.
	model savingClassName: self savingClass name.
	model savingPackageName: self savingClass package name.
	self savingService savingModel: model.

	self deny: (self savingClass classSide canUnderstand: #classMethod).
	self deny:
		(self savingClass instanceSide canUnderstand: #classMethod).
	self deny:
		(self savingClass classSide canUnderstand: #instanceMethod).
	self deny:
		(self savingClass instanceSide canUnderstand: #instanceMethod).

	model onClass.
	model savingMethodName: 'classMethod'.
	self savingService save.
	self assert: (self savingClass classSide canUnderstand: #classMethod).
	self deny:
		(self savingClass instanceSide canUnderstand: #classMethod).

	model onInstance.
	model savingMethodName: 'instanceMethod'.
	self savingService save.
	self deny:
		(self savingClass classSide canUnderstand: #instanceMethod).
	self assert:
		(self savingClass instanceSide canUnderstand: #instanceMethod)
]

{ #category : #tests }
PyramidSavingServiceTest >> testSavingClass [
	"Test:
	
	assert equals saving class of an existing class.
	assert new class is created for a not existing class."

	| model |
	model := PyramidSaveModel new.
	self savingService savingModel: model.

	model project: PyramidProjectModel new.
	model savingClassName: self savingClass name.
	model savingMethodName: 'aPyramidSavingMethod'.
	model savingPackageName: self savingClass package name.
	self assert: self savingClass equals: self savingService savingClass.

	model savingClassName: 'PyramidSaveTestMyOtherSavingClass'.
	self class environment
		at: #PyramidSaveTestMyOtherSavingClass
		ifPresent: [ self fail: 'The class already exist' ].
	self
		assert: self savingService savingClass name
		equals: 'PyramidSaveTestMyOtherSavingClass'.
	self class environment
		at: #PyramidSaveTestMyOtherSavingClass
		ifPresent: [ :class | class removeFromSystem ]
		ifAbsent: [ self fail: 'The class do not exist' ]
]

{ #category : #tests }
PyramidSavingServiceTest >> testSavingMethod [
	"Test:

	Try to save the correct method"

	| model |
	model := PyramidSaveModel new.
	self savingService savingModel: model.

	model project: PyramidProjectModel new.
	model savingClassName: self savingClass name.
	model savingMethodName: 'aPyramidSavingMethod'.
	model savingPackageName: self savingClass package name.
	self
		assert: self savingService savingMethod
		equals: 'aPyramidSavingMethod

	^ ''test'''
]
