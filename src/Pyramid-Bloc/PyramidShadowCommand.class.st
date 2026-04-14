Class {
	#name : #PyramidShadowCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#instVars : [
		'lastSimpleShadow',
		'lastGaussianShadow'
	],
	#classInstVars : [
		'current'
	],
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidShadowCommand class >> current [
	current ifNil: [ current := self new ].
	^ current
]

{ #category : #accessing }
PyramidShadowCommand class >> resetShadowCommand [

	current := nil
]

{ #category : #'as yet unclassified' }
PyramidShadowCommand >> getValueFor: aBlElement [

	 ^ aBlElement effect 
]

{ #category : #accessing }
PyramidShadowCommand >> lastGaussianShadow [
    ^ lastGaussianShadow ifNil: [ BlGaussianShadowEffect color: Color black width: 2 offset: 2 @ 2 ]
]

{ #category : #accessing }
PyramidShadowCommand >> lastSimpleShadow [

	^ lastSimpleShadow ifNil: [
		  BlSimpleShadowEffect color: Color black offset: 2 @ 2 ]
]

{ #category : #'as yet unclassified' }
PyramidShadowCommand >> setValueFor: aBlElement with: anArgument [

	anArgument class = BlSimpleShadowEffect ifTrue: [
		lastSimpleShadow := anArgument ].
	anArgument class = BlGaussianShadowEffect ifTrue: [
		lastGaussianShadow := anArgument ].
	aBlElement effect: anArgument
]

{ #category : #'as yet unclassified' }
PyramidShadowCommand >> syncFromElement: aBlElement [

	aBlElement effect class = BlSimpleShadowEffect ifTrue: [
		lastSimpleShadow := aBlElement effect ].
	aBlElement effect class = BlGaussianShadowEffect ifTrue: [
		lastGaussianShadow := aBlElement effect ]
]
