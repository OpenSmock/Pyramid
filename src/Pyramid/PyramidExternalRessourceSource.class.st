Class {
	#name : #PyramidExternalRessourceSource,
	#superclass : #Object,
	#instVars : [
		'target',
		'selector',
		'arguments',
		'postConstructionBlock'
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
PyramidExternalRessourceSource class >> target: anObject selector: aSelector [

	^ self
		  target: anObject
		  selector: aSelector
		  arguments: {  }
		  postConstructionBlock: nil
]

{ #category : #initialization }
PyramidExternalRessourceSource class >> target: anObject selector: aSelector arguments: anArray [

	^ self
		  target: anObject
		  selector: aSelector
		  arguments: anArray
		  postConstructionBlock: nil
]

{ #category : #initialization }
PyramidExternalRessourceSource class >> target: anObject selector: aSelector arguments: anArray postConstructionBlock: aBlock [

	^ self new
		  target: anObject;
		  selector: aSelector;
		  arguments: anArray;
		  postConstructionBlock: aBlock;
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

	| ressource |
	ressource := self target
		             perform: self selector
		             withArguments: self arguments.
	self postConstructionBlock ifNotNil: [ :block |
		block value: ressource ].
	^ ressource
]

{ #category : #initialization }
PyramidExternalRessourceSource >> initialize [

	arguments := {  }.
	postConstructionBlock := nil.
]

{ #category : #accessing }
PyramidExternalRessourceSource >> postConstructionBlock [

	^ postConstructionBlock
]

{ #category : #accessing }
PyramidExternalRessourceSource >> postConstructionBlock: anObject [

	postConstructionBlock := anObject
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
	| accessors |
	accessors := OrderedCollection new.
	accessors addAll: { #target. #selector. #arguments }.
	self postConstructionBlock ifNotNil: [
		accessors add: #postConstructionBlock ].
	^ accessors
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
