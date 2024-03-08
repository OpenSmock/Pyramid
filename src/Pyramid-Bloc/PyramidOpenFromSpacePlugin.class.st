Class {
	#name : #PyramidOpenFromSpacePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'extensions'
	],
	#category : #'Pyramid-Bloc-plugin-edit-on-running'
}

{ #category : #adding }
PyramidOpenFromSpacePlugin >> addExtension: anExtension [

	self extensions add: anExtension
]

{ #category : #accessing }
PyramidOpenFromSpacePlugin >> extensions [

	^ extensions
]

{ #category : #accessing }
PyramidOpenFromSpacePlugin >> initialize [

	extensions := OrderedCollection new.
]

{ #category : #adding }
PyramidOpenFromSpacePlugin >> removeExetension: anExtension [

	self extensions remove: anExtension
]
