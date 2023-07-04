Class {
	#name : #PyramidSpacePresenterTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-Cases'
}

{ #category : #tests }
PyramidSpacePresenterTest >> testIsInteractive [

	self assert: Smalltalk isInteractiveGraphic
]

{ #category : #tests }
PyramidSpacePresenterTest >> testMakeSpacePresenter [

	| morphPresenter overlaysManager spec |
	self currentWorld displayWorld.
	overlaysManager := PyramidOverlaysManager new.
	morphPresenter := PyramidSpacePresenter new
		                  overlaysManager: overlaysManager;
		                  makeSpacePresenter.
	self
		assert: overlaysManager space host containerMorph
		equals: morphPresenter morph.
	self deny: overlaysManager space isOpened.

	spec := morphPresenter open.
	(Duration milliSeconds: 10) wait.
	self currentWorld doOneCycle.
	self assert: spec window isInWorld.
	self assert: overlaysManager space isOpened.

	spec close.
	(Duration milliSeconds: 10) wait.
	self currentWorld doOneCycle.
	self deny: spec window isInWorld.
	self deny: overlaysManager space isOpened
]

{ #category : #tests }
PyramidSpacePresenterTest >> testSpace [

	| space |
	space := BlSpace new.
	self deny: space isOpened.
	space show.
	(Duration milliSeconds: 100) wait.
	self assert: space isOpened.
	space close.
	(Duration milliSeconds: 100) wait.
	self deny: space isOpened
]

{ #category : #tests }
PyramidSpacePresenterTest >> testWorldRenderer [

	| worldRenderer |
	worldRenderer := self currentWorld worldState worldRenderer.
	self
		deny: [ worldRenderer class = BlMorphicWorldRenderer ]
		description: 'BlMorphicWorldRenderer'.
	self
		deny: [ worldRenderer class = NullWorldRenderer ]
		description: 'NullWorldRenderer'.
	self
		assert: [ worldRenderer class = OSWorldRenderer ]
		description: 'OSWorldRenderer'
]
