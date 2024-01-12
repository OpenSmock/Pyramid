Trait {
	#name : #TPyramidWindowOpennable,
	#instVars : [
		'whenClosedDo',
		'title'
	],
	#category : #'Pyramid-views'
}

{ #category : #'api - showing' }
TPyramidWindowOpennable >> close [

	^ self closeWindow
]

{ #category : #'api - showing' }
TPyramidWindowOpennable >> closeWindow [

	self isOpen ifFalse: [ ^ self ].
	self presenter owner close
]

{ #category : #testing }
TPyramidWindowOpennable >> isClosed [

	^ self presenter owner ifNotNil: [ :w | w isClosed ] ifNil: [ true ]
]

{ #category : #testing }
TPyramidWindowOpennable >> isOpen [

	^ self isClosed not
]

{ #category : #'api - showing' }
TPyramidWindowOpennable >> open [

	^ self openWindow
]

{ #category : #'as yet unclassified' }
TPyramidWindowOpennable >> openWindow [

 self spec: self presenter asWindow open.
	self spec
		maximize;
		title: self title;
		aboutText: self class aboutText;
		whenClosedDo: [ self whenClosedDo value ].
	^ self spec
]

{ #category : #'api - showing' }
TPyramidWindowOpennable >> title [

	^ title
]

{ #category : #'api - showing' }
TPyramidWindowOpennable >> title: aString [

	title := aString.
	self isOpen ifTrue: [ self presenter owner title: aString ]
]

{ #category : #accessing }
TPyramidWindowOpennable >> whenClosedDo [

	^ whenClosedDo
]

{ #category : #accessing }
TPyramidWindowOpennable >> whenClosedDo: aBlock [

	whenClosedDo := aBlock.
]
