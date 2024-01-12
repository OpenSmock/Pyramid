Class {
	#name : #PyramidSamePluginReference,
	#superclass : #PyramidError,
	#instVars : [
		'plugins',
		'ref'
	],
	#category : #'Pyramid-core'
}

{ #category : #accessing }
PyramidSamePluginReference >> plugins [

	^ plugins
]

{ #category : #accessing }
PyramidSamePluginReference >> plugins: anObject [

	plugins := anObject
]

{ #category : #accessing }
PyramidSamePluginReference >> ref [

	^ ref
]

{ #category : #accessing }
PyramidSamePluginReference >> ref: anObject [

	ref := anObject
]
