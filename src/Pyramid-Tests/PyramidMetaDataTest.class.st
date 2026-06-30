Class {
	#name : #PyramidMetaDataTest,
	#superclass : #TestCase,
	#instVars : [
		'testClass',
		'service'
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
]

{ #category : #running }
PyramidMetaDataTest >> tearDown [
    testClass ifNotNil: [ testClass removeFromSystem ].
    PyramidSavingService currentProjectWindowSize: nil.
]

{ #category : #tests }
PyramidMetaDataTest >> testBuildMetaDataMethod [
    | service saveModel result |
    saveModel := PyramidSaveModel new
        savingMethodName: 'testInterface';
        yourself.
    service := PyramidSavingService new
        saveModel: saveModel;
        yourself.
    result := service buildMetaDataMethod.
    self assert: (result includesSubstring: 'testInterfaceMetaData').
    self assert: (result includesSubstring: 'pyMetaData').
    self assert: (result includesSubstring: 'PyramidSavingService currentProjectWindowSize:')
]

{ #category : #tests }
PyramidMetaDataTest >> testMetaDataSetsWindowSize [

	| expectedSize metaDataSelector |
	"1. Fixe la taille courante dans Pyramid"
	expectedSize := PyramidMainExtension currentGridWindowSize.

	"2. Génère et compile la méthode metaData via saveMetaData"
	service saveMetaData.

	"3. Performe la méthode générée comme le ferait openOn:saveModel:"
	metaDataSelector := (#testInterface , 'MetaData') asSymbol.
	testClass perform: metaDataSelector.

	"4. Vérifie que la taille lue est bien celle qui était dans Pyramid"
	self
		assert: PyramidSavingService currentProjectWindowSize
		equals: expectedSize
]
