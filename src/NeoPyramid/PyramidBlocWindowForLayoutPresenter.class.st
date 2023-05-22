Class {
	#name : #PyramidBlocWindowForLayoutPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'isFullScreenCheckbox',
		'extentInput',
		'layer',
		'whenFullScreenChangedDo',
		'whenExtentChangedDo'
	],
	#category : #'NeoPyramid-plugin-central'
}

{ #category : #layout }
PyramidBlocWindowForLayoutPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpLabelPresenter new label: 'Window parameters'; displayBold: [ :a | true]; yourself);
		  add: self isFullScreenCheckbox;
		  add: self extentInput;
		  yourself
]

{ #category : #layout }
PyramidBlocWindowForLayoutPresenter >> extentInput [

	^ extentInput
]

{ #category : #'initialization - deprecated' }
PyramidBlocWindowForLayoutPresenter >> initializePresenter [

	isFullScreenCheckbox := SpCheckBoxPresenter new
		                        label: 'fullScreen';
		                        whenActivatedDo: [
			                        self whenFullScreenChangedDo value: true ];
		                        whenDeactivatedDo: [
			                        self whenFullScreenChangedDo value: false ];
		                        yourself.

	extentInput := PyramidPointPresenter new whenSubmitDo: [ :point |
		               self whenExtentChangedDo value: point ]
]

{ #category : #testing }
PyramidBlocWindowForLayoutPresenter >> isFullScreen: aBoolean [

	self isFullScreenCheckbox state: aBoolean
]

{ #category : #layout }
PyramidBlocWindowForLayoutPresenter >> isFullScreenCheckbox [
^ isFullScreenCheckbox
]

{ #category : #'as yet unclassified' }
PyramidBlocWindowForLayoutPresenter >> requestedExtent [

	^ self extentInput point
]

{ #category : #'as yet unclassified' }
PyramidBlocWindowForLayoutPresenter >> requestedExtent: aPoint [

	self extentInput point: aPoint
]

{ #category : #accessing }
PyramidBlocWindowForLayoutPresenter >> whenExtentChangedDo [
whenExtentChangedDo ifNil: [
		whenExtentChangedDo := [ :a |  ] ].
	^ whenExtentChangedDo
]

{ #category : #accessing }
PyramidBlocWindowForLayoutPresenter >> whenExtentChangedDo: aBlock [

	whenExtentChangedDo := aBlock
]

{ #category : #accessing }
PyramidBlocWindowForLayoutPresenter >> whenFullScreenChangedDo [

	whenFullScreenChangedDo ifNil: [whenFullScreenChangedDo := [ :a | ]].
	^ whenFullScreenChangedDo
]

{ #category : #accessing }
PyramidBlocWindowForLayoutPresenter >> whenFullScreenChangedDo: aBlock [

	whenFullScreenChangedDo:= aBlock
]
