Class {
	#name : #PyPropertyColor,
	#superclass : #PyPropertyAbstract,
	#instVars : [
		'morph'
	],
	#category : #'Pyramid-ZZZ-Deprecated-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyPropertyColor class >> property: aProperty toElement: aBlElement [

	aBlElement background: aProperty
]

{ #category : #'as yet unclassified' }
PyPropertyColor class >> propertyFromElement: aBlElement [

	
	^ aBlElement background
]

{ #category : #layout }
PyPropertyColor >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		  spacing: 5;
		  add: button expand: false;
		  add: preview;
		add: morph width: 10;
		  yourself
]

{ #category : #initialization }
PyPropertyColor >> initializeForm [

	presenter := PyFormSpecQuadrupleNumber
		             l1: 'r'
		             l2: 'g'
		             l3: 'b'
		             l4: 'a'.
	presenter whenInputChangedDo: [ :col | 
		self property: (Color r: (col at: 1) g: (col at: 2) b: (col at: 3) alpha: (col at: 4)).
		self apply ]
]

{ #category : #initialization }
PyPropertyColor >> initializePresenters [

	super initializePresenters.
	morph := SpMorphPresenter new.
]

{ #category : #accessing }
PyPropertyColor >> name [

	^ 'Color'
]

{ #category : #accessing }
PyPropertyColor >> property [

	^ property ifNil: [ ^ BlBackground transparent ]
]

{ #category : #initialization }
PyPropertyColor >> updateForm [

	| background paint color |
	morph morph: (Morph new color: Color black).
	background := self property.
	background class = BlPaintBackground
		ifFalse: [ self presenterForm value: { 0.0. 0.0. 0.0. 0.0 } ]
		ifTrue: [ 
			paint := background paint.
			paint class = BlColorPaint
				ifFalse: [ self presenterForm value: { 0.0. 0.0. 0.0. 0.0 } ]
				ifTrue: [ 
					color := paint color.
					button color: color.
					morph morph color: color.
					self presenterForm value: { 
							color red.
							color green.
							color blue.
							color alpha } ] ]
]
