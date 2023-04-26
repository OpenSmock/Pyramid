Class {
	#name : #PyramidSaveModelVerifier,
	#superclass : #Object,
	#instVars : [
		'verificators'
	],
	#category : #'NeoPyramid-plugin-save'
}

{ #category : #accessing }
PyramidSaveModelVerifier >> addVerificator: aBlock [

	self verificators add: aBlock
]

{ #category : #initialization }
PyramidSaveModelVerifier >> initialize [

	verificators := OrderedCollection new.
	self addVerificator: [ :model | model isNotNil ];
		            addVerificator: [ :model | model project isNotNil ];
		            addVerificator: [ :model |
			            model savingMethodName isValidSelector ];
		            addVerificator: [ :model |
			            model savingClassName isValidGlobalName ];
		            addVerificator: [ :model |
			            model savingPackageName isValidGlobalName ];
		            addVerificator: [ :model |
			            self class environment
				            at: model savingClassName
				            ifPresent: [ :class |
					            class package name = model savingPackageName ]
				            ifAbsent: [ true ] ];
		            yourself
]

{ #category : #accessing }
PyramidSaveModelVerifier >> verificators [
^ verificators
]

{ #category : #'as yet unclassified' }
PyramidSaveModelVerifier >> verify: aSaveModel [

	^ self verificators allSatisfy: [ :each | (each value: aSaveModel) ]
]
