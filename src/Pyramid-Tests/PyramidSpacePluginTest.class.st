Class {
	#name : #PyramidSpacePluginTest,
	#superclass : #TestCase,
	#category : 'Pyramid-Tests-cases-plugin-space'
}

{ #category : #tests }
PyramidSpacePluginTest >> testResetSpace [

	| plugin space |
	plugin := PyramidSpacePlugin new.
	plugin resetSpace.
	self
		assert: plugin morphicPresenter morph
		equals: plugin builder space host containerMorph.

	space := plugin builder space.
	plugin resetSpace.
	self
		assert: plugin morphicPresenter morph
		equals: plugin builder space host containerMorph.
	self deny: plugin builder space equals: space
]
