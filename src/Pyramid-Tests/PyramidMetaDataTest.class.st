Class {
	#name : #PyramidMetaDataTest,
	#superclass : #TestCase,
	#instVars : [
		'testClass',
		'service',
		'mainExtension'
	],
	#category : #'Pyramid-Tests-cases-MetaData'
}

{ #category : #running }
PyramidMetaDataTest >> setUp [

	testClass := self class classInstaller make: [ :aClassBuilder |
			             aClassBuilder
				             name: 'PyramidMetaDataTestClass';
				             package: 'Pyramid-Tests-cases-plugin-save' ].
	service := PyramidSavingService new
		           saveModel: (PyramidSaveModel new
				            savingMethodName: 'testInterface';
				            savingClassName: 'PyramidMetaDataTestClass';
				            savingPackageName: 'Pyramid-Tests-cases-plugin-save';
				            projectModel: PyramidProjectModel new;
				            yourself);
		           yourself.
	mainExtension := PyramidMainExtension new.
		
]

{ #category : #running }
PyramidMetaDataTest >> tearDown [

	testClass ifNotNil: [ testClass removeFromSystem ].
	PyramidSavingService currentProjectMetaData: nil.
	mainExtension initialize.
	
]

{ #category : #accessing }
PyramidMetaDataTest >> testMainExtensionDefaultValues [

	self
		assert: mainExtension class currentGridWindowSize
		equals: 800 @ 600.
	self assert: mainExtension class currentGridSpacing equals: 10.
	self deny: mainExtension class currentGridVisibility.
	self
		assert: mainExtension class currentGridColor
		equals: Color black
]

{ #category : #tests }
PyramidMetaDataTest >> testMetaDataPropertiesFiltering [

	mainExtension class currentGridVisibility: true.
	mainExtension class currentGridSpacing: 20.
	service saveMetaData.
	testClass perform: #testInterfaceMetaData.
	self
		deny:
		(PyramidSavingService currentProjectMetaData includesKey: #windowSize).
	self assert:
		(PyramidSavingService currentProjectMetaData at: #gridVisibility).
	self
		assert:
		(PyramidSavingService currentProjectMetaData at: #gridSpacing)
		equals: 20.
	self
		deny: (PyramidSavingService currentProjectMetaData includesKey: #gridColor)
]

{ #category : #tests }
PyramidMetaDataTest >> testMetaDataSetProperties [

	mainExtension class currentGridWindowSize: 500@500.
	mainExtension class currentGridVisibility: true.
	mainExtension class currentGridSpacing: 20.
	mainExtension class currentGridColor: Color blue.
	service saveMetaData.
	testClass perform: #testInterfaceMetaData.
	self
		assert:
		(PyramidSavingService currentProjectMetaData at: #windowSize) equals: 500@500.
	self assert:
		(PyramidSavingService currentProjectMetaData at: #gridVisibility).
	self
		assert:
		(PyramidSavingService currentProjectMetaData at: #gridSpacing)
		equals: 20.
	self
		assert: (PyramidSavingService currentProjectMetaData at: #gridColor) equals: Color blue
]

{ #category : #tests }
PyramidMetaDataTest >> testSaveMetaDataCreateDeleteMethod [

	mainExtension class currentGridWindowSize: 500 @ 300.
	
	service saveMetaData.
	
	self assert: (testClass classSide canUnderstand: #testInterfaceMetaData).
	mainExtension class currentGridWindowSize: 800 @ 600.
	mainExtension class currentGridVisibility: false.
	mainExtension class currentGridSpacing: 10.
	service saveMetaData.
	self deny: (testClass classSide canUnderstand: #testInterfaceMetaData)
]
