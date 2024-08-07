Class {
	#name : #PyramidMagicButtonsInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidMagicButtonsInputPresenterTest >> dummyValues [

	^ { #ok . #cancel }
]

{ #category : #accessing }
PyramidMagicButtonsInputPresenterTest >> expectedEmptyValue [

	^ PyramidUnknowState new
]

{ #category : #accessing }
PyramidMagicButtonsInputPresenterTest >> expectedMixedValues [

	^ PyramidUnknowState new
]

{ #category : #tests }
PyramidMagicButtonsInputPresenterTest >> makeNewInput [

	^ PyramidMagicButtonsInputPresenter new
		  inputModel: (PyramidMagicButtonsModel new
				   addButtonModel: (PyramidMagicButtonModel new
						    icon: (Smalltalk ui icons iconNamed: #smallOk);
						    helpSelected: 'The value is ok.';
						    helpNotSelected: 'Set the value to ok.';
						    label: 'ok';
						    inputValue: #ok;
						    inputValidation: [ :val | val = #ok ];
						    yourself);
				   addButtonModel: (PyramidMagicButtonModel new
						    icon: (Smalltalk ui icons iconNamed: #smallCancel);
						    helpSelected: 'The value is cancel.';
						    helpNotSelected: 'Set the value to cancel.';
						    label: 'cancel';
						    inputValue: #cancel;
						    inputValidation: [ :val | val = #cancel ];
						    yourself);
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonsInputPresenterTest >> makeNewInputWithModel [

	^ self makeNewInput
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonsInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput whenValueChangedDo value: anInput value
]
