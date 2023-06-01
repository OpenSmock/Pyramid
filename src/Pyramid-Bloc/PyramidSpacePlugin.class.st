Class {
	#name : #PyramidSpacePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'extensions',
		'overlaysManager'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #adding }
PyramidSpacePlugin >> addPanelsOn: aPyramidSimpleWindow [

	self extensions do: [ :each | each addPanelsOn: aPyramidSimpleWindow ].
]

{ #category : #actions }
PyramidSpacePlugin >> configureBuilder: aPyramidBuilder [

	self extensions do: [ :each | each installOnSpacePlugin: self ].
	self extensions do: [ :each | each configureBuilder: aPyramidBuilder ].
]

{ #category : #'as yet unclassified' }
PyramidSpacePlugin >> connectOn: aPyramidEditor [

	self extensions do: [ :each | each connectOn: aPyramidEditor ]
]

{ #category : #accessing }
PyramidSpacePlugin >> extensions [
^ extensions
]

{ #category : #initialization }
PyramidSpacePlugin >> initialize [

	extensions := OrderedCollection new.
	overlaysManager := PyramidOverlaysManager new.
]

{ #category : #accessing }
PyramidSpacePlugin >> overlaysManager [
^ overlaysManager
]
