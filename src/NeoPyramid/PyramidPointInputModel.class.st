Class {
	#name : #PyramidPointInputModel,
	#superclass : #PyramidInputModel,
	#instVars : [
		'labelX',
		'labelY'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #initialization }
PyramidPointInputModel >> initialize [

labelX := 'x'. labelY := 'y'
]

{ #category : #accessing }
PyramidPointInputModel >> labelX [

	^ labelX
]

{ #category : #accessing }
PyramidPointInputModel >> labelX: anObject [

	labelX := anObject
]

{ #category : #accessing }
PyramidPointInputModel >> labelY [

	^ labelY
]

{ #category : #accessing }
PyramidPointInputModel >> labelY: anObject [

	labelY := anObject
]
