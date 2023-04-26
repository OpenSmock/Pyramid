Class {
	#name : #PyramidSaveForm,
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
	#category : #'NeoPyramid-plugin-save'
}

{ #category : #accessing }
PyramidSaveForm >> buttonClass [ 

	^ buttonClass
]

{ #category : #accessing }
PyramidSaveForm >> buttonInstance [ 

	^ buttonInstance
]

{ #category : #accessing }
PyramidSaveForm >> controller [

	controller ifNil: [ controller := PySaveFormController new view: self; yourself ].
	^ controller
]

{ #category : #accessing }
PyramidSaveForm >> controller: aPySaveFormController [
	controller := aPySaveFormController
]

{ #category : #layout }
PyramidSaveForm >> defaultLayout [

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
PyramidSaveForm >> hideLabelClass [
	self labelErrorClass label: ''.
]

{ #category : #'as yet unclassified' }
PyramidSaveForm >> hideLabelMethod [

	self labelErrorMethod label: ''
]

{ #category : #'as yet unclassified' }
PyramidSaveForm >> hideLabelPackage [

	self labelErrorPackage label: ''
]

{ #category : #initialization }
PyramidSaveForm >> initializePresenters [

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
PyramidSaveForm >> inputClass [

	^ inputClass
]

{ #category : #accessing }
PyramidSaveForm >> inputMethod [ 

	^ inputMethod
]

{ #category : #accessing }
PyramidSaveForm >> inputPackage [
	^ inputPackage


]

{ #category : #accessing }
PyramidSaveForm >> labelErrorClass [ 

	^ labelErrorClass
]

{ #category : #accessing }
PyramidSaveForm >> labelErrorMethod [

	^ labelErrorMethod
]

{ #category : #accessing }
PyramidSaveForm >> labelErrorPackage [ 

	^ labelErrorPackage
]

{ #category : #accessing }
PyramidSaveForm >> model [

	model ifNil: [
		model := PySaveModel new
			             addObserver: self;
			             yourself ].
	^ model
]

{ #category : #accessing }
PyramidSaveForm >> model: aPySaveModel [

	self model removeObserver: self.
	model := aPySaveModel.
	model addObserver: self.
	self controller model: aPySaveModel
]

{ #category : #'as yet unclassified' }
PyramidSaveForm >> pySaveModelChanged [

	self inputPackage text: self model defaultPackageName.
	self inputClass text: self model defaultClassName.
	self inputMethod text: self model defaultMethodName.
	self model isInstanceSide ifTrue: [ self buttonInstance click ] ifFalse: [ self buttonClass click ].
]

{ #category : #'as yet unclassified' }
PyramidSaveForm >> showErrorClassMissing [

	self labelErrorClass
		displayColor: [ :e | Color red ];
		label: 'Class name should not be empty.';
		yourself
]

{ #category : #'as yet unclassified' }
PyramidSaveForm >> showErrorMethodMissing [

	self labelErrorMethod
		displayColor: [ :e | Color red ];
		label: 'Method name should not be empty.';
		yourself
]

{ #category : #'as yet unclassified' }
PyramidSaveForm >> showErrorMethodWillOverride [

	self labelErrorMethod
		displayColor: [ :e | Color red ];
		label: 'Saving will override a method from the System. Be carefull';
		yourself
]

{ #category : #'as yet unclassified' }
PyramidSaveForm >> showErrorPackageMissing [

	self labelErrorPackage
	displayColor: [ :e | Color red ];
		label: 'Package name should not be empty.';
		yourself
		
]

{ #category : #'as yet unclassified' }
PyramidSaveForm >> showInfoClassWillBeCreated [

	self labelErrorClass
		displayColor: [ :e | Color black ];
		label: 'A new class will be created.';
		yourself
]

{ #category : #'as yet unclassified' }
PyramidSaveForm >> showInfoMethodWillOverride [

	self labelErrorMethod
		displayColor: [ :e | Color black ];
		label: 'Saving will override an existing Bloc project.';
		yourself
]

{ #category : #'as yet unclassified' }
PyramidSaveForm >> showInfoPackageWillBeCreated [

	self labelErrorPackage
		displayColor: [ :e | Color black ];
		label: 'A new package will be created.';
		yourself
]
