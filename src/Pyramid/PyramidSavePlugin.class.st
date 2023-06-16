Class {
	#name : #PyramidSavePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'inputsController',
		'inputsView',
		'saveModel',
		'inputsButton',
		'savingService',
		'saveButton',
		'activeProject',
		'inputsPopover'
	],
	#category : #'Pyramid-plugin-save'
}

{ #category : #'class initialization' }
PyramidSavePlugin class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #'instance creation' }
PyramidSavePlugin class >> openOn: aCollectionOfBlElement saveModel: aSaveModel [

	| editor savePlugin |
	editor := PyramidEditorBuilder makeEditor.
	savePlugin := editor plugins select: [ :each | each class = self ].
	savePlugin size = 1 ifFalse: [
		Error signal:
			'Wrong installation of SavePlugin. Should only be one instance.' ].
	savePlugin := savePlugin asArray first.
	savePlugin openOn: aSaveModel.
	editor activeProject roots addAll: aCollectionOfBlElement.
	editor view open
]

{ #category : #accessing }
PyramidSavePlugin >> activeProject [ ^activeProject
]

{ #category : #accessing }
PyramidSavePlugin >> activeProject: anObject [

	activeProject := anObject.
	self saveModel project: activeProject.
	self inputsController updateView
]

{ #category : #adding }
PyramidSavePlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow
		at: #topLeft
		addItem: [ :builder |
		builder makeButtonWithIcon: self saveButton order: 1 ].
	aPyramidSimpleWindow
		at: #topLeft
		addItem: [ :builder |
		builder makeButtonWithIcon: self inputsButton order: 2 ]
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

	inputsButton := SpButtonPresenter new
		                icon: (self iconNamed: #smallRemoteOpen);
		                action: [ inputsPopover popup ]; yourself.
	inputsPopover := PyramidPopoverFactory
		                 makeWithPresenter: inputsView
		                 relativeTo: inputsButton
		                 position: SpPopoverPosition right.

	saveButton := SpButtonPresenter new
		              icon: (self iconNamed: #smallSave);
		              action: [ self saveAction ];
			           yourself.
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

{ #category : #'instance creation' }
PyramidSavePlugin >> openOn: aSaveModel [

	self inputsView inputClass text: aSaveModel savingClassName.
	self inputsView inputMethod text: aSaveModel savingMethodName.
	self inputsView inputPackage text: aSaveModel savingPackageName
]

{ #category : #actions }
PyramidSavePlugin >> saveAction [ 
	"Action executed by save button"

	[ self savingService save ] 
	on: PyramidSaveError do: [
		^ UIManager default alert: 'Cannot save the project, check project properties before.' title: 'Error'.
	]. 
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
