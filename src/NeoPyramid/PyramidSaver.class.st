Class {
	#name : #PyramidSaver,
	#superclass : #Object,
	#instVars : [
		'activeProject',
		'methodName',
		'saveClass',
		'classSide',
		'serializer'
	],
	#category : #'NeoPyramid-plugin-save'
}

{ #category : #'as yet unclassified' }
PyramidSaver class >> pystonSaver [

	^ self new serializer: (PyramidSerializer new
			   pragmaName: #PySTON;
			   classifierName: #'serialized-bloc';
			   comment:
				   'This class has been automaticly generated.<r><t>Use me with Pyramid.' expandMacros;
			   serializeBlock: [ :roots | BlSerializer serialize: roots ];
			   yourself)
]

{ #category : #accessing }
PyramidSaver >> activeProject [

	^ activeProject
]

{ #category : #accessing }
PyramidSaver >> activeProject: anObject [

	activeProject := anObject
]

{ #category : #testing }
PyramidSaver >> canSave [

	self saveClass ifNil: [ ^ false ].
	self methodName isEmptyOrNil ifTrue: [ ^ false ].
	self activeProject ifNil: [ ^ false ].
	^ true
]

{ #category : #'as yet unclassified' }
PyramidSaver >> errorCannotSave [

	self flag: #TODO. "Faire mieux l'erreur"
	^ PyramidSaverError signal: 'Can not save the class with xxxx'
]

{ #category : #testing }
PyramidSaver >> initialize [ 

	classSide := false
]

{ #category : #testing }
PyramidSaver >> isClassSide [
^ classSide
]

{ #category : #accessing }
PyramidSaver >> methodName [

	^ methodName
]

{ #category : #accessing }
PyramidSaver >> methodName: anObject [

	methodName := anObject
]

{ #category : #testing }
PyramidSaver >> onClass [

	classSide :=true
]

{ #category : #testing }
PyramidSaver >> onInstance [

	classSide := false
]

{ #category : #accessing }
PyramidSaver >> roots [

	^ self activeProject roots elements
]

{ #category : #actions }
PyramidSaver >> save [

	| savingClass |
	self canSave ifFalse: [ ^ self errorCannotSave ].
	savingClass := self isClassSide
		ifTrue: [self saveClass class
			 ]
		ifFalse: [
			self saveClass ].
			
	self serializer
				serializeOnClass: savingClass
				withSelector: self methodName
				withRoots: self roots
]

{ #category : #accessing }
PyramidSaver >> saveClass [

	^ saveClass
]

{ #category : #accessing }
PyramidSaver >> saveClass: anObject [

	saveClass := anObject
]

{ #category : #accessing }
PyramidSaver >> serializer [

	^ serializer
]

{ #category : #accessing }
PyramidSaver >> serializer: anObject [

	serializer := anObject
]
