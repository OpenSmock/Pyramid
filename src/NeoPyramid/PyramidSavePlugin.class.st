Class {
	#name : #PyramidSavePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin + TPyramidActiveProjectModelObserver',
	#classTraits : 'TPyramidPlugin classTrait + TPyramidActiveProjectModelObserver classTrait',
	#instVars : [
		'inputsController',
		'inputsView',
		'saveModel',
		'inputsButton',
		'savingService',
		'saveButton',
		'activeProject'
	],
	#category : #'NeoPyramid-plugin-save'
}

{ #category : #'class initialization' }
PyramidSavePlugin class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #accessing }
PyramidSavePlugin >> activeProject [ ^activeProject
]

{ #category : #accessing }
PyramidSavePlugin >> activeProject: anObject [

	activeProject := anObject.
	self saveModel project: activeProject project.
	activeProject addObserver: self.
	self inputsController updateView
]

{ #category : #'as yet unclassified' }
PyramidSavePlugin >> buildViewFrom: aPyramidGlobalViewBuilder [

	aPyramidGlobalViewBuilder model tools add: self saveButton.
	aPyramidGlobalViewBuilder model tools add: self inputsButton
]

{ #category : #'as yet unclassified' }
PyramidSavePlugin >> connectOn: aPyramidEditor [

	self activeProject: aPyramidEditor activeProject
]

{ #category : #initialization }
PyramidSavePlugin >> initialize [

	inputsController := PyramidSaveInputsController new.
	inputsView := inputsController view.
	saveModel := inputsController model.

	savingService := PyramidSavingService new
		                 savingModel: saveModel;
		                 methodBuilder: PyramidSavingMethodBuilder ston;
		                 yourself.

	inputsButton := PyramidButtonWithPopover new
		                icon: (self iconNamed: #add);
		                presenter: self inputsView;
		                 alignCenter;
		              order: 30;
		                yourself.
	saveButton := PyramidButton new
		              icon: (self iconNamed: #solidMenu);
		              alignCenter;
		              order: 31;
		              callback: [ self savingService save ];
		              yourself
]

{ #category : #accessing }
PyramidSavePlugin >> inputsButton [

	^ inputsButton
]

{ #category : #accessing }
PyramidSavePlugin >> inputsController [

	^ inputsController
]

{ #category : #accessing }
PyramidSavePlugin >> inputsView [

	^ inputsView
]

{ #category : #'as yet unclassified' }
PyramidSavePlugin >> pyramidActiveProjectChanged [

	self saveModel project: self activeProject project
]

{ #category : #accessing }
PyramidSavePlugin >> saveButton [

	^ saveButton
]

{ #category : #accessing }
PyramidSavePlugin >> saveModel [

	^ saveModel
]

{ #category : #accessing }
PyramidSavePlugin >> savingService [

	^ savingService
]
