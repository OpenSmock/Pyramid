Class {
	#name : 'PyramidVerticalFrameConstraintsInputPresenter',
	#superclass : 'PyramidAbstractFrameConstraintsInputPresenter',
	#category : 'Pyramid-Bloc-plugin-bloc-layout',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-layout'
}

{ #category : 'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> helpCenter [

	^ 'Align the vertical axis on the center of the shape.'
]

{ #category : 'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> helpEnd [

	^ 'Align on the Bottom border.'
]

{ #category : 'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> helpNull [

	^ 'Do not align vertically.'
]

{ #category : 'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> helpStart [

	^ 'Align on the Top border.'
]

{ #category : 'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> iconCenter [

	^ Smalltalk ui icons iconNamed: #windowMinimize
]

{ #category : 'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> iconEnd [

	^ Smalltalk ui icons iconNamed: #windowMenu
]

{ #category : 'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> iconNull [

	^ Smalltalk ui icons iconNamed: #windowMaximize
]

{ #category : 'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> iconStart [

	^ (Smalltalk ui icons iconNamed: #windowMenu) rotateBy: 180
]

{ #category : 'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> value [

	self buttonNull state ifTrue: [ ^ BlVerticalAlignment null ].
	self inputHasRelative state
		ifTrue: [
			self buttonStart state ifTrue: [
				^ (BlFrameLayoutConstraintsVertical new alignTopAt:
					   self currentRelativeValue) alignment ].
			self buttonCenter state ifTrue: [
				^ (BlFrameLayoutConstraintsVertical new alignCenterAt:
					   self currentRelativeValue) alignment ].
			self buttonEnd state ifTrue: [
				^ (BlFrameLayoutConstraintsVertical new alignBottomAt:
					   self currentRelativeValue) alignment ] ]
		ifFalse: [
			self buttonStart state ifTrue: [
				^ BlFrameLayoutConstraintsVertical new alignTop alignment ].
			self buttonCenter state ifTrue: [
				^ BlFrameLayoutConstraintsVertical new alignCenter alignment ].
			self buttonEnd state ifTrue: [
				^ BlFrameLayoutConstraintsVertical new alignBottom alignment ] ].
	^ PyramidUnknowState new
]
