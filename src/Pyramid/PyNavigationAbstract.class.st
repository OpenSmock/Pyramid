Class {
	#name : #PyNavigationAbstract,
	#superclass : #SpPresenter,
	#category : #'Pyramid-Editor-Toolbar'
}

{ #category : #accessing }
PyNavigationAbstract class >> borderWidth [

	^ 4
]

{ #category : #private }
PyNavigationAbstract class >> buttonExtent [

	^ 32 asPoint
]

{ #category : #accessing }
PyNavigationAbstract class >> height [

	^ self buttonExtent y + (self borderWidth * 2)
]

{ #category : #testing }
PyNavigationAbstract class >> isAbstract [

	^ self == PyNavigationAbstract
]

{ #category : #'as yet unclassified' }
PyNavigationAbstract class >> spacingWidth [

	^ 4
]

{ #category : #'as yet unclassified' }
PyNavigationAbstract >> layoutAddButton: aButton On: alayout [

	alayout add: aButton withConstraints: [ :c | 
		c
			width: self class buttonExtent x;
			height: self class buttonExtent y ]
]

{ #category : #'as yet unclassified' }
PyNavigationAbstract >> layoutAddSpacingOn: aLayout [

	aLayout
				add: self middlePanel
				withConstraints: [ :c | c fill: true ]
]

{ #category : #'as yet unclassified' }
PyNavigationAbstract >> layoutBasicBox [

	^ SpBoxLayout newLeftToRight
		  spacing: self class spacingWidth;
		  borderWidth: self class borderWidth
]

{ #category : #'as yet unclassified' }
PyNavigationAbstract >> layoutFor: aCollectionOfButtons [

	| defaultlayout |
	defaultlayout := self layoutBasicBox.

	aCollectionOfButtons
		do: [ :button | self layoutAddButton: button On: defaultlayout.
			 ]
		separatedBy: [ self layoutAddSpacingOn: defaultlayout ].

	^ defaultlayout
]

{ #category : #'as yet unclassified' }
PyNavigationAbstract >> makeButton [

	| button |
	button := self newButton.
	button extent: self class buttonExtent.
	^ button
]

{ #category : #'as yet unclassified' }
PyNavigationAbstract >> makeButtonWithIcon: anIcon [

	| button |
	button := self makeButton.
	button icon: (self iconNamed: anIcon).
	^ button
]

{ #category : #'as yet unclassified' }
PyNavigationAbstract >> middlePanel [

	^ self newNullPresenter
]
