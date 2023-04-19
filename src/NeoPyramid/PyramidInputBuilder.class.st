Class {
	#name : #PyramidInputBuilder,
	#superclass : #Object,
	#instVars : [
		'inputClass',
		'noStateBlock',
		'singleStateBlock',
		'multiStatesBlock',
		'connectSubmitBloc',
		'submitBloc'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #factory }
PyramidInputBuilder class >> null [

	^ self new inputClass: SpNullPresenter; yourself
]

{ #category : #accessing }
PyramidInputBuilder class >> string: aPyramidProperty [

	^ self new
		  inputClass: SpTextInputFieldPresenter;
		  noStateBlock: [ :input | input text: '# no element in selection' ];
		  singleStateBlock: [ :input :state |
			  state arguments
				  ifNil: [ input text: '' ]
				  ifNotNil: [ input text: state arguments ] ];
		  multiStatesBlock: [ :input :state | input text: '# mixed values' ];
		  connectSubmitBloc: [ :input :targets |
			  input whenSubmitDo: [ :text |
					  text
						  ifEmpty: [ aPyramidProperty submit: nil on: targets ]
						  ifNotEmpty: [ aPyramidProperty submit: text on: targets ] ] ];
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidInputBuilder >> buildFromModel: aModel [

	| input |
	input := self inputClass new.
	self connectSubmitBloc
		value: input
		value: aModel allElements.
	^ input
]

{ #category : #'as yet unclassified' }
PyramidInputBuilder >> buildFromSingleObject: each withState: aState [

	| input |
	input := self inputClass new.
	self singleState: aState to: input.
	self connectSubmitBloc
		value: input
		value: { each }.
	^ input
]

{ #category : #'as yet unclassified' }
PyramidInputBuilder >> buildFromSingleObject: anObject withState: aState forModel: aModel [

	| input buttonApplyToState buttonApplyToModel|
	input := self buildFromSingleObject: anObject withState: aState.

	^ input
]

{ #category : #accessing }
PyramidInputBuilder >> connectSubmitBloc [

	connectSubmitBloc ifNil: [ connectSubmitBloc := [ :a :b | ] ].
	^ connectSubmitBloc
]

{ #category : #accessing }
PyramidInputBuilder >> connectSubmitBloc: anObject [

	connectSubmitBloc := anObject
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
