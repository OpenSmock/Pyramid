Class {
	#name : 'PyramidFakePluginThatShouldNotBeInstalled',
	#superclass : 'PyramidFakePlugin',
	#category : 'Pyramid-Tests-cases-core',
	#package : 'Pyramid-Tests',
	#tag : 'cases-core'
}

{ #category : 'asserting' }
PyramidFakePluginThatShouldNotBeInstalled class >> shouldInstall [

	^ false
]
