Class {
	#name : #PyramidPropertiesView,
	#superclass : #SpPresenter,
	#traits : 'TPyramidActiveProjectModelObserver + TPyramidPipelineObserver',
	#classTraits : 'TPyramidActiveProjectModelObserver classTrait + TPyramidPipelineObserver classTrait',
	#instVars : [
		'properties',
		'activeProject',
		'pipeline',
		'propertyViews',
		'propertylayout'
	],
	#category : #'Pyramid-properties'
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

	| view |
	(self properties anySatisfy: [ :each | each = aProperty ]) ifTrue: [
		^ self ].
	self properties add: aProperty.
	aProperty pipeline: self pipeline.

	view := PyramidPropertyInputView new
		        property: aProperty;
		        propertiesView: self;
		        yourself.
	aProperty addObserver: view
]

{ #category : #layout }
PyramidPropertiesView >> defaultLayout [

	propertylayout := SpBoxLayout newVertical
		                  spacing: 4;
								add: (SpLabelPresenter new label: ''; yourself)
		                  yourself.
	^ SpScrollableLayout new
		  child: propertylayout;
		  yourself
]

{ #category : #showing }
PyramidPropertiesView >> hide: aPresenter [

	self propertyViews remove: aPresenter ifAbsent: [].
	self updateLayout
]

{ #category : #accessing }
PyramidPropertiesView >> pipeline [ ^ pipeline
]

{ #category : #accessing }
PyramidPropertiesView >> pipeline: aPyramidPipeline [

	pipeline := aPyramidPipeline.
	aPyramidPipeline addObserver: self.
	self properties do: [ :each | each pipeline: aPyramidPipeline ]
]

{ #category : #accessing }
PyramidPropertiesView >> properties [

	properties ifNil: [ properties := OrderedCollection new ].
	^ properties
]

{ #category : #accessing }
PyramidPropertiesView >> propertyViews [

	propertyViews ifNil: [ propertyViews := Set new ].
	^ propertyViews
]

{ #category : #accessing }
PyramidPropertiesView >> propertyViews: aCollection [
	propertyViews:= aCollection
]

{ #category : #accessing }
PyramidPropertiesView >> propertylayout [
^ propertylayout
]

{ #category : #'as yet unclassified' }
PyramidPropertiesView >> pyramidPipelineTerminateCommand [

	"self updatePropertyViews"
]

{ #category : #'as yet unclassified' }
PyramidPropertiesView >> pyramidSelectionChangedOnActiveProject [

	self updatePropertyViews
]

{ #category : #showing }
PyramidPropertiesView >> show: aPresenter [

	self propertyViews add: aPresenter.
	self updateLayout
]

{ #category : #private }
PyramidPropertiesView >> updateLayout [

	self propertylayout ifNil: [ ^ self ].
	self propertylayout removeAll.
	self propertyViews do: [ :each | self propertylayout add: each expand: false ].
	self propertylayout add: SpNullPresenter new expand: true
]

{ #category : #'as yet unclassified' }
PyramidPropertiesView >> updatePropertyViews [

	self propertyViews do: [ :each | each hidePopover ].
	self properties do: [ :property |
		property makeNewInputsFor: self activeProject selection elements ]
]
