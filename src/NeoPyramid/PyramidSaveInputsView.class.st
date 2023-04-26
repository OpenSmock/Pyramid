Class {
	#name : #PyramidSaveInputsView,
	#superclass : #SpPresenter,
	#classTraits : 'TPySaveModelObserver classTrait',
	#instVars : [
		'inputPackage',
		'inputClass',
		'inputMethod',
		'buttonClass',
		'buttonInstance',
		'labelErrorPackage',
		'labelErrorClass',
		'labelErrorMethod',
		'controller',
		'model'
	],
	#category : #'NeoPyramid-plugin-save'
}

{ #category : #accessing }
PyramidSaveInputsView >> buttonClass [ 

	^ buttonClass
]

{ #category : #accessing }
PyramidSaveInputsView >> buttonInstance [ 

	^ buttonInstance
]

{ #category : #accessing }
PyramidSaveInputsView >> controller [

	controller ifNil: [
		controller := PyramidSaveInputsController new
			              view: self;
			              yourself ].
	^ controller
]

{ #category : #accessing }
PyramidSaveInputsView >> controller: aPySaveFormController [
	controller := aPySaveFormController
]

{ #category : #layout }
PyramidSaveInputsView >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: self inputPackage expand: false;
		  add: self labelErrorPackage expand: false;
		  add: self inputClass expand: false;
		  add: self labelErrorClass expand: false;
		 add: self inputMethod expand: false;
		  add: self labelErrorMethod expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: self buttonClass;
				   add: self buttonInstance;
				   yourself)
		  expand: false;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsView >> hideLabelClass [
	self labelErrorClass label: ''.
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsView >> hideLabelMethod [

	self labelErrorMethod label: ''
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsView >> hideLabelPackage [

	self labelErrorPackage label: ''
]

{ #category : #initialization }
PyramidSaveInputsView >> initializePresenters [

	inputPackage := self newTextInput
		                placeholder: 'Enter a package name';
		                whenTextChangedDo: [
			                | text |
			                text := inputPackage text.
			                self controller textUpdatedFromPackage: text ];
		                yourself.

	inputClass := self newTextInput
		              placeholder: 'Enter a class name';
		              whenTextChangedDo: [
			              | text |
			              text := inputClass text.
			              self controller textUpdatedFromClass: text ];
		              yourself.

	inputMethod := self newTextInput
		               placeholder: 'Enter a method name';
		               whenTextChangedDo: [
			               | text |
			               text := inputMethod text.
			               self controller textUpdatedFromMethod: text ];
		               yourself.

	buttonClass := self newRadioButton
		               label: 'save on class side';
							whenChangedDo: [ :aBoolean | self controller radioUpdatedOnClassSide: aBoolean ];
		               yourself.
	buttonInstance := self newRadioButton
		                  label: 'save on instance side';
		                  yourself.
	buttonClass associatedRadioButtons: { buttonInstance }.

	labelErrorPackage := self newLabel.
	labelErrorClass := self newLabel.
	labelErrorMethod := self newLabel
]

{ #category : #accessing }
PyramidSaveInputsView >> inputClass [

	^ inputClass
]

{ #category : #accessing }
PyramidSaveInputsView >> inputMethod [ 

	^ inputMethod
]

{ #category : #accessing }
PyramidSaveInputsView >> inputPackage [
	^ inputPackage


]

{ #category : #accessing }
PyramidSaveInputsView >> labelErrorClass [ 

	^ labelErrorClass
]

{ #category : #accessing }
PyramidSaveInputsView >> labelErrorMethod [

	^ labelErrorMethod
]

{ #category : #accessing }
PyramidSaveInputsView >> labelErrorPackage [ 

	^ labelErrorPackage
]

{ #category : #accessing }
PyramidSaveInputsView >> model [

	model ifNil: [
		model := PyramidSaveModel new
			         yourself ].
	^ model
]

{ #category : #accessing }
PyramidSaveInputsView >> model: aPySaveModel [

	model := aPySaveModel.
	self updateFromModel.
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsView >> showErrorClassMissing [

	self labelErrorClass
		displayColor: [ :e | Color red ];
		label: 'Class name should not be empty.';
		yourself
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsView >> showErrorMethodMissing [

	self labelErrorMethod
		displayColor: [ :e | Color red ];
		label: 'Method name should not be empty.';
		yourself
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsView >> showErrorMethodWillOverride [

	self labelErrorMethod
		displayColor: [ :e | Color red ];
		label: 'Saving will override a method from the System. Be carefull';
		yourself
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsView >> showErrorPackageMissing [

	self labelErrorPackage
	displayColor: [ :e | Color red ];
		label: 'Package name should not be empty.';
		yourself
		
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsView >> showInfoClassWillBeCreated [

	self labelErrorClass
		displayColor: [ :e | Color black ];
		label: 'A new class will be created.';
		yourself
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsView >> showInfoMethodWillOverride [

	self labelErrorMethod
		displayColor: [ :e | Color black ];
		label: 'Saving will override an existing Bloc project.';
		yourself
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsView >> showInfoPackageWillBeCreated [

	self labelErrorPackage
		displayColor: [ :e | Color black ];
		label: 'A new package will be created.';
		yourself
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsView >> updateFromModel [

	self inputPackage text: self model savingPackageName.
	self inputClass text: self model savingClassName.
	self inputMethod text: self model savingMethodName.
	self model isClassSide
		ifTrue: [ self buttonClass click ]
		ifFalse: [ self buttonInstance click ]
]
