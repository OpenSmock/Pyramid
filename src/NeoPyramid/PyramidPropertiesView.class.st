Class {
	#name : #PyramidPropertiesView,
	#superclass : #SpPresenter,
	#traits : 'TPyramidActiveProjectModelObserver',
	#classTraits : 'TPyramidActiveProjectModelObserver classTrait',
	#instVars : [
		'properties',
		'activeProject'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertiesView >> activeProject [
	^ activeProject
]

{ #category : #accessing }
PyramidPropertiesView >> activeProject: anObject [

	activeProject := anObject
]

{ #category : #layout }
PyramidPropertiesView >> defaultLayout [

	| defaultLayout |
	defaultLayout := SpBoxLayout newVertical
		                 spacing: 4;
		                 yourself.
	self properties do: [ :each |
		defaultLayout add: each presenter expand: false ].
defaultLayout add: SpNullPresenter new expand: true.
	^ defaultLayout
]

{ #category : #accessing }
PyramidPropertiesView >> properties [

	properties ifNil: [ properties := { PyramidProperty identifier }].
	^ properties
]

{ #category : #'as yet unclassified' }
PyramidPropertiesView >> pyramidSelectionChangedOnActiveProject [

	self properties do: [ :each |
		each updateModelFrom: self activeProject selection elements ]
]
