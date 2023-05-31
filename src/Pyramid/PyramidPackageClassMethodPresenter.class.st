Class {
	#name : #PyramidPackageClassMethodPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'methodListPresenter',
		'classListPresenter',
		'packageListPresenter',
		'whenSelectionChangedDo'
	],
	#category : #'Pyramid-properties-custom'
}

{ #category : #'as yet unclassified' }
PyramidPackageClassMethodPresenter >> actionSelection [

	self whenSelectionChangedDo value: self model
]

{ #category : #accessing }
PyramidPackageClassMethodPresenter >> classListPresenter [

	^ classListPresenter
]

{ #category : #initialization }
PyramidPackageClassMethodPresenter >> connectPresenters [

	self packageListPresenter
		transmitTo: self classListPresenter
		transform: [ :package |
			package
				ifNil: [ #(  ) ]
				ifNotNil: [ package classes asArray sort: #name ascending ] ]
		postTransmission: [ :destination | destination selectIndex: 1 ].

	self classListPresenter
		transmitTo: self methodListPresenter
		transform: [ :class |
			class
				ifNil: [ #(  ) ]
				ifNotNil: [ class class methods sort: #selector descending ] ]
		postTransmission: [ :destination |  ]
]

{ #category : #layout }
PyramidPackageClassMethodPresenter >> defaultLayout [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 1 / 3;
		  add: self packageListPresenter;
		  add: (SpPanedLayout newLeftToRight
				   positionOfSlider: 1 / 2;
				   add: self classListPresenter;
				   add: self methodListPresenter;
				   yourself);
		  yourself
]

{ #category : #initialization }
PyramidPackageClassMethodPresenter >> initializePresenters [

	classListPresenter := self newList.
	methodListPresenter := self newList.
	packageListPresenter := self newList.

	packageListPresenter display: #name.
	packageListPresenter displayIcon: [ :aPackage |
		self iconNamed: #package ].

	methodListPresenter display: #selector.
	classListPresenter displayIcon: [ :aClass |
		aClass iconNamed: aClass systemIconName ].

	methodListPresenter whenSelectedItemChangedDo: [ :item |
		self actionSelection ].

	self focusOrder
		add: packageListPresenter;
		add: classListPresenter;
		add: methodListPresenter
]

{ #category : #accessing }
PyramidPackageClassMethodPresenter >> methodListPresenter [

	^ methodListPresenter
]

{ #category : #'as yet unclassified' }
PyramidPackageClassMethodPresenter >> model [

	| model |
	model := PyramidClassMethodModel new
		         targetClass: self classListPresenter selectedItem;
		         yourself.
	self methodListPresenter selectedItem ifNotNil: [
		model methodSelector: self methodListPresenter selectedItem selector ].
	^ model
]

{ #category : #accessing }
PyramidPackageClassMethodPresenter >> packageListPresenter [

	^ packageListPresenter
]

{ #category : #api }
PyramidPackageClassMethodPresenter >> packages: aList [

	| newItems |
	newItems := aList sorted: #name ascending.
	self packageListPresenter items = newItems ifTrue: [ ^ self ].
	self packageListPresenter
		items: newItems;
		selectIndex: 1
]

{ #category : #'as yet unclassified' }
PyramidPackageClassMethodPresenter >> selectFromExternalRessource: anExternalRessource [

	| method |
	self packageListPresenter selectItem: anExternalRessource target package.
	self classListPresenter selectItem: anExternalRessource target.
	method := (self methodListPresenter items select: [ :each |
		           each selector = anExternalRessource selector ]) first.
	self methodListPresenter selectItem: method
]

{ #category : #accessing }
PyramidPackageClassMethodPresenter >> whenSelectionChangedDo [

	whenSelectionChangedDo ifNil: [ whenSelectionChangedDo := [ :m |  ] ].
	^ whenSelectionChangedDo
]

{ #category : #accessing }
PyramidPackageClassMethodPresenter >> whenSelectionChangedDo: anObject [

	whenSelectionChangedDo := anObject
]
