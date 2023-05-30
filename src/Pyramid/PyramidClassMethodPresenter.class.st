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
		'submitBlock'
	],
	#category : #'Pyramid-properties-custom'
}

{ #category : #'as yet unclassified' }
PyramidClassMethodPresenter >> actionSubmit [

	self submitBlock value: (PyramidClassMethodModel new
			 targetClass: classListPresenter selectedItem;
			 methodString: textPresenter text;
			 yourself)
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
				 icon: (self iconNamed: #submit);
				 label: 'Sumbit';
				 action: [ self actionSubmit ];
				 yourself);
		yourself.

	packageListPresenter display: #name.
	packageListPresenter displayIcon: [ :aPackage |
		self iconNamed: #package ].

	methodListPresenter display: #selector.
	classListPresenter displayIcon: [ :aClass |
		aClass iconNamed: aClass systemIconName ].

	textPresenter := self newCode.
	textPresenter whenSubmitDo: [ :text |
		self actionSubmit ].

	self focusOrder
		add: packageListPresenter;
		add: classListPresenter;
		add: methodListPresenter;
		add: textPresenter
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

{ #category : #accessing }
PyramidClassMethodPresenter >> submitBlock [

	submitBlock ifNil: [ submitBlock := [ :model |  ] ].
	^ submitBlock
]

{ #category : #accessing }
PyramidClassMethodPresenter >> submitBlock: aBlock [

	 submitBlock := aBlock
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
