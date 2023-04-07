Class {
	#name : #PyramidGlobalView,
	#superclass : #SpPresenter,
	#instVars : [
		'leftView',
		'centerView',
		'rightView',
		'topView'
	],
	#category : #'NeoPyramid-views'
}

{ #category : #accessing }
PyramidGlobalView >> centerView [

	^ centerView
]

{ #category : #accessing }
PyramidGlobalView >> centerView: anObject [

	centerView := anObject.
	self updateLayout
]

{ #category : #layout }
PyramidGlobalView >> defaultLayout [

	| leftCenterRight centerRight |
	centerRight := SpPanedLayout newHorizontal
		               first: self centerView;
		               second: self rightView;
		               positionOfSlider: 3 / 4;
		               yourself.
	leftCenterRight := SpPanedLayout newHorizontal
		                   first: self leftView;
		                   second: centerRight;
		                   positionOfSlider: 1 / 5;
		                   yourself.
	^ SpBoxLayout newVertical spacing: 4;
		  add: self topView expand: false;
		  add: leftCenterRight expand: true;
		  yourself
]

{ #category : #initialization }
PyramidGlobalView >> initializePresenters [ 

	topView := PyramidButtonsBarView new.
	leftView := PyramidTabsContainerView new.
	centerView := PyramidTabsContainerView new.
	rightView := PyramidTabsContainerView new.
]

{ #category : #accessing }
PyramidGlobalView >> leftView [

	^ leftView
]

{ #category : #accessing }
PyramidGlobalView >> leftView: anObject [

	leftView := anObject.
	self updateLayout
]

{ #category : #accessing }
PyramidGlobalView >> rightView [

	^ rightView
]

{ #category : #accessing }
PyramidGlobalView >> rightView: anObject [

	rightView := anObject.
	self updateLayout
]

{ #category : #accessing }
PyramidGlobalView >> topView [

	^ topView
]

{ #category : #accessing }
PyramidGlobalView >> topView: anObject [

	topView := anObject.
	self updateLayout
]

{ #category : #private }
PyramidGlobalView >> updateLayout [
	self layout: self defaultLayout
]
