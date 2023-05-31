Class {
	#name : #PyramidPCMWithTextFieldsPresenter,
	#superclass : #PyramidPackageClassMethodPresenter,
	#instVars : [
		'methodInputPresenter',
		'classInputPresenter',
		'packageInputPresenter'
	],
	#category : #'Pyramid-properties-custom'
}

{ #category : #accessing }
PyramidPCMWithTextFieldsPresenter >> classInputPresenter [

	^ classInputPresenter
]

{ #category : #layout }
PyramidPCMWithTextFieldsPresenter >> defaultLayout [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 1 / 3;
		  add: (SpBoxLayout newVertical spacing: 4; add: self packageListPresenter expand: true; add: self packageInputPresenter expand: false; yourself);
		  add: (SpPanedLayout newLeftToRight
				   positionOfSlider: 1 / 2;
				add: (SpBoxLayout newVertical spacing: 4; add: self classListPresenter expand: true; add: self classInputPresenter expand: false; yourself);
				add: (SpBoxLayout newVertical spacing: 4; add: self methodListPresenter expand: true; add: self methodInputPresenter expand: false; yourself);
				   yourself);
		  yourself
]

{ #category : #initialization }
PyramidPCMWithTextFieldsPresenter >> initializePresenters [

	super initializePresenters.
	methodInputPresenter := SpTextInputFieldPresenter new.
	classInputPresenter := SpTextInputFieldPresenter new.
	packageInputPresenter := SpTextInputFieldPresenter new.

	packageInputPresenter whenTextChangedDo: [ :text |
		| packages |
		packages := self packageListPresenter items select: [ :each |
			            each name = text ].
		packages
			ifEmpty: [ self packageListPresenter unselectAll ]
			ifNotEmpty: [ self packageListPresenter selectItem: packages first ] ].
	classInputPresenter whenTextChangedDo: [ :text |
		| classes |
		classes := self classListPresenter items select: [ :each |
			           each name = text ].
		classes
			ifEmpty: [ self classListPresenter unselectAll ]
			ifNotEmpty: [ self classListPresenter selectItem: classes first ] ].
	methodInputPresenter whenTextChangedDo: [ :text |
		| methods |
		methods := self methodListPresenter items select: [ :each |
			           each selector = text ].
		methods
			ifEmpty: [ self methodListPresenter unselectAll ]
			ifNotEmpty: [ self methodListPresenter selectItem: methods first ] ].

	self packageListPresenter whenSelectedItemChangedDo: [ :package |
		package ifNotNil: [ self packageInputPresenter text: package name ] ].
	self classListPresenter whenSelectedItemChangedDo: [ :class |
		class ifNotNil: [ self classInputPresenter text: class name ] ].
	self methodListPresenter whenSelectedItemChangedDo: [ :method |
		method ifNotNil: [ self methodInputPresenter text: method selector ].
		self actionSelection ].
	self focusOrder
		add: packageInputPresenter;
		add: classInputPresenter;
		add: methodInputPresenter
]

{ #category : #accessing }
PyramidPCMWithTextFieldsPresenter >> methodInputPresenter [

	^ methodInputPresenter
]

{ #category : #accessing }
PyramidPCMWithTextFieldsPresenter >> packageInputPresenter [

	^ packageInputPresenter
]
