Class {
	#name : #PySaveFormView,
	#superclass : #SpPresenter,
	#traits : 'TPySaveModelObserver',
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
		'controller'
	],
	#category : #'Pyramid-Plugin-Save'
}

{ #category : #accessing }
PySaveFormView >> buttonClass [ 

	^ buttonClass
]

{ #category : #accessing }
PySaveFormView >> buttonInstance [ 

	^ buttonInstance
]

{ #category : #accessing }
PySaveFormView >> controller [

	controller ifNil: [ controller := PySaveFormController new view: self; yourself ].
	^ controller
]

{ #category : #accessing }
PySaveFormView >> controller: aPySaveFormController [
	controller := aPySaveFormController
]

{ #category : #layout }
PySaveFormView >> defaultLayout [

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
PySaveFormView >> hideLabelClass [
	self labelErrorClass label: ''.
]

{ #category : #'as yet unclassified' }
PySaveFormView >> hideLabelMethod [

	self labelErrorMethod label: ''
]

{ #category : #'as yet unclassified' }
PySaveFormView >> hideLabelPackage [

	self labelErrorPackage label: ''
]

{ #category : #initialization }
PySaveFormView >> initializePresenters [

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
PySaveFormView >> inputClass [

	^ inputClass
]

{ #category : #accessing }
PySaveFormView >> inputMethod [ 

	^ inputMethod
]

{ #category : #accessing }
PySaveFormView >> inputPackage [
	^ inputPackage


]

{ #category : #accessing }
PySaveFormView >> labelErrorClass [ 

	^ labelErrorClass
]

{ #category : #accessing }
PySaveFormView >> labelErrorMethod [

	^ labelErrorMethod
]

{ #category : #accessing }
PySaveFormView >> labelErrorPackage [ 

	^ labelErrorPackage
]

{ #category : #accessing }
PySaveFormView >> model: aPySaveModel [

	self model removeObserver: self.
	model := aPySaveModel.
	model addObserver: self.
	self controller model: aPySaveModel
]

{ #category : #'as yet unclassified' }
PySaveFormView >> pySaveModelChanged [

	self inputPackage text: self model defaultPackageName.
	self inputClass text: self model defaultClassName.
	self inputMethod text: self model defaultMethodName.
	self model isInstanceSide ifTrue: [ self buttonInstance click ] ifFalse: [ self buttonClass click ].
]

{ #category : #'as yet unclassified' }
PySaveFormView >> showErrorClassMissing [

	self labelErrorClass
		displayColor: [ :e | Color red ];
		label: 'Class name should not be empty.';
		yourself
]

{ #category : #'as yet unclassified' }
PySaveFormView >> showErrorMethodMissing [

	self labelErrorMethod
		displayColor: [ :e | Color red ];
		label: 'Method name should not be empty.';
		yourself
]

{ #category : #'as yet unclassified' }
PySaveFormView >> showErrorMethodWillOverride [

	self labelErrorMethod
		displayColor: [ :e | Color red ];
		label: 'Saving will override a method from the System. Be carefull';
		yourself
]

{ #category : #'as yet unclassified' }
PySaveFormView >> showErrorPackageMissing [

	self labelErrorPackage
	displayColor: [ :e | Color red ];
		label: 'Package name should not be empty.';
		yourself
		
]

{ #category : #'as yet unclassified' }
PySaveFormView >> showInfoClassWillBeCreated [

	self labelErrorClass
		displayColor: [ :e | Color black ];
		label: 'A new class will be created.';
		yourself
]

{ #category : #'as yet unclassified' }
PySaveFormView >> showInfoMethodWillOverride [

	self labelErrorMethod
		displayColor: [ :e | Color black ];
		label: 'Saving will override an existing Bloc project.';
		yourself
]

{ #category : #'as yet unclassified' }
PySaveFormView >> showInfoPackageWillBeCreated [

	self labelErrorPackage
		displayColor: [ :e | Color black ];
		label: 'A new package will be created.';
		yourself
]
