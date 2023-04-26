Class {
	#name : #PyramidSavingMethodBuilder,
	#superclass : #Object,
	#instVars : [
		'classifier',
		'comment',
		'pragma',
		'serializeBlock'
	],
	#category : #'NeoPyramid-plugin-save'
}

{ #category : #'as yet unclassified' }
PyramidSavingMethodBuilder class >> ston [

	^ self new
		  classifier: #'pyramid-serialized-bloc';
		  comment: 'This class has been generated.';
		  pragma: 'PySTON';
		  serializeBlock: [ :collection |
			  BlSerializer serialize: collection ];
		  yourself
]

{ #category : #'instance creation' }
PyramidSavingMethodBuilder >> build: aSaveModel [

	| result |
	result := '<1s><r>' expandMacrosWith: aSaveModel savingMethodName.
	self comment ifNotNil: [
		result := result , ('<t>"<1s>"<r>' expandMacrosWith: self comment) ].
	result := result , '<r>' expandMacros.
	self pragma ifNotNil: [
		result := result , ('<t>%<<1s>><r>' expandMacrosWith: self pragma) ].
	result := result , '<t>^ <1p>' expandMacrosWith:
		          (self serializedString: aSaveModel).

	^ result
]

{ #category : #accessing }
PyramidSavingMethodBuilder >> classifier [

	^ classifier
]

{ #category : #accessing }
PyramidSavingMethodBuilder >> classifier: anObject [

	classifier := anObject
]

{ #category : #accessing }
PyramidSavingMethodBuilder >> comment [

	^ comment
]

{ #category : #accessing }
PyramidSavingMethodBuilder >> comment: anObject [

	comment := anObject
]

{ #category : #accessing }
PyramidSavingMethodBuilder >> pragma [

	^ pragma
]

{ #category : #accessing }
PyramidSavingMethodBuilder >> pragma: anObject [

	pragma := anObject
]

{ #category : #accessing }
PyramidSavingMethodBuilder >> serializeBlock [

	^ serializeBlock
]

{ #category : #accessing }
PyramidSavingMethodBuilder >> serializeBlock: anObject [

	serializeBlock := anObject
]

{ #category : #'as yet unclassified' }
PyramidSavingMethodBuilder >> serializedString: aSaveModel [

	^ self serializeBlock value: aSaveModel project roots elements
]