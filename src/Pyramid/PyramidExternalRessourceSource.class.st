Class {
	#name : #PyramidExternalRessourceSource,
	#superclass : #Object,
	#instVars : [
		'target',
		'selector'
	],
	#category : #'Pyramid-external-ressources'
}

{ #category : #initialization }
PyramidExternalRessourceSource class >> target: aClass selector: aSelector [

	^ self new
		  target: aClass;
		  selector: aSelector;
		  yourself
]

{ #category : #'instance creation' }
PyramidExternalRessourceSource >> fromSton: stonReader [

	stonReader parseMapDo: [ :key :value |
		key = #target ifTrue: [
			self target: (self class environment classNamed: value) ].
		key = #selector ifTrue: [ self selector: value ] ]
]

{ #category : #'as yet unclassified' }
PyramidExternalRessourceSource >> getRessource [

	^ self target perform: self selector
]

{ #category : #accessing }
PyramidExternalRessourceSource >> selector [

	^ selector
]

{ #category : #accessing }
PyramidExternalRessourceSource >> selector: anObject [

	selector := anObject
]

{ #category : #'as yet unclassified' }
PyramidExternalRessourceSource >> stonOn: stonWriter [

	stonWriter
		writeObject: self
		streamMap: [ :map | map at: #selector put: self selector.  map at: #target put: self target name. ]
]

{ #category : #accessing }
PyramidExternalRessourceSource >> target [

	^ target
]

{ #category : #accessing }
PyramidExternalRessourceSource >> target: anObject [

	target := anObject
]
