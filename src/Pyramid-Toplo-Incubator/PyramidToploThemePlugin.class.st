Class {
	#name : #PyramidToploThemePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'themePresenter'
	],
	#category : #'Pyramid-Toplo-Incubator'
}

{ #category : #adding }
PyramidToploThemePlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self themePresenter
			label: 'Toplo-Theme'
			icon: (self iconNamed: #smallPushpin)
			order: 1 ]
]

{ #category : #connecting }
PyramidToploThemePlugin >> connectOn: aPyramidEditor [

	self themePresenter projectModel: aPyramidEditor projectModel 

	
]

{ #category : #initialization }
PyramidToploThemePlugin >> initialize [

	themePresenter := PyramidThemeSelectorPresenter new.
]

{ #category : #accessing }
PyramidToploThemePlugin >> themePresenter [

	^ themePresenter
]
