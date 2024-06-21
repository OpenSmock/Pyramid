Class {
	#name : 'PyramidQuizView',
	#superclass : 'BlElement',
	#instVars : [
		'game'
	],
	#category : 'Pyramid-Examples',
	#package : 'Pyramid-Examples'
}

{ #category : 'accessing' }
PyramidQuizView >> game [

	^ game
]

{ #category : 'accessing' }
PyramidQuizView >> game: anObject [

	game := anObject
]

{ #category : 'initialization' }
PyramidQuizView >> initialize [

	super initialize.
	self addChildren: self class pyston materializeAsBlElement.
	self constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ]
]
