Class {
	#name : #PyramidSerializer,
	#superclass : #Object,
	#instVars : [
		'classifierName',
		'serializeBlock',
		'pragmaName',
		'comment'
	],
	#category : #'NeoPyramid-plugin-save'
}

{ #category : #accessing }
PyramidSerializer >> classifierName [

	^ classifierName
]

{ #category : #accessing }
PyramidSerializer >> classifierName: anObject [

	classifierName := anObject
]

{ #category : #accessing }
PyramidSerializer >> comment [
^ comment
]

{ #category : #accessing }
PyramidSerializer >> comment: anObject [

	comment:= anObject
]

{ #category : #'as yet unclassified' }
PyramidSerializer >> methodToCompile: aSelector withRoots: aCollection [

	self serializeBlock ifNil: [
		PyramidSerializerError signal: 'serializeBlock is missing.' ].

	self comment
		ifNil: [
			self pragmaName
				ifNil: [
					^ '<1s><r><r><t>^ <4p>'
						  expandMacrosWith: aSelector
						  with: self comment
						  with: self pragmaName
						  with: (self serializeBlock value: aCollection) ]
				ifNotNil: [
					^ '<1s><r><r><t>%<<2s>><r><t>^ <3p>'
						  expandMacrosWith: aSelector
						  with: self pragmaName
						  with: (self serializeBlock value: aCollection) ] ]
		ifNotNil: [
			self pragmaName
				ifNil: [
					^ '<1s><r><t>"<2s>"<r><r><t>^ <3p>'
						  expandMacrosWith: aSelector
						  with: self comment
						  with: (self serializeBlock value: aCollection) ]
				ifNotNil: [
					^ '<1s><r><t>"<2s>"<r><r><t>%<<3s>><r><t>^ <4p>'
						  expandMacrosWith: aSelector
						  with: self comment
						  with: self pragmaName
						  with: (self serializeBlock value: aCollection) ] ].

]

{ #category : #accessing }
PyramidSerializer >> pragmaName [

	^ pragmaName
]

{ #category : #accessing }
PyramidSerializer >> pragmaName: anObject [

	pragmaName := anObject
]

{ #category : #accessing }
PyramidSerializer >> serializeBlock [

	^ serializeBlock
]

{ #category : #accessing }
PyramidSerializer >> serializeBlock: anObject [

	serializeBlock := anObject
]

{ #category : #'serialize/materialize' }
PyramidSerializer >> serializeOnClass: aClass withSelector: aString withRoots: aCollection [

	aClass
		compile: (self methodToCompile: aString withRoots: aCollection)
		classified: self classifierName
]
