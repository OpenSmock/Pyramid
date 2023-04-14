Class {
	#name : #PyramidStateMaker,
	#superclass : #Object,
	#instVars : [
		'commands',
		'bidule'
	],
	#category : #'NeoPyramid-plugin-commands'
}

{ #category : #'as yet unclassified' }
PyramidStateMaker >> allVerificatorsSatisfy: aCollection [

	^ self commands allSatisfy: [ :command |
		  aCollection allSatisfy: [ :element |
			  command isExecutableBy: element ] ]
]

{ #category : #'as yet unclassified' }
PyramidStateMaker >> anyVerificatorsSatisfy: aCollection [

	^ self commands allSatisfy: [ :command | aCollection anySatisfy: [ :element | command isExecutableBy: element ]]
]

{ #category : #accessing }
PyramidStateMaker >> bidule [

	^ bidule
]

{ #category : #accessing }
PyramidStateMaker >> bidule: anObject [

	bidule := anObject
]

{ #category : #accessing }
PyramidStateMaker >> commands [

	^ commands
]

{ #category : #initialization }
PyramidStateMaker >> initialize [

	commands := Set new.
]

{ #category : #accessing }
PyramidStateMaker >> verificator [

	| verificator |
	verificator := PyramidAlwaysTrueVerifierStrategy  new.
	commands collect: [ :command |
		verificator := verificator + command verificator ].
	^ verificator
]
