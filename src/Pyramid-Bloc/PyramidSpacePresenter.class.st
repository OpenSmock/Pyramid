Class {
	#name : #PyramidSpacePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'presenter',
		'overlaysManager'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #layout }
PyramidSpacePresenter >> defaultLayout [

	^ SpBoxLayout newVertical add: self presenter; yourself
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

	morph := Morph new.
	morph layoutPolicy: TableLayout new.

	host := BlMorphicHost new.
	host containerMorph: morph.

	self overlaysManager space host: host.

	container morph: morph.
	container whenDisplayDo: [ self overlaysManager space show ].
	^ container
]

{ #category : #accessing }
PyramidSpacePresenter >> overlaysManager [

	^ overlaysManager
]

{ #category : #accessing }
PyramidSpacePresenter >> overlaysManager: anObject [

	overlaysManager := anObject
]

{ #category : #accessing }
PyramidSpacePresenter >> presenter [
	^ presenter
]

{ #category : #accessing }
PyramidSpacePresenter >> presenter: anObject [

	presenter := anObject
]

{ #category : #initialization }
PyramidSpacePresenter >> resetSpacePresenter [

	| previousPresenter |
	self overlaysManager space hide.
	previousPresenter := self presenter.
	self presenter: self makeSpacePresenter.
	self layout replace: previousPresenter with: self presenter.
	
]
