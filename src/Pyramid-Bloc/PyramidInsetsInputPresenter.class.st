Class {
	#name : #PyramidInsetsInputPresenter,
	#superclass : #PyramidInputPresenter,
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#instVars : [
		'whenValueChangedDo',
		'buttonMode',
		'inputAll',
		'inputTop',
		'inputRight',
		'inputBottom',
		'inputLeft',
		'insetsMode'
	],
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #accessing }
PyramidInsetsInputPresenter >> buttonMode [

	^ buttonMode
]

{ #category : #initialization }
PyramidInsetsInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :insets |  ].
	buttonMode := SpButtonPresenter new
		              action: [
			              self insetsMode switchInsetsMode: self.
			              self whenValueChangedDo value: self value ];
		              yourself.
	inputAll := PyramidNumberInputPresenter new.
	inputTop := PyramidNumberInputPresenter new.
	inputRight := PyramidNumberInputPresenter new.
	inputBottom := PyramidNumberInputPresenter new.
	inputLeft := PyramidNumberInputPresenter new.
	inputTop whenChangedDo: [ :number |
		inputAll value: number.
		self whenValueChangedDo value: self value ].
	inputRight whenChangedDo: [ :number |
		inputAll value: number.
		self whenValueChangedDo value: self value ].
	inputBottom whenChangedDo: [ :number |
		inputAll value: number.
		self whenValueChangedDo value: self value ].
	inputLeft whenChangedDo: [ :number |
		inputAll value: number.
		self whenValueChangedDo value: self value ].
	inputAll whenValueChangedDo: [ :number |
		self whenValueChangedDo value: self value ].

	self setUnknowModeWithState: PyramidUnknowState new
]

{ #category : #'as yet unclassified' }
PyramidInsetsInputPresenter >> inputAll [

	^ inputAll
]

{ #category : #'as yet unclassified' }
PyramidInsetsInputPresenter >> inputBottom [

	^ inputBottom
]

{ #category : #'as yet unclassified' }
PyramidInsetsInputPresenter >> inputLeft [

	^ inputLeft
]

{ #category : #'as yet unclassified' }
PyramidInsetsInputPresenter >> inputRight [

	^ inputRight
]

{ #category : #'as yet unclassified' }
PyramidInsetsInputPresenter >> inputTop [
^ inputTop
]

{ #category : #accessing }
PyramidInsetsInputPresenter >> insetsMode [

	^ insetsMode
]

{ #category : #accessing }
PyramidInsetsInputPresenter >> insetsMode: aMode [

	insetsMode := aMode
]

{ #category : #initialization }
PyramidInsetsInputPresenter >> setAllMode [

	self insetsMode: PyramidAllInsetsMode new.
	self insetsMode setLayoutOf: self.
]

{ #category : #initialization }
PyramidInsetsInputPresenter >> setTopRightBottomLeftMode [

	self insetsMode: PyramidTopRightBottomLeftInsetsMode new.
	self insetsMode setLayoutOf: self
]

{ #category : #initialization }
PyramidInsetsInputPresenter >> setUnknowModeWithState: aState [

	self insetsMode: (PyramidUnknowInsetsMode new state: aState; yourself).
	self insetsMode setLayoutOf: self
]

{ #category : #'as yet unclassified' }
PyramidInsetsInputPresenter >> value [

	^ self insetsMode pyramidValueOf: self.
]

{ #category : #'as yet unclassified' }
PyramidInsetsInputPresenter >> value: aBlInsets [

	aBlInsets setInsetsOn: self
]

{ #category : #accessing }
PyramidInsetsInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidInsetsInputPresenter >> whenValueChangedDo: aBlock [

	whenValueChangedDo := aBlock
]
