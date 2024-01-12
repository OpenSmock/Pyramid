Class {
	#name : #PyramidFakePluginThatCannotBeBuilt,
	#superclass : #PyramidFakePlugin,
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #actions }
PyramidFakePluginThatCannotBeBuilt >> configureBuilder: aPyramidEditorBuilder [

	super configureBuilder: aPyramidEditorBuilder.
	aPyramidEditorBuilder doNotBuildWith: self because: PyramidError new
]
