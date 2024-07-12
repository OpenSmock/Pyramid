Class {
	#name : 'PyramidSavePlugin',
	#superclass : 'Object',
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'inputsController',
		'inputsView',
		'saveModel',
		'inputsButton',
		'savingService',
		'saveButton',
		'projectModel'
	],
	#category : 'Pyramid-Bloc-plugin-save',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-save'
}

{ #category : 'instance creation' }
PyramidSavePlugin class >> openOn: aCollectionOfBlElement saveModel: aSaveModel [

	| editor savePlugin |
	editor := PyramidEditor buildEditor.
	savePlugin := editor plugins select: [ :each | each class = self ].
	savePlugin size = 1 ifFalse: [
		Error signal:
			'Wrong installation of SavePlugin. Should only be one instance.' ].
	savePlugin := savePlugin asArray first.
	editor projectModel firstLevelElements addAll: aCollectionOfBlElement.
	savePlugin openOn: aSaveModel.
	editor open
]

{ #category : 'adding' }
PyramidSavePlugin >> addPanelsOn: aPyramidSimpleWindow [

	self inputsController editorWindow: aPyramidSimpleWindow.

	aPyramidSimpleWindow
		at: #topLeft
		addItem: [ :builder |
		builder makeButtonWithIcon: self saveButton order: 1 ].
	aPyramidSimpleWindow
		at: #topLeft
		addItem: [ :builder |
		builder makeButtonWithIcon: self inputsButton order: 2 ]
]

{ #category : 'connecting' }
PyramidSavePlugin >> connectOn: aPyramidEditor [

	self projectModel: aPyramidEditor projectModel.
	self saveModel projectModel: aPyramidEditor projectModel.
	self inputsController projectModel: aPyramidEditor projectModel.
	
]

{ #category : 'initialization' }
PyramidSavePlugin >> initialize [

	inputsController := PyramidSaveProjectConfigurationController new.
	inputsView := inputsController view.
	saveModel := inputsController saveModel.

	savingService := PyramidSavingService new
		                 saveModel: saveModel;
		                 yourself.

	inputsButton := SpButtonPresenter new
		                icon: (Smalltalk ui icons iconNamed: #smallRemoteOpen);
		                help: 'Project configuration';
		                action: [
			                (PyramidPopoverFactory
				                 makeWithPresenter: inputsView
				                 relativeTo: inputsButton
				                 position: SpPopoverPosition right) popup ];
		                yourself.

	saveButton := SpButtonPresenter new
		              icon: (Smalltalk ui icons iconNamed: #smallSave);
		              help: 'Save project';
		              action: [ self saveAction ];
		              yourself
]

{ #category : 'accessing' }
PyramidSavePlugin >> inputsButton [

	^ inputsButton
]

{ #category : 'accessing' }
PyramidSavePlugin >> inputsController [

	^ inputsController
]

{ #category : 'accessing' }
PyramidSavePlugin >> inputsView [

	^ inputsView
]

{ #category : 'instance creation' }
PyramidSavePlugin >> openOn: aSaveModel [
	"self inputsView inputClass text: aSaveModel savingClassName.
	self inputsView inputMethod text: aSaveModel savingMethodName.
	self inputsView inputPackage text: aSaveModel savingPackageName.
	self inputsView model isSaved: aSaveModel isSaved."

	aSaveModel projectModel: self projectModel.
	self savingService saveModel: aSaveModel.
	self inputsController saveModel: aSaveModel.

	aSaveModel isClassSide
		ifTrue: [ self inputsView buttonClass click ]
		ifFalse: [ self inputsView buttonInstance click ]
]

{ #category : 'accessing' }
PyramidSavePlugin >> projectModel [

	^ projectModel
]

{ #category : 'accessing' }
PyramidSavePlugin >> projectModel: aPyramidProjectModel [

	projectModel := aPyramidProjectModel.
	self inputsController updateView
]

{ #category : 'actions' }
PyramidSavePlugin >> saveAction [
	"Action executed by a save button from UI, this method catch exceptions when needed to doesn't expose directly a debugger but an info window"

	[
	self savingService save.
	self inputsController isSaved. 
	]
	on: Error
	do: [ :e |
		
		"Pyramid level error"
		(e isKindOf: PyramidSaveError) ifTrue:[		
			^ UIManager default
				 	alert: 'Cannot save the project, open project configuration to setup a valid saving location.'
			 	 	title: 'Project configuration problem'
		].
		
		"Serializer level error"
		(e isKindOf: BlocSerializationError) ifTrue:[		
			(UIManager default
				confirm: 'Error when saving the project: ', e messageText asString, '
				Debug this error ?'
			 	label: 'Error')
			ifTrue:[e debug] ifFalse:[^ self].
		].
	]
]

{ #category : 'accessing' }
PyramidSavePlugin >> saveButton [

	^ saveButton
]

{ #category : 'accessing' }
PyramidSavePlugin >> saveModel [

	^ saveModel
]

{ #category : 'accessing' }
PyramidSavePlugin >> savingService [

	^ savingService
]
