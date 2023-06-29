Class {
	#name : #PyramidSpaceSwitchPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'spacePresenter',
		'editor'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #initialization }
PyramidSpaceSwitchPresenter >> defaultLayout [

	self spacePresenter ifNil: [ ^ SpBoxLayout newVertical ].
	^ SpBoxLayout newVertical
		  add: self spacePresenter;
		  yourself
]

{ #category : #accessing }
PyramidSpaceSwitchPresenter >> editor [

	^ editor
]

{ #category : #accessing }
PyramidSpaceSwitchPresenter >> editor: anObject [

	editor := anObject
]

{ #category : #initialization }
PyramidSpaceSwitchPresenter >> initializePresenters [

	spacePresenter := nil
]

{ #category : #initialization }
PyramidSpaceSwitchPresenter >> spacePresenter [
^spacePresenter
]

{ #category : #initialization }
PyramidSpaceSwitchPresenter >> spacePresenter: aSpacePresenter [

	| oldPresenter |
	oldPresenter := spacePresenter.
	spacePresenter := aSpacePresenter.

	oldPresenter ifNotNil: [ oldPresenter disconnectEditor ].
	spacePresenter connectOn: self editor.

	self layout: self defaultLayout.
	spacePresenter overlaysManager space show.
	spacePresenter updateRoots
]
