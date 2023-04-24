Class {
	#name : #PyramidPropertiesView,
	#superclass : #SpPresenter,
	#traits : 'TPyramidActiveProjectModelObserver',
	#classTraits : 'TPyramidActiveProjectModelObserver classTrait',
	#instVars : [
		'properties',
		'activeProject',
		'pipeline'
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

	self properties add: aProperty.
	aProperty pipeline: self pipeline.
	self pyramidSelectionChangedOnActiveProject
]

{ #category : #layout }
PyramidPropertiesView >> addProperty: aProperty onLayout: aLayout [

	| view inputModel |
	inputModel := aProperty inputBuilder build.
	inputModel elementInputSize > 0 ifFalse: [ ^ self ].
	view := PyramidPropertyInputView new
		        model: inputModel;
		        yourself.
	aLayout add: view expand: false.
	view updateView
]

{ #category : #layout }
PyramidPropertiesView >> defaultLayout [

	| defaultLayout |
	defaultLayout := SpBoxLayout newVertical
		                 spacing: 4;
		                 yourself.
	self properties do: [ :each |
		self addProperty: each onLayout: defaultLayout ].
	defaultLayout add: SpNullPresenter new expand: true.
	^ defaultLayout
]

{ #category : #accessing }
PyramidPropertiesView >> pipeline [ ^ pipeline
]

{ #category : #accessing }
PyramidPropertiesView >> pipeline: aPyramidPipeline [

	pipeline := aPyramidPipeline.
	self properties do: [ :each | each pipeline: aPyramidPipeline ].
]

{ #category : #accessing }
PyramidPropertiesView >> properties [

	properties ifNil: [ properties := OrderedCollection new ].
	^ properties
]

{ #category : #'as yet unclassified' }
PyramidPropertiesView >> pyramidSelectionChangedOnActiveProject [

	self properties do: [ :property |
		property updateTargetModelFrom:
			self activeProject selection elements ].
	self layout: self defaultLayout
]
