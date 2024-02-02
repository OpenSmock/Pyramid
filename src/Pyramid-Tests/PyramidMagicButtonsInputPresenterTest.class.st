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
		  strings: (PyramidMagicButtonsModel new
				   addButtonModel: (PyramidMagicButtonModel new
						    icon: (self iconNamed: #smallOk);
						    helpSelected: 'The value is ok.';
						    helpNotSelected: 'Set the value to ok.';
						    label: 'ok';
						    inputValue: #ok;
						    yourself);
				   addButtonModel: (PyramidMagicButtonModel new
						    icon: (self iconNamed: #smallCancel);
						    helpSelected: 'The value is cancel.';
						    helpNotSelected: 'Set the value to cancel.';
						    label: 'cancel';
						    inputValue: #cancel;
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
