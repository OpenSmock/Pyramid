Class {
	#name : #PyTopPanelSave,
	#superclass : #SpPresenter,
	#traits : 'TPyEditorPanelTopLeft + TPySaveModelObserver + TPyPipelineObserver',
	#classTraits : 'TPyEditorPanelTopLeft classTrait + TPySaveModelObserver classTrait + TPyPipelineObserver classTrait',
	#instVars : [
		'saveButton',
		'selectionButton',
		'plugin',
		'popupSaveForm',
		'saveForm'
	],
	#category : #'Pyramid-Plugin-Save'
}

{ #category : #initialization }
PyTopPanelSave >> business: aBusiness [

	business := aBusiness.
	plugin := aBusiness getPlugin: PyPluginSave.
	self model:  plugin saveModel.
	self pipeline: aBusiness pipeline.
	self saveForm model: plugin saveModel
]

{ #category : #layout }
PyTopPanelSave >> defaultLayout [

	| defaultLayout |
	defaultLayout := self layoutBox.
	PyTopPanelHelper addButton: self selectionButton toLayout: defaultLayout.
	PyTopPanelHelper addButton: self saveButton toLayout: defaultLayout.
	^ defaultLayout
]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> informNewChange [

	self saveButton color: Color orange.
]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> informSave [

	self saveButton color: self saveButton defaultColor.
]

{ #category : #initialization }
PyTopPanelSave >> initializeButtons [

	selectionButton := self newButton.
	selectionButton
		icon: (self iconNamed: #smallRemoteOpen);
		action: [ self selectionAction ].
	saveButton := self newButton.
	saveButton
		icon: (self iconNamed: #smallSave);
		action: [ self saveAction ]
]

{ #category : #initialization }
PyTopPanelSave >> initializePresenters [

	self initializeSaveForm.
	self initializeButtons.
	self initiliazePopup.
	
]

{ #category : #initialization }
PyTopPanelSave >> initializeSaveForm [

	| saveController saveModel |
	saveModel := PySaveModel new.
	saveController := PySaveFormController new.
	saveForm := PySaveFormView new.

	saveController view: saveForm.
	saveController model: saveModel.

	saveForm controller: saveController.
	saveForm model: saveModel
]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> initiliazePopup [

	popupSaveForm := SpPopoverPresenter new
		                 borderColor: Color black;
		                 relativeTo: self selectionButton;
		                 position: SpPopoverPosition right;
		                 presenter: (SpPresenter new
				                  layout: (SpBoxLayout newTopToBottom
						                   borderWidth: 3;
						                   spacing: 5;
						                   add: self saveForm;
						                   add: (SpButtonPresenter new
								                    label: 'Close';
								                    action: [ popupSaveForm dismiss ];
								                    yourself);
						                   yourself);
				                  yourself);
		                 yourself
]

{ #category : #accessing }
PyTopPanelSave >> model: aPySaveModel [

	self model removeObserver: self.
	model := aPySaveModel.
	model addObserver: self.
	self pySaveModelChanged
]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> modelInvalid [

	self saveButton enabled: false
]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> modelValid [

	self saveButton enabled: true
]

{ #category : #accessing }
PyTopPanelSave >> order [

	^ 2
]

{ #category : #accessing }
PyTopPanelSave >> plugin [

	^ plugin
]

{ #category : #accessing }
PyTopPanelSave >> popupSaveForm [
	^ popupSaveForm
]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> pyPipelineCancelCommand [

]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> pyPipelineExecuteCommand [

	self informNewChange
]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> pyPipelineTerminateCommand [

]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> pyPipelineVerifyCommand [

]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> pySaveModelChanged [

	| isModelValid |
	isModelValid := 
	self plugin validator validateAsBoolean: self model .

	isModelValid
		ifTrue: [ self modelValid ]
		ifFalse: [ self modelInvalid ]
]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> saveAction [

	self plugin saveCore saveOrRaiseException.
	self informSave
]

{ #category : #accessing }
PyTopPanelSave >> saveButton [

	^ saveButton
]

{ #category : #accessing }
PyTopPanelSave >> saveForm [
^ saveForm
]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> selectionAction [

	self popupSaveForm popup.
]

{ #category : #'as yet unclassified' }
PyTopPanelSave >> selectionButton [

	^ selectionButton
]
