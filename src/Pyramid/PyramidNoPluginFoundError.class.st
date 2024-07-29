Class {
	#name : #PyramidNoPluginFoundError,
	#superclass : #PyramidError,
	#instVars : [
		'query'
	],
	#category : #'Pyramid-core'
}

{ #category : #accessing }
PyramidNoPluginFoundError >> query [

	^ query
]

{ #category : #accessing }
PyramidNoPluginFoundError >> query: anObject [

	query := anObject
]
