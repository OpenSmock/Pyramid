Class {
	#name : #PyramidSaveInputsView,
	#superclass : #SpPresenter,
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
	#category : #'Pyramid-plugin-save'
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

{ #category : #configuration }
PyramidSaveInputsView >> hideLabels [

	self labelErrorClass label: ''.
	self labelErrorMethod label: ''.
	self labelErrorPackage label: ''.
]

{ #category : #initialization }
PyramidSaveInputsView >> initializePresenters [

	inputPackage := self newTextInput
		                placeholder: 'Enter a package name';
		                whenTextChangedDo: [ :text |
			                self controller textUpdatedFromPackage: text ];
		                yourself.

	inputClass := self newTextInput
		              placeholder: 'Enter a class name';
		              whenTextChangedDo: [ :text |
			              self controller textUpdatedFromClass: text ];
		              yourself.

	inputMethod := self newTextInput
		               placeholder: 'Enter a method name';
		               whenTextChangedDo: [ :text |
			               self controller textUpdatedFromMethod: text ];
		               yourself.

	buttonClass := self newRadioButton
		               label: 'save on class side';
		               whenChangedDo: [ :aBoolean |
			               self controller radioUpdatedOnClassSide: aBoolean ];
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
PyramidSaveInputsView >> showClassIsNotValidError [

	self labelErrorClass
		displayColor: [ Color red ];
		label: 'Class name is not valid.'
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsView >> showClassPackageIsNotEqualError [

	self labelErrorClass
		displayColor: [ Color red ];
		label: 'This class already exist in another package.'
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsView >> showMethodIsNotValidError [

	self labelErrorMethod
		displayColor: [ Color red ];
		label: 'Method name is not valid.'
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsView >> showPackageIsNotValidError [

	self labelErrorPackage
		displayColor: [ Color red ];
		label: 'Package name is not valid.'
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsView >> showProjectNilError [

	self labelErrorPackage
		displayColor: [Color red];
		label: 'No project loaded.'
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
