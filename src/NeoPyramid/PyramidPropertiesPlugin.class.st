Class {
	#name : #PyramidPropertiesPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'manager'
	],
	#category : #'NeoPyramid-property'
}

{ #category : #'class initialization' }
PyramidPropertiesPlugin class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #adding }
PyramidPropertiesPlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self manager presenter
			label: 'Manager'
			icon: (self iconNamed: #box)
			order: 2 ]
]

{ #category : #'as yet unclassified' }
PyramidPropertiesPlugin >> connectOn: aPyramidEditor [

	self manager projectModel: aPyramidEditor projectModel
]

{ #category : #initialization }
PyramidPropertiesPlugin >> initialize [

	manager := PyramidPropertiesManagerForSelection new.
	manager addProperty: (NeoPyramidProperty new
			 name: 'Element ID';
			 command: NeoPyramidElementIdCommand new;
			 pyramidInputPresenterClass: PyramidTextInputPresenter;
			 yourself)
]

{ #category : #accessing }
PyramidPropertiesPlugin >> manager [

	^ manager
]

{ #category : #accessing }
PyramidPropertiesPlugin >> manager: anObject [

	manager := anObject
]
