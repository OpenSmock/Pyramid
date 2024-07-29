Class {
	#name : #PyramidNavigationPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'navigation'
	],
	#category : #'Pyramid-Bloc-plugin-navigation'
}

{ #category : #adding }
PyramidNavigationPlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabLeft addItem: [ :builder |
		builder
			makeTab: self navigation
			label: 'Navigation'
			icon: (Smalltalk ui icons iconNamed: #catalog)
			order: 2 ]
]

{ #category : #connecting }
PyramidNavigationPlugin >> connectOn: aPyramidEditor [

	self navigation editor: aPyramidEditor
]

{ #category : #initialization }
PyramidNavigationPlugin >> initialize [

	super initialize.
	navigation := PyramidNavigationPresenter new.
]

{ #category : #initialization }
PyramidNavigationPlugin >> navigation [

	^ navigation
]
