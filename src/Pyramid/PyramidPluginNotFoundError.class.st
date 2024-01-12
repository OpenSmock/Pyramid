Class {
	#name : #PyramidPluginNotFoundError,
	#superclass : #PyramidError,
	#instVars : [
		'plugins',
		'querry'
	],
	#category : #'Pyramid-core'
}

{ #category : #accessing }
PyramidPluginNotFoundError >> plugins [

	^ plugins
]

{ #category : #accessing }
PyramidPluginNotFoundError >> plugins: anObject [

	plugins := anObject
]

{ #category : #accessing }
PyramidPluginNotFoundError >> querry [

	^ querry
]

{ #category : #accessing }
PyramidPluginNotFoundError >> querry: anObject [

	querry := anObject
]
