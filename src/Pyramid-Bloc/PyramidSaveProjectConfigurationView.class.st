Class {
	#name : #PyramidSaveProjectConfigurationView,
	#superclass : #SpPresenter,
	#instVars : [
		'inputPackage',
		'inputClass',
		'inputMethod',
		'buttonClass',
		'buttonInstance',
		'buttonBrowse',
		'labelErrorPackage',
		'labelErrorClass',
		'labelErrorMethod',
		'controller',
		'saveModel',
		'shouldTriggerEvent',
		'openSettingsLink'
	],
	#category : #'Pyramid-Bloc-plugin-save'
}

{ #category : #layout }
PyramidSaveProjectConfigurationView >> buttonBrowse [

	^ buttonBrowse
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> buttonClass [ 

	^ buttonClass
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> buttonInstance [ 

	^ buttonInstance
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> controller [

	controller ifNil: [
		controller := PyramidSaveProjectConfigurationController new
			              view: self;
			              yourself ].
	^ controller
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> controller: aPySaveFormController [
	controller := aPySaveFormController
]

{ #category : #layout }
PyramidSaveProjectConfigurationView >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpLabelPresenter new
				   label: 'Project configuration';
				   displayBold: [ :c | true ];
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: (Smalltalk ui icons iconNamed: #packageColored)
				   expand: false;
				   add: self inputPackage)
		  expand: false;
		  add: self labelErrorPackage expand: false;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: (Smalltalk ui icons iconNamed: #class) expand: false;
				   add: self inputClass)
		  expand: false;
		  add: self labelErrorClass expand: false;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: (Smalltalk ui icons iconNamed: #changeUpdate)
				   expand: false;
				   add: self inputMethod)
		  expand: false;
		  add: self labelErrorMethod expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: self buttonClass;
				   add: self buttonInstance;
				   add: self buttonBrowse width: 32;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: 'Go on ' expand: false;
				   add: self openSettingsLink expand: false;
				   add: ' to change the format.';
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationView >> hideLabelClass [
	self labelErrorClass label: ''.
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationView >> hideLabelMethod [

	self labelErrorMethod label: ''
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationView >> hideLabelPackage [

	self labelErrorPackage label: ''
]

{ #category : #configuration }
PyramidSaveProjectConfigurationView >> hideLabels [

	self labelErrorClass label: ''.
	self labelErrorMethod label: ''.
	self labelErrorPackage label: ''.
]

{ #category : #initialization }
PyramidSaveProjectConfigurationView >> initializePresenters [

	shouldTriggerEvent := true.
	inputPackage := self newTextInput
		                placeholder: 'Enter a package name';
		                whenTextChangedDo: [ :text |
			                self shouldTriggerEvent ifTrue: [
					                self controller textUpdatedFromPackage: text ] ];
		                yourself.

	inputClass := self newTextInput
		              placeholder: 'Enter a class name';
		              whenTextChangedDo: [ :text |
			              self shouldTriggerEvent ifTrue: [
					              self controller textUpdatedFromClass: text ] ];
		              yourself.

	inputMethod := self newTextInput
		               placeholder: 'Enter a method name';
		               whenTextChangedDo: [ :text |
			               self shouldTriggerEvent ifTrue: [
					               self controller textUpdatedFromMethod: text ] ];
		               yourself.

	buttonClass := self newRadioButton
		               label: 'save on class side';
		               whenChangedDo: [ :aBoolean |
			               self shouldTriggerEvent ifTrue: [
					               self controller radioUpdatedOnClassSide: aBoolean ] ];
		               yourself.
	buttonInstance := self newRadioButton
		                  label: 'save on instance side';
		                  yourself.
	buttonClass associatedRadioButtons: { buttonInstance }.

	buttonBrowse := SpButtonPresenter new
		                help: 'Browse project class';
		                icon: (Smalltalk ui icons iconNamed: #nautilus);
		                action: [ self controller browseProjectClass ];
		                enabled: false;
		                yourself.

	labelErrorPackage := self newLabel.
	labelErrorClass := self newLabel.
	labelErrorMethod := self newLabel.
	openSettingsLink := self newLink.
	openSettingsLink
		label: 'Pyramid Settings';
		action: [
			self openSettingsBrowser ]
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> inputClass [

	^ inputClass
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> inputMethod [ 

	^ inputMethod
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> inputPackage [
	^ inputPackage


]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> labelErrorClass [ 

	^ labelErrorClass
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> labelErrorMethod [

	^ labelErrorMethod
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> labelErrorPackage [ 

	^ labelErrorPackage
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> model [

	saveModel ifNil: [ saveModel := PyramidSaveModel new yourself ].
	^ saveModel
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> model: aPySaveModel [

	saveModel := aPySaveModel.
	self updateFromModelWithoutEvents
]

{ #category : #initialization }
PyramidSaveProjectConfigurationView >> openSettingsBrowser [

	| browser |
	browser := SettingBrowser new.
	browser changeSearchedText: 'Pyramid'.
	browser open.
	browser expandAll
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> openSettingsLink [

	^ openSettingsLink
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> saveModel [

	saveModel ifNil: [ saveModel := PyramidSaveModel new yourself ].
	^ saveModel
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> saveModel: aPySaveModel [

	saveModel := aPySaveModel.
	self updateFromModelWithoutEvents
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> shouldTriggerEvent [

	^ shouldTriggerEvent
]

{ #category : #accessing }
PyramidSaveProjectConfigurationView >> shouldTriggerEvent: aBoolean [

	shouldTriggerEvent := aBoolean
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationView >> showClassIsNotValidError [

	self labelErrorClass
		displayColor: [ Color red ];
		label: 'Class name is not valid.'
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationView >> showClassPackageIsNotEqualError [

	self labelErrorClass
		displayColor: [ Color red ];
		label: 'This class already exist in another package.'
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationView >> showMethodIsNotValidError [

	self labelErrorMethod
		displayColor: [ Color red ];
		label: 'Method name is not valid.'
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationView >> showModelNilError [

	self labelErrorPackage
		displayColor: [Color red];
		label: 'No model available.'
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationView >> showPackageIsNotValidError [

	self labelErrorPackage
		displayColor: [ Color red ];
		label: 'Package name is not valid.'
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationView >> showProjectModelNilError [

	self labelErrorPackage
		displayColor: [ Color red ];
		label: 'No project loaded.'
]

{ #category : #'as yet unclassified' }
PyramidSaveProjectConfigurationView >> updateFromModelWithoutEvents [

	self shouldTriggerEvent: false.
	[self inputPackage text: self model savingPackageName.
	self inputClass text: self model savingClassName.
	self inputMethod text: self model savingMethodName.
	self model isClassSide
		ifTrue: [ self buttonClass click ]
		ifFalse: [ self buttonInstance click ]] ensure: [self shouldTriggerEvent: true.  ]
]
