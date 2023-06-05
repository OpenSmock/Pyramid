Class {
	#name : #PyramidSpacePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'extensions',
		'overlaysManager'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #examples }
PyramidSpacePlugin class >> example [

	| plugin |

	plugin := PyramidSpacePlugin new.
plugin configureBuilder: nil.
plugin overlaysManager rootElement addChild: (BlElement new background: Color red; yourself); yourself.
plugin overlaysManager space show.
]

{ #category : #accessing }
PyramidSpacePlugin class >> extensions [

	^ {
		  PyramidSPEMousePosition new.
		  PyramidSPEWindow new.
		  PyramidSPEMovement new.
		PyramidSPESelection new }
]

{ #category : #'class initialization' }
PyramidSpacePlugin class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #adding }
PyramidSpacePlugin >> addPanelsOn: aPyramidSimpleWindow [

	self extensions do: [ :each | each addPanelsOn: aPyramidSimpleWindow ].
	aPyramidSimpleWindow
		at: #space
		addItem: [ :builder |
		builder makePresenter: self makeSpacePresenter ]
]

{ #category : #actions }
PyramidSpacePlugin >> configureBuilder: aPyramidBuilder [

	self extensions do: [ :each | each installOnSpacePlugin: self ].
	self extensions do: [ :each | each configureBuilder: aPyramidBuilder ].
]

{ #category : #'as yet unclassified' }
PyramidSpacePlugin >> connectOn: aPyramidEditor [

	self overlaysManager activeProject: aPyramidEditor activeProject.
	self extensions do: [ :each | each connectOn: aPyramidEditor ].
]

{ #category : #accessing }
PyramidSpacePlugin >> extensions [
^ extensions
]

{ #category : #initialization }
PyramidSpacePlugin >> initialize [

	extensions := self class extensions.
	overlaysManager := PyramidOverlaysManager new.
]

{ #category : #'as yet unclassified' }
PyramidSpacePlugin >> makeSpacePresenter [

	| presenter morph host |
	presenter := SpMorphPresenter new.

	morph := Morph new.
	morph layoutPolicy: TableLayout new.

	host := BlMorphicHost new.
	host containerMorph: morph.

	self overlaysManager space host: host.

	presenter morph: morph.
	presenter whenDisplayDo: [ self overlaysManager space show ].
	^ presenter
]

{ #category : #accessing }
PyramidSpacePlugin >> overlaysManager [
^ overlaysManager
]
