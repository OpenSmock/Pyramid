Class {
	#name : #PyramidSpacePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin + TPyramidProjectModelObserver',
	#classTraits : 'TPyramidPlugin classTrait + TPyramidProjectModelObserver classTrait',
	#instVars : [
		'spacePresenter',
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
		builder makePresenter: self spacePresenter ]
]

{ #category : #'as yet unclassified' }
PyramidSpacePlugin >> connectOn: aPyramidEditor [

	(self spacePresenter overlaysManager model at: #editor) object:
		aPyramidEditor.
			self activeProject: aPyramidEditor activeProject.
	self activeProject addObserver: self
]

{ #category : #initialization }
PyramidSpacePlugin >> initialize [

	spacePresenter := PyramidSpacePresenter new.
]

{ #category : #'as yet unclassified' }
PyramidSpacePlugin >> pyramidRootsChanged [

	self updateRoots
]

{ #category : #accessing }
PyramidSpacePlugin >> spacePresenter [

	^ spacePresenter
]

{ #category : #accessing }
PyramidSpacePlugin >> updateRoots [

	| canvas |
	canvas := self spacePresenter overlaysManager frontLayer overlayElement.
	canvas removeChildren.
	canvas addChildren: self activeProject roots
]
