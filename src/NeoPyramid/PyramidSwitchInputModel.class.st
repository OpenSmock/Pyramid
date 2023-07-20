Class {
	#name : #PyramidSwitchInputModel,
	#superclass : #PyramidInputModel,
	#instVars : [
		'onLabel',
		'offLabel',
		'uncertainLabel'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #initialization }
PyramidSwitchInputModel >> initialize [

	super initialize.
	onLabel := ''.
	offLabel := ''. 
	uncertainLabel := ''
]

{ #category : #accessing }
PyramidSwitchInputModel >> offLabel [

	^ offLabel
]

{ #category : #accessing }
PyramidSwitchInputModel >> offLabel: anObject [

	offLabel := anObject
]

{ #category : #accessing }
PyramidSwitchInputModel >> onLabel [

	^ onLabel
]

{ #category : #accessing }
PyramidSwitchInputModel >> onLabel: anObject [

	onLabel := anObject
]

{ #category : #accessing }
PyramidSwitchInputModel >> uncertainLabel [

	^ uncertainLabel
]

{ #category : #accessing }
PyramidSwitchInputModel >> uncertainLabel: anObject [

	uncertainLabel := anObject
]
