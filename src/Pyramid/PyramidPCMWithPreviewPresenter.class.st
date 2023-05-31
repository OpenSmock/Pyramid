Class {
	#name : #PyramidPCMWithPreviewPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'pcm',
		'preview',
		'presenterFromModelBlock'
	],
	#category : #'Pyramid-properties-custom'
}

{ #category : #layout }
PyramidPCMWithPreviewPresenter >> defaultLayout [

	^ SpPanedLayout newVertical
		  add: self pcm;
		  add: self preview;
		  yourself
]

{ #category : #initialization }
PyramidPCMWithPreviewPresenter >> initializePresenters [

	pcm := PyramidPCMWithTextFieldsPresenter new
		       packages: Smalltalk organization packages;
		       yourself.
	pcm whenSelectionChangedDo: [ :model | self updatePreviewWith: model ].
	preview := SpNullPresenter new.
]

{ #category : #accessing }
PyramidPCMWithPreviewPresenter >> pcm [
	^ pcm
]

{ #category : #accessing }
PyramidPCMWithPreviewPresenter >> presenterFromModelBlock [

	presenterFromModelBlock ifNil: [ presenterFromModelBlock := [ :model | SpNullPresenter new ] ].
	^ presenterFromModelBlock
]

{ #category : #accessing }
PyramidPCMWithPreviewPresenter >> presenterFromModelBlock: anObject [
presenterFromModelBlock:= anObject
]

{ #category : #accessing }
PyramidPCMWithPreviewPresenter >> preview [

	^ preview
]

{ #category : #accessing }
PyramidPCMWithPreviewPresenter >> preview: aPresenter [

	self layout second: aPresenter.
	preview := aPresenter
]

{ #category : #'as yet unclassified' }
PyramidPCMWithPreviewPresenter >> selectFromExternalRessource: anExternalRessource [

	self pcm selectFromExternalRessource: anExternalRessource
]

{ #category : #'as yet unclassified' }
PyramidPCMWithPreviewPresenter >> updatePreviewWith: model [

	| presenter |
	presenter := self presenterFromModelBlock
		             value: model. self
		             preview: presenter
]

{ #category : #initialization }
PyramidPCMWithPreviewPresenter >> whenSelectionChangedDo: aBlock [

	self pcm whenSelectionChangedDo: [ :model | self updatePreviewWith: model. aBlock value: model ]
]
