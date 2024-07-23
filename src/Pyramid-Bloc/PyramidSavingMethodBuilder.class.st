Class {
	#name : #PyramidSavingMethodBuilder,
	#superclass : #Object,
	#instVars : [
		'classifier',
		'comment',
		'pragma',
		'serializeBlock'
	],
	#classInstVars : [
		'stash',
		'ston'
	],
	#category : #'Pyramid-Bloc-plugin-save'
}

{ #category : #'instance creation' }
PyramidSavingMethodBuilder >> build: aSaveModel [

	| result |
	result := '<1s><r>' expandMacrosWith: aSaveModel savingMethodName.
	self comment ifNotNil: [
		result := result
		          , ('<t>"<1s>"<r>' expandMacrosWith: self comment value) ].
	result := result , '<r>' expandMacros.
	self pragma ifNotNil: [
		result := result
		          , ('<t>%<<1s>><r>' expandMacrosWith: self pragma value) ].
	result := result
	          ,
	          ('<t>^ <1s>' expandMacrosWith:
		           (self serializedString: aSaveModel)).

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

	| roots |
	roots := aSaveModel projectModel firstLevelElements asArray sorted:
		         PyramidElevationSortFunction new.
	self flag: #FIX. "The roots must be sorted before saving or else the order on the roots will not be kept"
	^ self serializeBlock value: roots
]
