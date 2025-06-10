Class {
	#name : #PyramidSpacePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'builder',
		'morphicPresenter',
		'resetSpaceButton',
		'resetBloc'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #adding }
PyramidSpacePlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow
		at: #space
		addItem: [ :panelMaker | panelMaker makePresenter: self morphicPresenter ].

	aPyramidSimpleWindow at: #topLeft addItem: [ :panelMaker |
		panelMaker makeButtonWithIcon: self resetSpaceButton order: 5 ]
]

{ #category : #accessing }
PyramidSpacePlugin >> builder [
^ builder
]

{ #category : #connecting }
PyramidSpacePlugin >> connectOn: aPyramidEditor [

	builder editor: aPyramidEditor.
	self resetSpace.
]

{ #category : #initialization }
PyramidSpacePlugin >> initialize [

	resetBloc := [ :space | ].
	builder := PyramidSpaceBuilder defaultEditorBuilder.
	morphicPresenter := SpMorphPresenter new.
	resetSpaceButton := SpButtonPresenter new
		                    icon:
			                    (Smalltalk ui icons iconNamed: #smallUpdate);
		                    action: [ self resetSpace ];
		                    help: 'Refresh space in case of an issue';
		                    yourself.
]

{ #category : #'as yet unclassified' }
PyramidSpacePlugin >> makePresenterWithBlSpace: aBlSpace [

	| morph host |
	morph := Morph new
		         color: Color blue muchLighter;
		         yourself.

	morph layoutPolicy: TableLayout new.

	host := BlMorphicHost new.
	host containerMorph: morph.

	aBlSpace host: host.
	aBlSpace addEventHandler: (BlEventHandler
			 on: BlSpaceClosedEvent
			 do: [ :evt | self updateMorphInCaseOfFaillure: morph ]).

	self morphicPresenter morph: morph.
	self morphicPresenter whenDisplayDo: [ aBlSpace show ]
]

{ #category : #accessing }
PyramidSpacePlugin >> morphicPresenter [
^ morphicPresenter
]

{ #category : #initialization }
PyramidSpacePlugin >> resetBloc [

	^ resetBloc
]

{ #category : #initialization }
PyramidSpacePlugin >> resetBloc: aBlock [

	resetBloc := aBlock
]

{ #category : #initialization }
PyramidSpacePlugin >> resetSpace [

	| space |
	space := self builder build.
	self makePresenterWithBlSpace: space.
	self resetBloc value: space.
	space show
]

{ #category : #accessing }
PyramidSpacePlugin >> resetSpaceButton [
^ resetSpaceButton
]

{ #category : #'as yet unclassified' }
PyramidSpacePlugin >> updateMorphInCaseOfFaillure: aMorph [

	aMorph addMorph:
		('Something went wrong, please refresh the space using the reset button ↑'
			 asMorph fontName: TextStyle defaultFont familyName size: 40).
	aMorph addMorph: (SimpleButtonMorph new
			 label: 'Reset space';
			 target: [ self resetSpace ];
			 actionSelector: #value;
			 yourself)
]
