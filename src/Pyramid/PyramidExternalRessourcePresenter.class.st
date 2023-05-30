Class {
	#name : #PyramidExternalRessourcePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'classInput',
		'selectorInput',
		'classApplicants',
		'validateButton',
		'whenSubmitDo'
	],
	#category : #'Pyramid-properties-custom'
}

{ #category : #accessing }
PyramidExternalRessourcePresenter >> classApplicants [

	classApplicants ifNil: [classApplicants :=  Smalltalk globals classNames sorted ].
	^ classApplicants
]

{ #category : #accessing }
PyramidExternalRessourcePresenter >> classInput [
^ classInput
]

{ #category : #layout }
PyramidExternalRessourcePresenter >> defaultLayout [

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
PyramidExternalRessourcePresenter >> entryCompletionForClass [

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
PyramidExternalRessourcePresenter >> entryCompletionForSelector: aString [

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
PyramidExternalRessourcePresenter >> externalProperty [

	| class selector |
	class := self class environment classNamed: self classInput text.
	selector := self selectorInput text asSymbol.
	^ (PyramidExternalRessourceProxy fromSource: (PyramidERClassSelector target: class selector: selector))
]

{ #category : #'initialization - deprecated' }
PyramidExternalRessourcePresenter >> initializePresenters [

	classInput := SpTextInputFieldPresenter new
		              placeholder: 'Enter a class name';
		              entryCompletion: self entryCompletionForClass;
		              whenTextChangedDo: [ :text |
			              self updateSelectorInput: text ];
		              yourself.
	selectorInput := self makeEmptySelectorInput yourself.
	validateButton := SpButtonPresenter new
		                  icon: (self iconNamed: #smallOk);
		                  action: [ self submit ];
		                  yourself.
	self updateValidateButton
]

{ #category : #'initialization - deprecated' }
PyramidExternalRessourcePresenter >> makeEmptySelectorInput [

	^ SpTextInputFieldPresenter new
		  placeholder: 'Enter a selector name';
		whenTextChangedDo: [ :text |
			                 self updateValidateButton ];
		  yourself
]

{ #category : #accessing }
PyramidExternalRessourcePresenter >> selectorInput [

	^ selectorInput
]

{ #category : #'as yet unclassified' }
PyramidExternalRessourcePresenter >> setExternalProperty: anObject [

	self classInput text: anObject target name.
	self selectorInput text: anObject selector
]

{ #category : #submit }
PyramidExternalRessourcePresenter >> submit [

	self whenSubmitDo value: self externalProperty
]

{ #category : #'as yet unclassified' }
PyramidExternalRessourcePresenter >> updateSelectorInput: aString [

	| existingClass |
	existingClass := self classApplicants select: [ :each |
		                 each = aString ].
	self updateSelectorTextCompletionForClassNamed: existingClass.
	self updateValidateButton
]

{ #category : #'as yet unclassified' }
PyramidExternalRessourcePresenter >> updateSelectorTextCompletionForClassNamed: aCollection [

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
PyramidExternalRessourcePresenter >> updateValidateButton [

	self validateButton enabled:
		(self classInput text isNotEmpty and: [ self selectorInput text isNotEmpty ])
]

{ #category : #accessing }
PyramidExternalRessourcePresenter >> validateButton [

	^ validateButton
]

{ #category : #submit }
PyramidExternalRessourcePresenter >> whenSubmitDo [

	whenSubmitDo ifNil: [ whenSubmitDo := [ :external | external inspect ] ].
	^ whenSubmitDo
]

{ #category : #submit }
PyramidExternalRessourcePresenter >> whenSubmitDo: aBlock [

	whenSubmitDo := aBlock
]
