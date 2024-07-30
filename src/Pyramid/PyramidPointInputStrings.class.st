Class {
	#name : #PyramidPointInputStrings,
	#superclass : #PyramidInputStrings,
	#instVars : [
		'labelX',
		'labelY'
	],
	#category : 'Pyramid-specs-custom'
}

{ #category : #initialization }
PyramidPointInputStrings >> initialize [

	super initialize.
	labelX := 'x'.
	labelY := 'y'
]

{ #category : #accessing }
PyramidPointInputStrings >> labelX [

	^ labelX
]

{ #category : #accessing }
PyramidPointInputStrings >> labelX: anObject [

	labelX := anObject
]

{ #category : #accessing }
PyramidPointInputStrings >> labelY [

	^ labelY
]

{ #category : #accessing }
PyramidPointInputStrings >> labelY: anObject [

	labelY := anObject
]
