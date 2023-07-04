Class {
	#name : #PyramidSpacePresenterTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-Cases'
}

{ #category : #tests }
PyramidSpacePresenterTest >> testMakeSpacePresenter [

	| morphPresenter overlaysManager |

	self currentWorld displayWorld.
	overlaysManager := PyramidOverlaysManager new.
	morphPresenter := PyramidSpacePresenter new
		                  overlaysManager: overlaysManager;
		                  makeSpacePresenter.
	self
		assert: overlaysManager space host containerMorph
		equals: morphPresenter morph.
	self deny: overlaysManager space isOpened
]
