Class {
	#name : #PyramidSpacePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'builder',
		'morphicPresenter',
		'resetSpaceButton'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #'class initialization' }
PyramidSpacePlugin class >> initialize [
	PyramidPluginManager uniqueInstance addPlugin: self

	
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

{ #category : #'as yet unclassified' }
PyramidSpacePlugin >> connectOn: aPyramidEditor [

	builder editor: aPyramidEditor.
	builder projectModel: aPyramidEditor activeProject.
	self resetSpace
]

{ #category : #initialization }
PyramidSpacePlugin >> initialize [

	builder := PyramidSpaceBuilder defaultEditorBuilder.
	morphicPresenter := SpMorphPresenter new.
	resetSpaceButton := SpButtonPresenter new
		                    icon: (self iconNamed: #smallUpdate);
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
	aBlSpace when: BlSpaceDestroyedEvent do: [ :evt |
		morph addMorph:
			('Something went wrong, please refresh the space using the refresh button ↑'
				 asMorph fontName: TextStyle defaultFont familyName size: 40) ].

	self morphicPresenter morph: morph.
	self morphicPresenter whenDisplayDo: [ aBlSpace show ]
]

{ #category : #accessing }
PyramidSpacePlugin >> morphicPresenter [
^ morphicPresenter
]

{ #category : #initialization }
PyramidSpacePlugin >> resetSpace [

	| space |
	space := self builder build.
	self makePresenterWithBlSpace: space.
	space show
]

{ #category : #accessing }
PyramidSpacePlugin >> resetSpaceButton [
^ resetSpaceButton
]
