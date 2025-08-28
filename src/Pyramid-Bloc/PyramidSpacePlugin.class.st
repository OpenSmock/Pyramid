Class {
	#name : #PyramidSpacePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'builder',
		'morphicPresenter',
		'resetSpaceButton',
		'resetShortcutBlock',
		'spaceEventCollection'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #adding }
PyramidSpacePlugin >> addEventHandlerToSpaceEventCollection: anEventHandler [
	
	spaceEventCollection add: anEventHandler
]

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
	self defaultShortcutsForEditor: aPyramidEditor
]

{ #category : #'shortcut management' }
PyramidSpacePlugin >> defaultShortcutsForEditor: aPyramidEditor [
	
	| extensionList pyramidMainExtension pyramidPositionExtension |
	extensionList := self builder extensions.

	pyramidMainExtension := extensionList select: [ :extensions |
		                   extensions isKindOf: PyramidMainExtension ].
	pyramidMainExtension size = 1 ifTrue: [
		aPyramidEditor
			addShortcutSpecInCollection: KeyboardKey G command mac |
												 KeyboardKey G control unix |
												 KeyboardKey G control win
			action: [
				(pyramidMainExtension asArray first) workplacePropertiesView
					visibilityButton toggleState ]
			name: 'Shortcut Spec grid visibility' ].

	pyramidPositionExtension := extensionList select: [ :extensions |
		                   extensions isKindOf: PyramidPositionExtension ].
	pyramidPositionExtension size = 1 ifTrue: [
		aPyramidEditor
			addShortcutSpecInCollection: KeyboardKey space command mac |
												 KeyboardKey space control unix | 
												 KeyboardKey space control win
			action: [
				aPyramidEditor projectModel selection size = 1
					ifTrue: [ 
						aPyramidEditor projectModel selection first.
						aPyramidEditor commandExecutor
							use: PyramidPositionCommand new
							on: { aPyramidEditor projectModel selection first }
							with: (pyramidPositionExtension asArray first) position ] ]
			name: 'Shortcut Spec Move element to the mouse position' ].
]

{ #category : #initialization }
PyramidSpacePlugin >> initialize [
	
	resetShortcutBlock := [ :aSpace | ].
	spaceEventCollection := OrderedCollection new.
	builder := PyramidSpaceBuilder defaultEditorBuilder.
	morphicPresenter := SpMorphPresenter new.
	resetSpaceButton := SpButtonPresenter new
		                    icon:
			                    (Smalltalk ui icons iconNamed: #smallUpdate);
		                    action: [ self resetSpace ];
		                    help: 'Refresh space in case of an issue';
		                    yourself
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

{ #category : #accessing }
PyramidSpacePlugin >> resetShortcutBlock [

	^ resetShortcutBlock
]

{ #category : #accessing }
PyramidSpacePlugin >> resetShortcutBlock: aBlock [

	resetShortcutBlock := aBlock
]

{ #category : #initialization }
PyramidSpacePlugin >> resetSpace [

	| space |
	space := self builder build.
	self makePresenterWithBlSpace: space.
	resetShortcutBlock value: space.
	spaceEventCollection do: [ :aEventHandler | space addEventHandler: aEventHandler ].
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

{ #category : #connecting }
PyramidSpacePlugin >> windowOpenBy: aPyramidEditor [

	self resetSpace.
]
