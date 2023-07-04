Class {
	#name : #PyramidSpacePresenterTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-Cases'
}

{ #category : #tests }
PyramidSpacePresenterTest >> testMakeSpacePresenter [

	| morphPresenter overlaysManager spec |
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
	self deny: overlaysManager space isOpened.
]
