Class {
	#name : #PyramidClassMethodPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'methodListPresenter',
		'classListPresenter',
		'packageListPresenter',
		'textPresenter',
		'buttonBar',
		'template',
		'whenSelectionChangedDo',
		'whenCompiledDo'
	],
	#category : #'Pyramid-properties-custom'
}

{ #category : #'as yet unclassified' }
PyramidClassMethodPresenter >> actionCompile [

	self whenCompiledDo value: self model
]

{ #category : #'as yet unclassified' }
PyramidClassMethodPresenter >> actionSelection [

	self whenSelectionChangedDo value: self model
]

{ #category : #'as yet unclassified' }
PyramidClassMethodPresenter >> actionTemplate [

	textPresenter beForBehavior: classListPresenter selectedItem.
	textPresenter text: self template
]

{ #category : #initialization }
PyramidClassMethodPresenter >> connectPresenters [

	packageListPresenter
		transmitTo: classListPresenter
		transform: [ :package |
			package
				ifNil: [ #(  ) ]
				ifNotNil: [ package classes asArray sort: #name ascending ] ]
		postTransmission: [ :destination | destination selectIndex: 1 ].

	classListPresenter
		transmitTo: methodListPresenter
		transform: [ :class |
			class
				ifNil: [ #(  ) ]
				ifNotNil: [ class class methods sort: #selector descending ] ]
		postTransmission: [ :destination |  ].

	methodListPresenter
		transmitTo: textPresenter
		transform: [ :method | method ifNil: [ '' ] ifNotNil: #sourceCode ]
		postTransmission: [ :destination :origin :transmited |
			transmited ifNotNil: [ destination beForMethod: transmited ] ]
]

{ #category : #layout }
PyramidClassMethodPresenter >> defaultLayout [

	^ SpBoxLayout newVertical spacing: 4;
		  add: (SpPanedLayout newTopToBottom
				   add: (SpPanedLayout newLeftToRight
						    positionOfSlider: 1 / 3;
						    add: packageListPresenter;
						    add: (SpPanedLayout newLeftToRight
								     positionOfSlider: 1 / 2;
								     add: classListPresenter;
								     add: methodListPresenter;
								     yourself);
						    yourself);
				   add: textPresenter;
				   yourself);
		  add: buttonBar expand: false;
		  yourself
]

{ #category : #initialization }
PyramidClassMethodPresenter >> initializePresenters [

	classListPresenter := self newList.
	methodListPresenter := self newList.
	packageListPresenter := self newList.
	buttonBar := self newButtonBar.
	buttonBar
		placeAtEnd;
		add: (self newButton
				 icon: (self iconNamed: #smallWarning);
				 label: 'Template';
				 action: [ self actionTemplate ];
				 yourself);
		add: (self newButton
				 icon: (self iconNamed: #doit);
				 label: 'Compile';
				 action: [ self actionCompile ];
				 yourself);
		yourself.

	packageListPresenter display: #name.
	packageListPresenter displayIcon: [ :aPackage |
		self iconNamed: #package ].

	methodListPresenter display: #selector.
	classListPresenter displayIcon: [ :aClass |
		aClass iconNamed: aClass systemIconName ].
	
	methodListPresenter whenSelectionChangedDo: [ :item | self actionSelection ].

	textPresenter := self newCode.
	textPresenter whenSubmitDo: [ :text | self actionCompile ].

	self focusOrder
		add: packageListPresenter;
		add: classListPresenter;
		add: methodListPresenter;
		add: textPresenter
]

{ #category : #'as yet unclassified' }
PyramidClassMethodPresenter >> model [
	| model |
	model := PyramidClassMethodModel new
		  targetClass: classListPresenter selectedItem;
		  methodString: textPresenter text;
		  yourself.
	methodListPresenter selectedItem ifNotNil: [ model  methodSelector: methodListPresenter selectedItem selector ].
	^ model
]

{ #category : #api }
PyramidClassMethodPresenter >> packages: aList [

	| newItems |
	newItems := aList sorted: #name ascending.
	packageListPresenter items = newItems ifTrue: [ ^ self ].
	packageListPresenter
		items: newItems;
		selectIndex: 1
]

{ #category : #'as yet unclassified' }
PyramidClassMethodPresenter >> selectFromExternalRessource: anExternalRessource [

	| method |
	packageListPresenter selectItem: anExternalRessource target package.
	classListPresenter selectItem: anExternalRessource target.
	method := (methodListPresenter items select: [ :each | each selector = anExternalRessource selector ]) first.
	methodListPresenter selectItem: method

]

{ #category : #accessing }
PyramidClassMethodPresenter >> template [

	template ifNil: [
		template :=  '"Write a new method below ↓↓↓"<r>' expandMacros  ].
	^ template
]

{ #category : #accessing }
PyramidClassMethodPresenter >> template: aString [

	template := aString.
	self actionTemplate
]

{ #category : #accessing }
PyramidClassMethodPresenter >> whenCompiledDo [

	whenCompiledDo ifNil: [ whenCompiledDo := [ :m |  ] ].
	^ whenCompiledDo
]

{ #category : #accessing }
PyramidClassMethodPresenter >> whenCompiledDo: anObject [

	whenCompiledDo := anObject
]

{ #category : #accessing }
PyramidClassMethodPresenter >> whenSelectionChangedDo [

	whenSelectionChangedDo ifNil: [ whenSelectionChangedDo := [ :m |  ] ].
	^ whenSelectionChangedDo
]

{ #category : #accessing }
PyramidClassMethodPresenter >> whenSelectionChangedDo: anObject [

	whenSelectionChangedDo := anObject
]
