Class {
	#name : #PyramidInputBuilder,
	#superclass : #Object,
	#instVars : [
		'inputClass',
		'noStateBlock',
		'singleStateBlock',
		'multiStatesBlock'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #factory }
PyramidInputBuilder class >> null [

	^ self new inputClass: SpNullPresenter; yourself
]

{ #category : #accessing }
PyramidInputBuilder class >> string [

	^ self new
		  inputClass: SpTextInputFieldPresenter;
		  noStateBlock: [ :input | input text: '# no element in selection' ];
		  singleStateBlock: [ :input :state | state arguments ifNil: [input text: ''] ifNotNil: [input text: state arguments ]];
		  multiStatesBlock: [ :input :state | input text: '# mixed values' ];
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidInputBuilder >> buildFromModel: aModel [

	^ self inputClass new
]

{ #category : #'as yet unclassified' }
PyramidInputBuilder >> buildFromSingleObject: each withState: aState [

	| input |
	input := self inputClass new.
	self singleState: aState to: input.
	^ input
]

{ #category : #accessing }
PyramidInputBuilder >> inputClass [

	^ inputClass 
]

{ #category : #accessing }
PyramidInputBuilder >> inputClass: aClass [

	inputClass:= aClass
]

{ #category : #'as yet unclassified' }
PyramidInputBuilder >> multiStates: aCollectionOfStates to: anInput [

	self multiStatesBlock value: anInput value: aCollectionOfStates
]

{ #category : #accessing }
PyramidInputBuilder >> multiStatesBlock [

	^ multiStatesBlock
]

{ #category : #accessing }
PyramidInputBuilder >> multiStatesBlock: anObject [

	multiStatesBlock := anObject
]

{ #category : #accessing }
PyramidInputBuilder >> noStateBlock [

	^ noStateBlock
]

{ #category : #accessing }
PyramidInputBuilder >> noStateBlock: anObject [

	noStateBlock := anObject
]

{ #category : #'as yet unclassified' }
PyramidInputBuilder >> noStateTo: anInput [

	self noStateBlock value: anInput
]

{ #category : #'as yet unclassified' }
PyramidInputBuilder >> singleState: aState to: anInput [

	self singleStateBlock value: anInput value: aState
	
]

{ #category : #accessing }
PyramidInputBuilder >> singleStateBlock [

	^ singleStateBlock
]

{ #category : #accessing }
PyramidInputBuilder >> singleStateBlock: anObject [

	singleStateBlock := anObject
]
