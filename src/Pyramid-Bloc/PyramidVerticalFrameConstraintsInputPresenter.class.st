Class {
	#name : #PyramidVerticalFrameConstraintsInputPresenter,
	#superclass : #PyramidAbstractFrameConstraintsInputPresenter,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> helpCenter [

	^ 'Align the vertical axis on the center of the shape.'
]

{ #category : #'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> helpEnd [

	^ 'Align on the Bottom border.'
]

{ #category : #'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> helpNull [

	^ 'Do not align vertically.'
]

{ #category : #'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> helpStart [

	^ 'Align on the Top border.'
]

{ #category : #'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> iconCenter [

	^ self iconNamed: #windowMinimize
]

{ #category : #'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> iconEnd [

	^ (self iconNamed: #windowMenu)
]

{ #category : #'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> iconNull [

	^ self iconNamed: #windowMaximize
]

{ #category : #'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenter >> iconStart [

	^ (self iconNamed: #windowMenu) rotateBy: 180
]

{ #category : #'as yet unclassified' }
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
