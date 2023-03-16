Class {
	#name : #PyPropertyInsets,
	#superclass : #PyPropertyAbstract,
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #testing }
PyPropertyInsets class >> isAbstract [

	^ self == PyPropertyInsets
]

{ #category : #initialization }
PyPropertyInsets >> initializeForm [

	presenter := PyFormSpecQuadrupleNumberOrAll
		             l1: 'top'
		             l2: 'right'
		             l3: 'bottom'
		             l4: 'left'.

	presenter whenInputChangedDo: [ :collection | 
		self property: (BlInsets
				 top: (collection at: 1)
				 right: (collection at: 2)
				 bottom: (collection at: 3)
				 left: (collection at: 4)).
		self apply ].

	presenter whenAllChangedDo: [ :val | 
		self property: (BlInsets all: val).
		self apply ]
]

{ #category : #accessing }
PyPropertyInsets >> property [

	^ property ifNil: [ BlInsets empty ]
]

{ #category : #initialization }
PyPropertyInsets >> updateForm [

	| mar |
	mar := self property.
	self presenterForm value: { 
			mar top.
			mar right.
			mar bottom.
			mar left }
]
