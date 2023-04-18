Class {
	#name : #PyramidPropertyOfAllPresenter,
	#superclass : #PyramidPropertyPresenter,
	#instVars : [
		'connectInputBlock',
		'inputClass',
		'setDefaultBlock'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyOfAllPresenter class >> string [
	| presenter |
	presenter := self new.
	presenter
		  inputClass: SpTextInputFieldPresenter;
		  connectInputBlock: [ :input :obj |
			  input whenTextChangedDo: [
					  presenter whenSubmitDo
						  value: (PyramidPipelineTarget new collection: { obj })
						  value: (PyramidCommandState new arguments: input text) ] ];
		  setDefaultBlock: [ :input :state | input text: state arguments ].
		^ presenter
]

{ #category : #adding }
PyramidPropertyOfAllPresenter >> add: anObject withState: aState toLayout: aLayout [

	| label input |
	label := SpLabelPresenter new label: anObject hash printString; yourself.
	input := self inputClass new.
	self setDefaultBlock value: input value: aState.
	self connectInputBlock value: input value: anObject.
	aLayout add: (SpBoxLayout newHorizontal
			 vAlignCenter;
			 spacing: 4;
			 add: label width: 70;
			 add: input expand: true;
			 yourself)
]

{ #category : #accessing }
PyramidPropertyOfAllPresenter >> connectInputBlock [

	connectInputBlock ifNil: [
		connectInputBlock := [ :presenter :object |  ] ].
	^ connectInputBlock
]

{ #category : #accessing }
PyramidPropertyOfAllPresenter >> connectInputBlock: aBlock [

	connectInputBlock := aBlock
]

{ #category : #layout }
PyramidPropertyOfAllPresenter >> defaultLayout [

	| defaultLayout |
	defaultLayout := SpBoxLayout newVertical
		                 spacing: 4;
		                 yourself.
	self model statesDictionary keysAndValuesDo: [ :key :value | value do: [ :element | self add: element withState: key toLayout: defaultLayout ] ].
	^ defaultLayout
]

{ #category : #'as yet unclassified' }
PyramidPropertyOfAllPresenter >> inputClass [

	inputClass ifNil: [ inputClass := SpNullPresenter ].
	^ inputClass
]

{ #category : #accessing }
PyramidPropertyOfAllPresenter >> inputClass: aSpPresenterClass [

	inputClass := aSpPresenterClass.
	self updateLayout
]

{ #category : #accessing }
PyramidPropertyOfAllPresenter >> setDefaultBlock [

	setDefaultBlock ifNil: [ setDefaultBlock := [ :presenter :state |  ] ].
	^ setDefaultBlock
]

{ #category : #accessing }
PyramidPropertyOfAllPresenter >> setDefaultBlock: aBlock [

	setDefaultBlock := aBlock
]

{ #category : #'as yet unclassified' }
PyramidPropertyOfAllPresenter >> statesDictonaryChanged [

	self updateLayout
]
