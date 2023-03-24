Class {
	#name : #PyNavigationZoom,
	#superclass : #PyNavigationAbstract,
	#instVars : [
		'buttonPlus',
		'buttonMinus',
		'valueInput',
		'buttonReset',
		'buttonCenter',
		'buttonCenterCallback'
	],
	#category : #'Pyramid-ZZZ-Deprecated-Editor-Toolbar'
}

{ #category : #accessing }
PyNavigationZoom >> climbRate [

	^ 10
]

{ #category : #accessing }
PyNavigationZoom >> default [

	^ 100
]

{ #category : #layout }
PyNavigationZoom >> defaultLayout [

	| defaultlayout |
	defaultlayout := self layoutBasicBox.
	self layoutAddButton: buttonMinus On: defaultlayout.
	self layoutAddButton: buttonPlus On: defaultlayout.
	defaultlayout add: valueInput withConstraints: [ :c | c width: 80 ].
	self layoutAddButton: buttonReset On: defaultlayout.
	self layoutAddButton: buttonCenter On: defaultlayout.

	^ defaultlayout
]

{ #category : #initialization }
PyNavigationZoom >> initializePresenters [

	buttonPlus := self makeButtonWithIcon: #remotesManagerAddRemote.
	buttonMinus := self makeButtonWithIcon: #remotesManagerRemoveRemote.
	buttonReset := self makeButtonWithIcon: #smallFullscreen.
	buttonCenter := self makeButtonWithIcon: #smallLoadProject.

	buttonPlus action: [ self zoomIncrease ].
	buttonMinus action: [ self zoomDecrease ].
	buttonReset action: [ valueInput number: self default ].
	buttonCenter action: [ buttonCenterCallback value ].

	valueInput := self newNumberInput.
	valueInput
		beInteger;
		minimum: self minimum;
		maximum: self maximum;
		number: self default;
		climbRate: self climbRate
]

{ #category : #accessing }
PyNavigationZoom >> maximum [

	^ 1000
]

{ #category : #accessing }
PyNavigationZoom >> minimum [

	^ 1
]

{ #category : #actions }
PyNavigationZoom >> whenButtonCenterPressedDo: aBloc [

	buttonCenterCallback := aBloc
]

{ #category : #actions }
PyNavigationZoom >> whenNumberChangedDo: aBloc [

	valueInput whenNumberChangedDo: aBloc
]

{ #category : #actions }
PyNavigationZoom >> zoomDecrease [

	| scale |
	scale := (valueInput number * 0.8) floor.
	valueInput number: (valueInput minimum max: scale)
]

{ #category : #actions }
PyNavigationZoom >> zoomIncrease [

	| scale |
	scale := (valueInput number * 1.25) floor max: 10.
	valueInput number: (valueInput maximum min: scale)
]
