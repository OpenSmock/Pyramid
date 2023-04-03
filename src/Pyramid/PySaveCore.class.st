Class {
	#name : #PySaveCore,
	#superclass : #Object,
	#instVars : [
		'saveModel',
		'roots',
		'validator'
	],
	#category : #'Pyramid-Plugin-Save'
}

{ #category : #accessing }
PySaveCore >> model [
saveModel ifNil: [ saveModel := PySaveModel new ].
^ saveModel
]

{ #category : #accessing }
PySaveCore >> model: aSaveModel [

	saveModel := aSaveModel
]

{ #category : #'as yet unclassified' }
PySaveCore >> pragmaSerialization [

	^ #pySTON
]

{ #category : #'as yet unclassified' }
PySaveCore >> pyStonString [

	| pySton methodText |
	pySton := BlSerializer serialize: self roots.
	methodText := '!' , self model defaultClassName , ' '.
	self model isClassSide ifTrue: [ methodText := methodText , 'class '. ].
	methodText := methodText , 'methodsFor: ''bloc-STON''!'.
	methodText := methodText , Character cr asString
	              , self model defaultMethodName , Character cr asString
	              , Character tab asString , '<pySTON>'
	              , Character cr asString , Character cr asString.
	methodText := methodText , Character cr asString
	              , Character tab asString , '^ ''' , pySton , '''! !'.
	^ methodText
]

{ #category : #accessing }
PySaveCore >> roots [

	roots ifNil: [ roots := {  } ].
	^ roots
]

{ #category : #accessing }
PySaveCore >> roots: aRoots [

	roots := aRoots
]

{ #category : #actions }
PySaveCore >> saveOrRaiseException [

	self validator validate: self model.
	CodeImporter evaluateString: self pyStonString
]

{ #category : #accessing }
PySaveCore >> validator [
	validator ifNil: [ validator := PySaveValidator new ].
	^ validator
]
