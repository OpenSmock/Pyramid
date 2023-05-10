Class {
	#name : #PyramidPropertiesView,
	#superclass : #SpPresenter,
	#traits : 'TPyramidActiveProjectModelObserver',
	#classTraits : 'TPyramidActiveProjectModelObserver classTrait',
	#instVars : [
		'properties',
		'activeProject',
		'pipeline',
		'propertyViews'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertiesView >> activeProject [
	^ activeProject
]

{ #category : #accessing }
PyramidPropertiesView >> activeProject: anObject [

	activeProject := anObject.
	anObject addObserver: self
]

{ #category : #accessing }
PyramidPropertiesView >> addProperty: aProperty [

	(self properties anySatisfy: [ :each | each = aProperty ]) ifTrue: [
		^ self ].
	self properties add: aProperty.
	aProperty pipeline: self pipeline
]

{ #category : #layout }
PyramidPropertiesView >> defaultLayout [

	| defaultLayout |
	defaultLayout := SpBoxLayout newVertical
		                 spacing: 4;
		                 yourself.
	self propertyViews do: [ :each |
			defaultLayout add: each expand: false ].
	^ defaultLayout
]

{ #category : #accessing }
PyramidPropertiesView >> pipeline [ ^ pipeline
]

{ #category : #accessing }
PyramidPropertiesView >> pipeline: aPyramidPipeline [

	pipeline := aPyramidPipeline.
	self properties do: [ :each | each pipeline: aPyramidPipeline ]
]

{ #category : #accessing }
PyramidPropertiesView >> properties [

	properties ifNil: [ properties := OrderedCollection new ].
	^ properties
]

{ #category : #accessing }
PyramidPropertiesView >> propertyViews [

	propertyViews ifNil: [ propertyViews := {  } ].
	^ propertyViews
]

{ #category : #accessing }
PyramidPropertiesView >> propertyViews: aCollection [
	propertyViews:= aCollection
]

{ #category : #'as yet unclassified' }
PyramidPropertiesView >> pyramidSelectionChangedOnActiveProject [

	self propertyViews do: [ :each | each hidePopover ].
	self updatePropertyViews
]

{ #category : #'as yet unclassified' }
PyramidPropertiesView >> updatePropertyViews [

	| inputModels |
	inputModels := self properties collect: [ :property |
		               property makeNewInputsFor:
			               self activeProject selection elements.
			property inputsModel ].
	self layout removeAll.
	self propertyViews: (inputModels
			 select: [ :each | each elementInputSize > 0 ]
			 thenCollect: [ :each |
				 | view |
				 view := PyramidPropertyInputView new
					         model: each;
					         updateView;
					         yourself.
				 self layout add: view expand: false.
				 view ])
]
