Class {
	#name : #PyramidSwitchInputStrings,
	#superclass : #PyramidInputStrings,
	#instVars : [
		'onLabel',
		'offLabel',
		'uncertainLabel'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #initialization }
PyramidSwitchInputStrings >> initialize [

	super initialize.
	onLabel := ''.
	offLabel := ''. 
	uncertainLabel := ''
]

{ #category : #accessing }
PyramidSwitchInputStrings >> offLabel [

	^ offLabel
]

{ #category : #accessing }
PyramidSwitchInputStrings >> offLabel: anObject [

	offLabel := anObject
]

{ #category : #accessing }
PyramidSwitchInputStrings >> onLabel [

	^ onLabel
]

{ #category : #accessing }
PyramidSwitchInputStrings >> onLabel: anObject [

	onLabel := anObject
]

{ #category : #accessing }
PyramidSwitchInputStrings >> uncertainLabel [

	^ uncertainLabel
]

{ #category : #accessing }
PyramidSwitchInputStrings >> uncertainLabel: anObject [

	uncertainLabel := anObject
]
