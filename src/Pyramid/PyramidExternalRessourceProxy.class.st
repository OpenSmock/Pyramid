Class {
	#name : 'PyramidExternalRessourceProxy',
	#superclass : 'Object',
	#instVars : [
		'object',
		'source'
	],
	#category : 'Pyramid-external-ressources',
	#package : 'Pyramid',
	#tag : 'external-ressources'
}

{ #category : 'as yet unclassified' }
PyramidExternalRessourceProxy class >> fromSource: aSource [

	^ self new
		  pyramidExternalRessourceSource: aSource;
		  pyramidExternalRessourceObject: aSource getRessource;
		  yourself
]

{ #category : 'as yet unclassified' }
PyramidExternalRessourceProxy >> doesNotUnderstand: aMessage [

	^ (self pyramidExternalRessourceObject respondsTo: aMessage selector)
		  ifTrue: [
			  self pyramidExternalRessourceObject
				  perform: aMessage selector
				  withEnoughArguments: aMessage arguments ]
		  ifFalse: [ super doesNotUnderstand: aMessage ]
]

{ #category : 'instance creation' }
PyramidExternalRessourceProxy >> fromSton: stonReader [

	stonReader parseMapDo: [ :key :value |
		key = #source ifTrue: [
			self pyramidExternalRessourceSource: value
			 ] ]
]

{ #category : 'accessing' }
PyramidExternalRessourceProxy >> pyramidExternalRessourceObject [

	object ifNil: [ object := self pyramidExternalRessourceSource getRessource ].
	^ object
]

{ #category : 'accessing' }
PyramidExternalRessourceProxy >> pyramidExternalRessourceObject: anObject [

	object := anObject
]

{ #category : 'accessing' }
PyramidExternalRessourceProxy >> pyramidExternalRessourceSource [

	^ source
]

{ #category : 'accessing' }
PyramidExternalRessourceProxy >> pyramidExternalRessourceSource: anObject [

	source := anObject
]

{ #category : 'as yet unclassified' }
PyramidExternalRessourceProxy >> stonOn: stonWriter [

	stonWriter
		writeObject: self
		streamMap: [ :map | map at: #source put: self pyramidExternalRessourceSource ]
]
