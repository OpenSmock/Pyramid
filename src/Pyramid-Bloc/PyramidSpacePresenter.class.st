Class {
	#name : #PyramidSpacePresenter,
	#superclass : #SpPresenter,
	#traits : 'TPyramidProjectModelObserver',
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'activeProject',
		'presenter',
		'overlaysManager'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #accessing }
PyramidSpacePresenter >> activeProject [

	^ activeProject
]

{ #category : #accessing }
PyramidSpacePresenter >> activeProject: anObject [

	activeProject := anObject
]

{ #category : #accessing }
PyramidSpacePresenter >> connectOn: aPyramidEditor [


(self overlaysManager model at: #editor) object:
		aPyramidEditor.
	self activeProject: aPyramidEditor activeProject.
	self activeProject addObserver: self
]

{ #category : #layout }
PyramidSpacePresenter >> defaultLayout [

	^ SpBoxLayout newVertical add: self presenter; yourself
]

{ #category : #'as yet unclassified' }
PyramidSpacePresenter >> disconnectEditor [

	self activeProject removeObserver: self.
	self overlaysManager frontLayer overlayElement removeChildren.
]

{ #category : #initialization }
PyramidSpacePresenter >> initializePresenters [

	overlaysManager := PyramidOverlaysManagerFactory editManager.
	presenter := self makeSpacePresenter
]

{ #category : #initialization }
PyramidSpacePresenter >> makeSpacePresenter [

	| container morph host |
	container := SpMorphPresenter new.

	morph := Morph new
		         color: Color blue muchLighter;
		         yourself.

	morph layoutPolicy: TableLayout new.

	host := BlMorphicHost new.
	host containerMorph: morph.

	self overlaysManager space host: host.
	self overlaysManager space when: BlSpaceDestroyedEvent do: [ :evt |
		morph addMorph:
			('Something went wrong, please refresh the space using the refresh button ↑'
				 asMorph fontName: TextStyle defaultFont familyName size: 40) ].

	container morph: morph.
	container whenDisplayDo: [ self overlaysManager space show ].
	^ container
]

{ #category : #accessing }
PyramidSpacePresenter >> overlaysManager [

	^ overlaysManager
]

{ #category : #accessing }
PyramidSpacePresenter >> overlaysManager: newManager [

	self flag: #TODO. "overlaysManager space host = self makeSpacePresenter host "
	overlaysManager := newManager
]

{ #category : #accessing }
PyramidSpacePresenter >> presenter [
	^ presenter
]

{ #category : #accessing }
PyramidSpacePresenter >> presenter: anObject [

	presenter := anObject
]

{ #category : #'as yet unclassified' }
PyramidSpacePresenter >> pyramidRootsChanged [

	self updateRoots
]

{ #category : #initialization }
PyramidSpacePresenter >> resetFromPreviousPresenter: aSpacePresenter [

	| editor |
	editor :=( aSpacePresenter overlaysManager model at: #editor) object.
	(self overlaysManager model at: #editor) object: editor.

	self activeProject: aSpacePresenter activeProject.
	self activeProject removeObserver: aSpacePresenter.

	aSpacePresenter overlaysManager frontLayer overlayElement
		removeChildren.

	self updateRoots
]

{ #category : #accessing }
PyramidSpacePresenter >> updateRoots [

	| canvas |
	canvas := self overlaysManager frontLayer
		          overlayElement.
	canvas removeChildren.
	canvas addChildren: self activeProject roots
]
