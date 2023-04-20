Class {
	#name : #PyramidInputBuilderDeprecated,
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
PyramidInputBuilderDeprecated class >> null [

	^ self new inputClass: SpNullPresenter; yourself
]

{ #category : #accessing }
PyramidInputBuilderDeprecated class >> string: aPyramidProperty [

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
PyramidInputBuilderDeprecated >> buildFromModel: aModel [

	| input |
	input := self inputClass new.
	self connectSubmitBloc
		value: input
		value: aModel allElements.
	^ input
]

{ #category : #'as yet unclassified' }
PyramidInputBuilderDeprecated >> buildFromSingleObject: each withState: aState [

	| input |
	input := self inputClass new.
	self singleState: aState to: input.
	self connectSubmitBloc
		value: input
		value: { each }.
	^ input
]

{ #category : #'as yet unclassified' }
PyramidInputBuilderDeprecated >> buildFromSingleObject: anObject withState: aState forModel: aModel [

	| input buttonApplyToState buttonApplyToModel|
	input := self buildFromSingleObject: anObject withState: aState.

	^ input
]

{ #category : #accessing }
PyramidInputBuilderDeprecated >> connectSubmitBloc [

	connectSubmitBloc ifNil: [ connectSubmitBloc := [ :a :b | ] ].
	^ connectSubmitBloc
]

{ #category : #accessing }
PyramidInputBuilderDeprecated >> connectSubmitBloc: anObject [

	connectSubmitBloc := anObject
]

{ #category : #accessing }
PyramidInputBuilderDeprecated >> inputClass [

	^ inputClass 
]

{ #category : #accessing }
PyramidInputBuilderDeprecated >> inputClass: aClass [

	inputClass:= aClass
]

{ #category : #'as yet unclassified' }
PyramidInputBuilderDeprecated >> multiStates: aCollectionOfStates to: anInput [

	self multiStatesBlock value: anInput value: aCollectionOfStates
]

{ #category : #accessing }
PyramidInputBuilderDeprecated >> multiStatesBlock [

	^ multiStatesBlock
]

{ #category : #accessing }
PyramidInputBuilderDeprecated >> multiStatesBlock: anObject [

	multiStatesBlock := anObject
]

{ #category : #accessing }
PyramidInputBuilderDeprecated >> noStateBlock [

	^ noStateBlock
]

{ #category : #accessing }
PyramidInputBuilderDeprecated >> noStateBlock: anObject [

	noStateBlock := anObject
]

{ #category : #'as yet unclassified' }
PyramidInputBuilderDeprecated >> noStateTo: anInput [

	self noStateBlock value: anInput
]

{ #category : #'as yet unclassified' }
PyramidInputBuilderDeprecated >> singleState: aState to: anInput [

	self singleStateBlock value: anInput value: aState
	
]

{ #category : #accessing }
PyramidInputBuilderDeprecated >> singleStateBlock [

	^ singleStateBlock
]

{ #category : #accessing }
PyramidInputBuilderDeprecated >> singleStateBlock: anObject [

	singleStateBlock := anObject
]
