Class {
	#name : #PyramidBlocWindowForLayoutPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'isFullScreenCheckbox',
		'extentInput',
		'layer'
	],
	#category : #'NeoPyramid-plugin-central'
}

{ #category : #layout }
PyramidBlocWindowForLayoutPresenter >> defaultLayout [

	^ SpBoxLayout newVertical spacing: 4; add: 'Window parameters'; add: self isFullScreenCheckbox; add: self extentInput; yourself.
]

{ #category : #'as yet unclassified' }
PyramidBlocWindowForLayoutPresenter >> extentChange: aPoint [

	self layer extent: aPoint
]

{ #category : #layout }
PyramidBlocWindowForLayoutPresenter >> extentInput [

	^ extentInput
]

{ #category : #'initialization - deprecated' }
PyramidBlocWindowForLayoutPresenter >> initializePresenter [

	isFullScreenCheckbox := SpCheckBoxPresenter new
		                        label: 'fullScreen';
		                        whenActivatedDo: [ self isFullScreen: true ];
		                        whenDeactivatedDo: [
			                        self isFullScreen: false ];
		                        yourself.

	extentInput := PyramidPointPresenter new whenSubmitDo: [ :point |
		               self extentChange: point ]
]

{ #category : #testing }
PyramidBlocWindowForLayoutPresenter >> isFullScreen: aBoolean [

	self layer isFullScreenModeEnabled: aBoolean.
	self extentInput enabled: aBoolean not.
	aBoolean ifFalse: [ self extentChange: self extentInput point ]
	
]

{ #category : #layout }
PyramidBlocWindowForLayoutPresenter >> isFullScreenCheckbox [
^ isFullScreenCheckbox
]

{ #category : #accessing }
PyramidBlocWindowForLayoutPresenter >> layer [

	^ layer
]

{ #category : #accessing }
PyramidBlocWindowForLayoutPresenter >> layer: aLayer [

	layer := aLayer.
	self extentInput point: aLayer extent.
	self isFullScreenCheckbox state: aLayer isFullScreenModeEnabled
]
