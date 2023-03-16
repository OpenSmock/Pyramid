Class {
	#name : #PyNavigationSave,
	#superclass : #PyNavigationAbstract,
	#traits : 'PyBlocTakesRoot',
	#classTraits : 'PyBlocTakesRoot classTrait',
	#instVars : [
		'popover',
		'buttonSelect',
		'buttonSave',
		'inputPackage',
		'inputClass',
		'inputMethod'
	],
	#category : #'Pyramid-Editor-Toolbar'
}

{ #category : #'as yet unclassified' }
PyNavigationSave >> actionSave [

	| methodText |
	methodText := '!' , self textClassName
	              , ' class methodsFor: ''bloc-STON''!'.
	methodText := methodText , Character cr asString
	              , self textMethodName , Character cr asString
	              , '<pySTON>' , Character cr asString
	              , Character cr asString.
	methodText := methodText , Character cr asString , '^ '''
	              , self root serialize , '''! !'.

	CodeImporter evaluateString: methodText
]

{ #category : #initialization }
PyNavigationSave >> actionSelectMenu [

	popover := self newPopover
		           relativeTo: buttonSelect;
		           bePositionBottom;
		           presenter: (SpPresenter new
				            layout: (SpBoxLayout newTopToBottom
						             borderWidth: 10;
						             spacing: 5;
						             add: self makeSavePopup;
						             add: (self newButton
								              label: 'Close';
								              action: [ popover dismiss ];
								              yourself);
						             yourself);
				            yourself);
		           yourself.
	popover popup
]

{ #category : #layout }
PyNavigationSave >> defaultLayout [

	^ self layoutFor: { 
			  buttonSelect.
			  buttonSave }
]

{ #category : #initialization }
PyNavigationSave >> initializePresenters [

	buttonSelect := self makeButtonWithIcon: #smallRemoteOpen.
	buttonSelect action: [ self actionSelectMenu ].

	buttonSave := self makeButtonWithIcon: #smallSave.
	buttonSave action: [ self actionSave ].

	inputPackage := self makeInputPackage.

	inputClass := self makeInputClass.
	inputPackage whenTextChangedDo: [ 
		self updateInputClassApplicant.
		self updateSaveState ].
	inputClass whenTextChangedDo: [ 
		self updateInputMethodApplicant.
		self updateSaveState ].

	inputMethod := self makeInputMethod.
	inputMethod whenTextChangedDo: [ 
		self updateSaveState ].
	
buttonSave enabled: self isSaveReady.
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> inputEntryCompletionFor: anApplicant [

	| entryCompletion |
	entryCompletion := EntryCompletion new
		                   dataSourceBlock: [ :currText | anApplicant ];
		                   filterBlock: [ :currApplicant :currText | 
			                   currText size > 0 and: [ 
					                   currApplicant asUppercase includesSubstring:
							                   currText asString asUppercase ] ].
	^ entryCompletion
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> inputEntryCompletionForClasses [

	| applicants |
	self textPackageName
		ifEmpty: [ applicants := Smalltalk globals classNames sorted ]
		ifNotEmpty: [ 
			| packages |
			packages := RPackageOrganizer default
				            packageNamed: self textPackageName
				            ifAbsent: [ 
				            ^ self inputEntryCompletionFor: applicants ].
			applicants := (packages classes asOrderedCollection collect: [ :c | c name ]) sorted ].

	^ self inputEntryCompletionFor: applicants
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> inputEntryCompletionForMethods [

	| class applicants |
	class := Smalltalk globals classNamed: self textClassName.

	applicants := class class methods collect: [:m | m selector].

	^ self inputEntryCompletionFor: applicants
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> inputEntryCompletionForPackages [

	| applicants |
	applicants := RPackageOrganizer default packages sorted collect: [ :package | package name ].

	^ self inputEntryCompletionFor: applicants
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> isSaveReady [

	^ self textPackageName notEmpty and: [ 
		  self textClassName notEmpty and: [ self textMethodName notEmpty ] ]
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> makeInputClass [

	^ self
		  makeInputCompletion: self inputEntryCompletionForClasses
		  withPlaceholder: 'Enter a class name (at least 4 letters)'
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> makeInputCompletion: anEntryCompletion withPlaceholder: aString [

	^ self newTextInput
		  extent: 300 @ 25;
		  placeholder: aString;
		  entryCompletion: anEntryCompletion;
		  yourself
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> makeInputMethod [

	^ self
		  makeInputCompletion: self inputEntryCompletionForMethods
		  withPlaceholder: 'Enter a method name'
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> makeInputPackage [

	^ self
		  makeInputCompletion: self inputEntryCompletionForPackages
		  withPlaceholder: 'Enter a package name'
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> makeSavePopup [

	^ SpPresenter new
		  layout: (SpBoxLayout newTopToBottom
				   spacing: 4;
				   add: inputPackage;
				   add: inputClass;
				   add: inputMethod;
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> package: aPackage class: aClass method: aMethod [

	inputPackage text: aPackage.
	inputClass text: aClass.
	inputMethod text: aMethod.
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> textClassName [

	^ inputClass text
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> textMethodName [

	^ inputMethod text
]

{ #category : #accessing }
PyNavigationSave >> textPackageName [

	^ inputPackage text
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> updateInputClassApplicant [

	inputClass entryCompletion: self inputEntryCompletionForClasses
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> updateInputMethodApplicant [

	inputMethod entryCompletion: self inputEntryCompletionForMethods
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> updateSaveState [

	self isSaveReady ifTrue: [ buttonSave enabled: true ] ifFalse: [ buttonSave enabled: false ]
]

{ #category : #'as yet unclassified' }
PyNavigationSave >> whenRootChanged [

	"do nothing"
]
