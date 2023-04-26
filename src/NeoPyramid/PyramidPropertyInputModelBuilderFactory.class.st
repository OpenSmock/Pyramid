Class {
	#name : #PyramidPropertyInputModelBuilderFactory,
	#superclass : #Object,
	#instVars : [
		'transformInBlock',
		'transformOutBlock',
		'noValueDefault',
		'mutliValuesDefault',
		'inputClass',
		'triggerBlockStrategy',
		'initializeBlock',
		'shouldTriggerOnNil'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderFactory class >> identifierTextInput [

	^ self new
		  inputClass: SpTextInputFieldPresenter;
		  initializeBlock: [ :input | ];
		  mutliValuesDefault: '# mixed values';
		  noValueDefault: '# no values';
		  transformInBlock: [ :input :value |
			  input text: (value ifNil: [ '' ] ifNotNil: [ value ]) ];
		  transformOutBlock: [ :input |
			  input text ifEmpty: [ nil ] ifNotEmpty: [ input text ] ];
		  triggerBlockStrategy: (PyramidOneArgTrigger new
				   selector: #whenSubmitDo:;
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderFactory class >> mockPresenter [

	^ self new
		  inputClass: PyramidMockSpecPresenter;
		  initializeBlock: [ :input |  ];
		  mutliValuesDefault: '# mixed values';
		  noValueDefault: '# no values';
		  transformInBlock: [ :input :value |
			  input text: (value ifNil: [ '' ] ifNotNil: [ value ]) ];
		  transformOutBlock: [ :input |
			  input text ifEmpty: [ nil ] ifNotEmpty: [ input text ] ];
		  triggerBlockStrategy: (PyramidOneArgTrigger new
				   selector: #whenSubmitDo:;
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderFactory class >> visibilityDropList [

	^ self new
		  dontTriggerOnNil;
		  inputClass: SpDropListPresenter;
		  initializeBlock: [ :input |
			  input
				  dropListItems: {
						  (SpDropListItem new
							   action: [ BlVisibility visible ];
							   icon: (self iconNamed: #haloView);
							   model: BlVisibility visible;
							   display: [ :e | 'Visible' ];
							   yourself).
						  (SpDropListItem new
							   action: [ BlVisibility hidden ];
							   icon: (self iconNamed: #haloDrag);
							   model: BlVisibility hidden;
							   display: [ :e | 'Hidden' ];
							   yourself).
						  (SpDropListItem new
							   action: [ BlVisibility gone ];
							   icon: (self iconNamed: #haloDismiss);
							   model: BlVisibility gone;
							   display: [ :e | 'Gone' ];
							   yourself) };
				  yourself ];
		  mutliValuesDefault: nil;
		  noValueDefault: nil;
		  transformInBlock: [ :input :value |
			  value
				  ifNil: [
					  input startWithoutSelection.
					  input resetSelection ]
				  ifNotNil: [
					  input startWithSelection.
					  value isVisible
						  ifTrue: [ "Ici on selectionne visible" input selectIndex: 1 ]
						  ifFalse: [
							  value isGone
								  ifTrue: [ "Ici on selectionne gone" input selectIndex: 3 ]
								  ifFalse: [ "Ici on selectionne hidden" input selectIndex: 2 ] ] ] ];
		  transformOutBlock: [ :input |
			  input selectedIndex = 0
				  ifTrue: [ nil ]
				  ifFalse: [ (input getList at: input selectedIndex) action value ] ];
		  triggerBlockStrategy: (PyramidNoArgTrigger new
				   selector: #whenSelectionChangedDo:;
				   yourself);
		  yourself
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> doTriggerOnNil [

	shouldTriggerOnNil := true
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> dontTriggerOnNil [

	shouldTriggerOnNil := false
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> initializeBlock [

	^ initializeBlock
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> initializeBlock: anObject [

	initializeBlock := anObject
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> inputClass [

	^ inputClass
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> inputClass: anObject [

	inputClass := anObject
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderFactory >> installBuilderOn: aPorperty [

	aPorperty inputBuilder: (self makeInputBuilderFrom: aPorperty)
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderFactory >> makeCallBackBlock: aProperty [

	self shouldTriggerOnNil ifTrue: [ ^ [ :input :collection |
	  aProperty
		  submit: (self transformOutBlock value: input)
		  on: collection ] ] ifFalse: [ ^ [ :input :collection | | value |
		value := (self transformOutBlock value: input).
		value ifNotNil: [ aProperty
		  submit: value
		  on: collection ] ]
	  
	 ]
	
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderFactory >> makeInputBuilderFrom: aProperty [

	| targetModel callbakBlock connectTriggerBlock |
	targetModel := self makeTargetModel: aProperty.
	callbakBlock := self makeCallBackBlock: aProperty.
	connectTriggerBlock := self triggerBlockStrategy makeTriggerBloc:
		                       callbakBlock.
	^ PyramidPropertyInputModelBuilder new
		  targetModel: targetModel;
		  inputClass: self inputClass;
		  initializeInputBlock: self initializeBlock;
		  connectInputBlock: connectTriggerBlock;
		  setDefautValueBlock: self transformInBlock;
		  buttonCallbackBlock: callbakBlock;
		  noValue: self noValueDefault;
		  multiValue: self mutliValuesDefault;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderFactory >> makeTargetModel: aProperty [

	^ aProperty targetModel
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> mutliValuesDefault [

	^ mutliValuesDefault
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> mutliValuesDefault: anObject [

	mutliValuesDefault := anObject
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> noValueDefault [

	^ noValueDefault
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> noValueDefault: anObject [

	noValueDefault := anObject
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> shouldTriggerOnNil [

	^ shouldTriggerOnNil ifNil: [ true ].
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> transformInBlock [

	^ transformInBlock
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> transformInBlock: anObject [

	transformInBlock := anObject
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> transformOutBlock [

	^ transformOutBlock
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> transformOutBlock: anObject [

	transformOutBlock := anObject
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> triggerBlockStrategy [

	^ triggerBlockStrategy
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> triggerBlockStrategy: anObject [

	triggerBlockStrategy := anObject
]