Class {
	#name : #PyViewGeometry,
	#superclass : #PyViewAbstract,
	#traits : 'PyBlocInput',
	#classTraits : 'PyBlocInput classTrait',
	#instVars : [
		'classListPresenter',
		'acceptButton',
		'formPresenter',
		'blElement'
	],
	#category : #'Pyramid-Deprecated'
}

{ #category : #'as yet unclassified' }
PyViewGeometry >> changeGeometry [

	blElement geometry: classListPresenter selectedItem new
]

{ #category : #layout }
PyViewGeometry >> defaultLayout [

	^ SpPanedLayout newLeftToRight
		  add: classListPresenter;
		  add: (SpBoxLayout newTopToBottom
				   add: formPresenter expand: true;
				   add: acceptButton expand: false; yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyViewGeometry >> getGeometryClasses [

	| classes |
	classes := BlElementGeometry allSubclasses select: [ :class | class isAbstract not. class isDeprecated not ].

	classListPresenter items = classes ifTrue: [ ^ self ].

	classListPresenter
		items: classes;
		selectIndex: 1
]

{ #category : #initialization }
PyViewGeometry >> initializePresenters [

	classListPresenter := self newList.
	formPresenter := self newNullPresenter.
	acceptButton := self newButton.
	acceptButton label: 'Change geometry'.
	acceptButton enabled: false.
	acceptButton action: [ self changeGeometry ].

	self getGeometryClasses.

	self focusOrder
		add: classListPresenter;
		add: formPresenter;
		add: acceptButton
]

{ #category : #accessing }
PyViewGeometry >> pageIcon [

	^ self iconNamed: #uncheckedBox
]

{ #category : #accessing }
PyViewGeometry >> pageTitle [

	^ 'Geometry'
]

{ #category : #'as yet unclassified' }
PyViewGeometry >> receiveNewBlElement: aBlElement [

	blElement := aBlElement.
	acceptButton enabled: true
]
