Class {
	#name : 'PyramidMultiplePluginsFoundError',
	#superclass : 'PyramidError',
	#instVars : [
		'plugins'
	],
	#category : 'Pyramid-core',
	#package : 'Pyramid',
	#tag : 'core'
}

{ #category : 'accessing' }
PyramidMultiplePluginsFoundError >> plugins [

	^ plugins
]

{ #category : 'accessing' }
PyramidMultiplePluginsFoundError >> plugins: anObject [

	plugins := anObject
]
