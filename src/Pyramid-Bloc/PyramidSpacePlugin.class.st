Class {
	#name : #PyramidSpacePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin + TPyramidProjectModelObserver',
	#classTraits : 'TPyramidPlugin classTrait + TPyramidProjectModelObserver classTrait',
	#instVars : [
		'extensions',
		'overlaysManager',
		'activeProject'
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
		  PyramidSPEMakeSelection new.
		PyramidSPEShowSelection new }
]

{ #category : #'class initialization' }
PyramidSpacePlugin class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #accessing }
PyramidSpacePlugin >> activeProject [

	^ activeProject
]

{ #category : #accessing }
PyramidSpacePlugin >> activeProject: anObject [

	activeProject := anObject
]

{ #category : #adding }
PyramidSpacePlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow
		at: #space
		addItem: [ :builder |
		builder makePresenter: self makeSpacePresenter ]
]

{ #category : #'as yet unclassified' }
PyramidSpacePlugin >> connectOn: aPyramidEditor [

	(self overlaysManager model at: #editor) object: aPyramidEditor.
	self activeProject: aPyramidEditor activeProject.
	activeProject addObserver: self
]

{ #category : #initialization }
PyramidSpacePlugin >> initialize [

	overlaysManager := NeoPyramidOverlaysManagerFactory editManager
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

{ #category : #'as yet unclassified' }
PyramidSpacePlugin >> pyramidRootsChanged [

	self updateRoots
]

{ #category : #accessing }
PyramidSpacePlugin >> updateRoots [

	| canvas |
	canvas := self overlaysManager frontLayer overlayElement.
	canvas removeChildren.
	canvas addChildren: self activeProject roots
]
