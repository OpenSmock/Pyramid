Class {
	#name : #PyramidHorizontalFrameConstraintsInputPresenter,
	#superclass : #PyramidAbstractFrameConstraintsInputPresenter,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidHorizontalFrameConstraintsInputPresenter >> helpCenter [

	^ 'Align the horizontal axis on the center of the shape.'
]

{ #category : #'as yet unclassified' }
PyramidHorizontalFrameConstraintsInputPresenter >> helpEnd [

	^ 'Align on the Right border.'
]

{ #category : #'as yet unclassified' }
PyramidHorizontalFrameConstraintsInputPresenter >> helpNull [

	^ 'Do not align horizontaly.'
]

{ #category : #'as yet unclassified' }
PyramidHorizontalFrameConstraintsInputPresenter >> helpStart [

	^ 'Align on the Left border.'
]

{ #category : #'as yet unclassified' }
PyramidHorizontalFrameConstraintsInputPresenter >> iconCenter [

	^ (self iconNamed: #windowMinimize) rotateBy: #left centerAt: 8 @ 8
]

{ #category : #'as yet unclassified' }
PyramidHorizontalFrameConstraintsInputPresenter >> iconEnd [

	^( self iconNamed: #windowMenu) rotateBy: -90
]

{ #category : #'as yet unclassified' }
PyramidHorizontalFrameConstraintsInputPresenter >> iconNull [

	^ self iconNamed: #windowMaximize
]

{ #category : #'as yet unclassified' }
PyramidHorizontalFrameConstraintsInputPresenter >> iconStart [

	^ (self iconNamed: #windowMenu) rotateBy: 90
]

{ #category : #'as yet unclassified' }
PyramidHorizontalFrameConstraintsInputPresenter >> value [

	self buttonNull state ifTrue: [ ^ BlHorizontalAlignment null ].
	self inputHasRelative state
		ifTrue: [
			self buttonStart state ifTrue: [
				^ (BlFrameLayoutConstraintsHorizontal new alignLeftAt:
					   self currentRelativeValue) alignment ].
			self buttonCenter state ifTrue: [
				^ (BlFrameLayoutConstraintsHorizontal new alignCenterAt:
					   self currentRelativeValue) alignment ].
			self buttonEnd state ifTrue: [
				^ (BlFrameLayoutConstraintsHorizontal new alignRightAt:
					   self currentRelativeValue) alignment ] ]
		ifFalse: [
			self buttonStart state ifTrue: [
				^ BlFrameLayoutConstraintsHorizontal new alignLeft alignment ].
			self buttonCenter state ifTrue: [
				^ BlFrameLayoutConstraintsHorizontal new alignCenter alignment ].
			self buttonEnd state ifTrue: [
				^ BlFrameLayoutConstraintsHorizontal new alignRight alignment ] ].
		^ PyramidUnknowState new.
]
