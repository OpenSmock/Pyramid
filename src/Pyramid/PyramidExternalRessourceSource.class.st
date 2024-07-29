Class {
	#name : #PyramidExternalRessourceSource,
	#superclass : #Object,
	#instVars : [
		'target',
		'selector',
		'arguments'
	],
	#category : #'Pyramid-external-ressources'
}

{ #category : #initialization }
PyramidExternalRessourceSource class >> formFromFileNamed: aFileReference [

	^ self new
		  target: ImageReadWriter;
		  selector: #formFromFileNamed:;
		  arguments: {aFileReference asFileReference };
		  yourself
]

{ #category : #initialization }
PyramidExternalRessourceSource class >> target: aClass selector: aSelector [

	^ self new
		  target: aClass;
		  selector: aSelector;
		  yourself
]

{ #category : #initialization }
PyramidExternalRessourceSource class >> target: aClass selector: aSelector arguments: anArray [

	^ self new
		  target: aClass;
		  selector: aSelector;
		  arguments: anArray;
		  yourself
]

{ #category : #accessing }
PyramidExternalRessourceSource >> arguments [

	^ arguments
]

{ #category : #accessing }
PyramidExternalRessourceSource >> arguments: anObject [

	arguments := anObject
]

{ #category : #'instance creation' }
PyramidExternalRessourceSource >> fromSton: stonReader [

	stonReader parseMapDo: [ :key :value |
		key = #target ifTrue: [
			self target: value ].
		key = #selector ifTrue: [ self selector: value ].
		key = #arguments ifTrue: [ self arguments: value ] ]
]

{ #category : #'as yet unclassified' }
PyramidExternalRessourceSource >> getRessource [

	^ self target perform: self selector withArguments: self arguments
]

{ #category : #initialization }
PyramidExternalRessourceSource >> initialize [

	arguments := {  }
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
PyramidExternalRessourceSource >> stashAccessors [

	<stashAccessors>
	^ { #target . #selector . #arguments }
]

{ #category : #'as yet unclassified' }
PyramidExternalRessourceSource >> stonOn: stonWriter [

	stonWriter writeObject: self streamMap: [ :map |
		map at: #selector put: self selector.
		map at: #target put: self target.
		map at: #arguments put: self arguments ]
]

{ #category : #accessing }
PyramidExternalRessourceSource >> target [

	^ target
]

{ #category : #accessing }
PyramidExternalRessourceSource >> target: anObject [

	target := anObject
]
