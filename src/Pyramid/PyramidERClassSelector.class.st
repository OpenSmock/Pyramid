Class {
	#name : #PyramidERClassSelector,
	#superclass : #PyramidExternalRessourceSource,
	#instVars : [
		'target',
		'selector'
	],
	#category : #'Pyramid-properties-external'
}

{ #category : #initialization }
PyramidERClassSelector class >> target: aClass selector: aSelector [

	^ self new
		  target: aClass;
		  selector: aSelector;
		  yourself
]

{ #category : #'instance creation' }
PyramidERClassSelector >> fromSton: stonReader [

	stonReader parseMapDo: [ :key :value |
		key = #target ifTrue: [
			self target: (self class environment classNamed: value) ].
		key = #selector ifTrue: [ self selector: value ] ]
]

{ #category : #'as yet unclassified' }
PyramidERClassSelector >> getRessource [

	^ self target perform: self selector
]

{ #category : #accessing }
PyramidERClassSelector >> selector [

	^ selector
]

{ #category : #accessing }
PyramidERClassSelector >> selector: anObject [

	selector := anObject
]

{ #category : #'as yet unclassified' }
PyramidERClassSelector >> stonOn: stonWriter [

	stonWriter
		writeObject: self
		streamMap: [ :map | map at: #selector put: self selector.  map at: #target put: self target name. ]
]

{ #category : #accessing }
PyramidERClassSelector >> target [

	^ target
]

{ #category : #accessing }
PyramidERClassSelector >> target: anObject [

	target := anObject
]
