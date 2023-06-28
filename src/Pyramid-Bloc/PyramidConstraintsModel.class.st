Class {
	#name : #PyramidConstraintsModel,
	#superclass : #Object,
	#instVars : [
		'icon',
		'title',
		'block',
		'targetClass',
		'associatedPresenter',
		'initializeBlock'
	],
	#category : #'Pyramid-Bloc-custom-specs-constraints'
}

{ #category : #'as yet unclassified' }
PyramidConstraintsModel class >> constraintsExact [

	^ self new
		  title: 'Exact';
		  icon: (self iconNamed: #smallNew);
		targetClass: BlLayoutExactResizer;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidConstraintsModel class >> constraintsExactHorizontal [

	| inputNumber |
	inputNumber := PyramidNumberPresenter new
		               number: 50;
		               yourself.
	^ self constraintsExact
		  associatedPresenter: inputNumber;
		  block: [ :c |
			  inputNumber number ifNotNil: [ :n | c horizontal exact: n ] ];
		  initializeBlock: [ :presenter |
			  inputNumber whenSubmitDo: [ :n | presenter whenSubmitDo value ] ];
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidConstraintsModel class >> constraintsExactVertical [

	| inputNumber |
	inputNumber := PyramidNumberPresenter new
		               number: 50;
		               yourself.
	^ self constraintsExact
		  associatedPresenter: inputNumber;
		  block: [ :c |
			  inputNumber number ifNotNil: [ :n | c vertical exact: n ] ];
		  initializeBlock: [ :presenter |
			  inputNumber whenSubmitDo: [ :n | presenter whenSubmitDo value ] ];
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidConstraintsModel class >> constraintsFitContent [

	^ self new
		  title: 'Fit Content';
		  icon: (self iconNamed: #glamorousZoomToFit);
		targetClass: BlLayoutFitContentResizer;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidConstraintsModel class >> constraintsFitContentHorizontal [

	^ self constraintsFitContent
		  associatedPresenter: SpNullPresenter new;
		  block: [ :c |
			  c horizontal fitContent  ];
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidConstraintsModel class >> constraintsFitContentVertical [

	^ self constraintsFitContent
		  associatedPresenter: SpNullPresenter new;
		  block: [ :c | c vertical fitContent ];
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidConstraintsModel class >> constraintsMatchParent [

	^ self new
		  title: 'Match parent';
		  icon: (self iconNamed: #smallFullscreen);
		targetClass: BlLayoutMatchParentResizer;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidConstraintsModel class >> constraintsMatchParentHorizontal [

	^ self constraintsMatchParent
		  associatedPresenter: SpNullPresenter new;
		  block: [ :c | c horizontal matchParent ];
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidConstraintsModel class >> constraintsMatchParentVertical [

	^ self constraintsMatchParent
		  associatedPresenter: SpNullPresenter new;
		  block: [ :c | c vertical matchParent ];
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidConstraintsModel class >> constraintsMixed [

	^ self new
		  title: 'Mixed Value';
		  icon: (self iconNamed: #smallNew);
		  targetClass: nil;
		  yourself
]

{ #category : #factory }
PyramidConstraintsModel class >> horizontal [

	^ {
		  self constraintsExactHorizontal.
		  self constraintsMatchParentHorizontal.
		  self constraintsFitContentHorizontal }
]

{ #category : #factory }
PyramidConstraintsModel class >> horizontalMixed [

	^ { self constraintsMixed } , self horizontal
]

{ #category : #factory }
PyramidConstraintsModel class >> vertical [

	^ {
		  self constraintsExactVertical.
		  self constraintsMatchParentVertical.
		  self constraintsFitContentVertical }
]

{ #category : #factory }
PyramidConstraintsModel class >> verticalMixed [

	^ { self constraintsMixed } , self vertical
]

{ #category : #accessing }
PyramidConstraintsModel >> associatedPresenter [

	^ associatedPresenter
]

{ #category : #accessing }
PyramidConstraintsModel >> associatedPresenter: anObject [

	associatedPresenter := anObject
]

{ #category : #accessing }
PyramidConstraintsModel >> block [

	^ block
]

{ #category : #accessing }
PyramidConstraintsModel >> block: anObject [

	block := anObject
]

{ #category : #accessing }
PyramidConstraintsModel >> icon [

	^ icon
]

{ #category : #accessing }
PyramidConstraintsModel >> icon: anObject [

	icon := anObject
]

{ #category : #accessing }
PyramidConstraintsModel >> initializeBlock [

	initializeBlock ifNil: [ initializeBlock := [ :n |  ] ].
	^ initializeBlock
]

{ #category : #accessing }
PyramidConstraintsModel >> initializeBlock: anObject [

	initializeBlock := anObject
]

{ #category : #accessing }
PyramidConstraintsModel >> targetClass [

	^ targetClass
]

{ #category : #accessing }
PyramidConstraintsModel >> targetClass: anObject [

	targetClass := anObject
]

{ #category : #accessing }
PyramidConstraintsModel >> title [

	^ title
]

{ #category : #accessing }
PyramidConstraintsModel >> title: anObject [

	title := anObject
]
