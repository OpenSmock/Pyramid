Class {
	#name : #PyramidExternalPropertyPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'classInput',
		'selectorInput',
		'classApplicants',
		'validateButton',
		'whenSubmitDo'
	],
	#category : #'Pyramid-properties-external'
}

{ #category : #accessing }
PyramidExternalPropertyPresenter >> classApplicants [

	classApplicants ifNil: [classApplicants :=  Smalltalk globals classNames sorted ].
	^ classApplicants
]

{ #category : #accessing }
PyramidExternalPropertyPresenter >> classInput [
^ classInput
]

{ #category : #layout }
PyramidExternalPropertyPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: (SpBoxLayout newVertical
				   spacing: 4;
				   add: 'Class';
				   add: self classInput;
				   yourself);
		  add: (SpBoxLayout newVertical
				   spacing: 4;
				   add: 'Selector';
				   add: self selectorInput;
				   yourself);
		  add: (SpBoxLayout newVertical
				   spacing: 4;
				   add: SpNullPresenter new;
				   add: self validateButton width: 24;
				   yourself) width: 24;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidExternalPropertyPresenter >> entryCompletionForClass [

	| entryCompletion |
	entryCompletion := EntryCompletion new
		                   dataSourceBlock: [ :currText |
			                   self classApplicants ];
		                   filterBlock: [ :currApplicant :currText |
			currText size > 2 and: [
			                   currApplicant asUppercase includesSubstring:
					                   currText asString asUppercase ]].
	^ entryCompletion
]

{ #category : #'as yet unclassified' }
PyramidExternalPropertyPresenter >> entryCompletionForSelector: aString [

	| class applicants entryCompletion |
	class := self class environment at: aString.
	applicants := class classSide selectors.
	entryCompletion := EntryCompletion new
		                   dataSourceBlock: [ :currText | applicants ];
		                   filterBlock: [ :currApplicant :currText |
					                   currApplicant asUppercase includesSubstring:
							                   currText asString asUppercase ].
	^ entryCompletion
]

{ #category : #'as yet unclassified' }
PyramidExternalPropertyPresenter >> externalProperty [

	| class selector |
	class := self class environment classNamed: self classInput text.
	selector := self selectorInput text asSymbol.
	^ (PyramidExternalProperty new
		   target: class;
		   selector: selector;
		   yourself) asExternalRessource
]

{ #category : #'initialization - deprecated' }
PyramidExternalPropertyPresenter >> initializePresenter [

	classInput := SpTextInputFieldPresenter new
		              placeholder: 'Enter a class name';
		              entryCompletion: self entryCompletionForClass;
		              whenTextChangedDo: [ :text |
			              self updateSelectorInput: text ];
		              yourself.
	selectorInput := self makeEmptySelectorInput
		                 yourself.
	validateButton := SpButtonPresenter new
		                  icon: (self iconNamed: #smallOk);
		                  action: [ self submit ];
		                  yourself.
	self updateValidateButton
]

{ #category : #'initialization - deprecated' }
PyramidExternalPropertyPresenter >> makeEmptySelectorInput [

	^ SpTextInputFieldPresenter new
		  placeholder: 'Enter a selector name';
		whenTextChangedDo: [ :text |
			                 self updateValidateButton ];
		  yourself
]

{ #category : #accessing }
PyramidExternalPropertyPresenter >> selectorInput [

	^ selectorInput
]

{ #category : #'as yet unclassified' }
PyramidExternalPropertyPresenter >> setExternalProperty: anObject [

	self classInput text: anObject target name.
	self selectorInput text: anObject selector
]

{ #category : #submit }
PyramidExternalPropertyPresenter >> submit [

	self whenSubmitDo value: self externalProperty
]

{ #category : #'as yet unclassified' }
PyramidExternalPropertyPresenter >> updateSelectorInput: aString [

	| existingClass |
	existingClass := self classApplicants select: [ :each |
		                 each = aString ].
	self updateSelectorTextCompletionForClassNamed: existingClass.
	self updateValidateButton
]

{ #category : #'as yet unclassified' }
PyramidExternalPropertyPresenter >> updateSelectorTextCompletionForClassNamed: aCollection [

	| input |
	aCollection ifEmpty: [
		self selectorInput entryCompletion: nil.
		^ self ].
	input := self makeEmptySelectorInput.
	input entryCompletion:
		(self entryCompletionForSelector: aCollection first).
	selectorInput := input. self layout: self defaultLayout
]

{ #category : #'as yet unclassified' }
PyramidExternalPropertyPresenter >> updateValidateButton [

	self validateButton enabled:
		(self classInput text isNotEmpty and: [ self selectorInput text isNotEmpty ])
]

{ #category : #accessing }
PyramidExternalPropertyPresenter >> validateButton [

	^ validateButton
]

{ #category : #submit }
PyramidExternalPropertyPresenter >> whenSubmitDo [

	whenSubmitDo ifNil: [ whenSubmitDo := [ :external | external inspect ] ].
	^ whenSubmitDo
]

{ #category : #submit }
PyramidExternalPropertyPresenter >> whenSubmitDo: aBlock [

	whenSubmitDo := aBlock
]
