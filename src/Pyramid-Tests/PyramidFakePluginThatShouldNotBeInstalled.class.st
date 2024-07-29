Class {
	#name : #PyramidFakePluginThatShouldNotBeInstalled,
	#superclass : #PyramidFakePlugin,
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #asserting }
PyramidFakePluginThatShouldNotBeInstalled class >> shouldInstall [

	^ false
]
