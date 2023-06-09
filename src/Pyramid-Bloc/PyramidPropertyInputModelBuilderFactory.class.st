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
		'shouldTriggerOnNil',
		'sectionName'
	],
	#category : #'Pyramid-Bloc-plugin-bloc-properties'
}

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderFactory class >> backgroundInput [

	^ self new
		  sectionName: 'Background';
		  dontTriggerOnNil;
		  inputClass: PyramidBackgroundPropertyInput;
		  initializeBlock: [ :input |  ];
		  mutliValuesDefault: PyramidFakeBackgroundMixedValues new;
		  noValueDefault: PyramidFakeBackgroundNoValue new;
		  transformInBlock: [ :input :value | input background: value ];
		  transformOutBlock: [ :input | input background ];
		  triggerBlockStrategy: (PyramidNoArgTrigger new
				   selector: #whenSubmitDo:;
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderFactory class >> fontSize [

	^ self new
		  sectionName: 'Font size';
		  inputClass: PyramidNumberPresenter;
		  initializeBlock: [ :input |  ];
		  mutliValuesDefault: '# mixed values';
		  noValueDefault: '# no values';
		  transformInBlock: [ :input :value |
			  | collection |
			  collection := value select: [ :each |
					                each isKindOf: BlFontSizeAttribute ].
			  collection
				  ifNotEmpty: [ input number: collection first size ]
				  ifEmpty: [ input number: nil ] ];
		  transformOutBlock: [ :input |
			  BlFontSizeAttribute size: input number ];
		  triggerBlockStrategy: (PyramidOneArgTrigger new
				   selector: #whenSubmitDo:;
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderFactory class >> fontWeight [

	^ self new
		  sectionName: 'Font weight';
		  inputClass: PyramidNumberPresenter;
		  initializeBlock: [ :input |  ];
		  mutliValuesDefault: '# mixed values';
		  noValueDefault: '# no values';
		  transformInBlock: [ :input :value |
			  | collection |
			  collection := value select: [ :each |
					                each isKindOf: BlFontWeightAttribute ].
			  collection
				  ifNotEmpty: [ input number: collection first weight ]
				  ifEmpty: [ input number: nil ] ];
		  transformOutBlock: [ :input |
			  BlFontWeightAttribute weight: input number ];
		  triggerBlockStrategy: (PyramidOneArgTrigger new
				   selector: #whenSubmitDo:;
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderFactory class >> identifierTextInput [

	^ self new
		  sectionName: 'Identity';
		  inputClass: SpTextInputFieldPresenter;
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
PyramidPropertyInputModelBuilderFactory class >> mockPresenter [

	^ self new
		  sectionName: 'Mock';
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
PyramidPropertyInputModelBuilderFactory class >> positionInput [

	^ self new
		  sectionName: 'Position';
		  dontTriggerOnNil;
		  inputClass: PyramidPointPresenter;
		  initializeBlock: [ :input |  ];
		  mutliValuesDefault: nil;
		  noValueDefault: nil;
		  transformInBlock: [ :input :value | input point: value ];
		  transformOutBlock: [ :input | input point ];
		  triggerBlockStrategy: (PyramidOneArgTrigger new
				   selector: #whenSubmitDo:;
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderFactory class >> textInput [

	^ self new
		  sectionName: 'Text';
		  inputClass: SpTextInputFieldPresenter;
		  initializeBlock: [ :input |  ];
		  mutliValuesDefault: '# mixed values';
		  noValueDefault: '# no values';
		  transformInBlock: [ :input :value | input text: value asString ];
		  transformOutBlock: [ :input | input text asRopedText ];
		  triggerBlockStrategy: (PyramidOneArgTrigger new
				   selector: #whenSubmitDo:;
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderFactory class >> visibilityDropList [

	^ self new
		  sectionName: 'Visibility';
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
	"
	Transform input value into a commande argument.
	if (self shouldTriggerOnNil) or (value isNotNil):
		property submit value on collection
		inputs in model are updated
	"

	^ [ :input :collection :model |
	  | value |
	  value := self transformOutBlock value: input.
	  (self shouldTriggerOnNil or: [ value isNotNil ]) ifTrue: [
		  aProperty submit: value on: collection ] ]
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderFactory >> makeInputBuilderFrom: aProperty [

	| targetModel callbakBlock connectTriggerBlock |
	targetModel := self makeTargetModel: aProperty.
	callbakBlock := self makeCallBackBlock: aProperty.
	connectTriggerBlock := self triggerBlockStrategy makeTriggerBloc:
		                       callbakBlock.
	^ PyramidPropertyInputModelBuilder new
	
		  sectionName: self sectionName;
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
PyramidPropertyInputModelBuilderFactory >> sectionName [

	^ sectionName
]

{ #category : #accessing }
PyramidPropertyInputModelBuilderFactory >> sectionName: aString [

	sectionName := aString
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
