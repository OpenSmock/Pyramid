Class {
	#name : #PyFormVisibility,
	#superclass : #PyFormAbstract,
	#instVars : [
		'dropList',
		'modelGone',
		'modelVisible',
		'modelHidden',
		'modelMixed'
	],
	#category : #'Pyramid-Editor-Properties-Form'
}

{ #category : #accessing }
PyFormVisibility >> currentValue [

	^ self dropList selectedItem visibility
]

{ #category : #accessing }
PyFormVisibility >> currentValue: aBlVisibility [

	self dropList disableSelectionDuring: [
		self dropList items: self modelSameValue.
		aBlVisibility isVisible ifTrue: [
			self dropList selectIndex: 1.
			^ self ].
		aBlVisibility isGone ifTrue: [
			self dropList selectIndex: 3.
			^ self ].
		self dropList selectIndex: 2 ]
]

{ #category : #layout }
PyFormVisibility >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self dropList expand: true;
		  yourself
]

{ #category : #'as yet unclassified' }
PyFormVisibility >> differentsValue [

	self dropList items: self modelDifferentsValue.
	self dropList selectItem: self modelMixed
]

{ #category : #accessing }
PyFormVisibility >> dropList [

	^ dropList
]

{ #category : #'as yet unclassified' }
PyFormVisibility >> emptyValue [

	self dropList selection unselectAll
]

{ #category : #accessing }
PyFormVisibility >> enabled: aBoolean [

	self dropList enabled: aBoolean
]

{ #category : #initialization }
PyFormVisibility >> initializePresenters [

	dropList := self newDropList.
	dropList
		items: self modelEmptyValue;
		display: [ :m | m label ];
		displayIcon: [ :m | m icon ];
		whenSelectedItemChangedDo: [ :m | self submitValue: m ]
]

{ #category : #'as yet unclassified' }
PyFormVisibility >> modelDifferentsValue [

	^ {self modelMixed.
		  self modelVisible.
		  self modelHidden.
		  self modelGone }
]

{ #category : #'as yet unclassified' }
PyFormVisibility >> modelEmptyValue [

	^ {}
]

{ #category : #'as yet unclassified' }
PyFormVisibility >> modelGone [

	modelGone ifNil: [ modelGone :=  (PyFormVisibilityModel new
			   visibility: BlVisibility gone;
			   label: 'gone';
			   icon: (self iconNamed: #haloDismiss)) ].
	^modelGone
]

{ #category : #'as yet unclassified' }
PyFormVisibility >> modelHidden [

	modelHidden ifNil: [
		modelHidden := PyFormVisibilityModel new
			             visibility: BlVisibility hidden;
			             label: 'hidden';
			             icon: (self iconNamed: #haloHelp) ].
	^ modelHidden
]

{ #category : #'as yet unclassified' }
PyFormVisibility >> modelMixed [

	modelMixed ifNil: [
		modelMixed := PyFormVisibilityModel new
			               visibility: nil;
			               label: self defaultMixedText;
			               icon: (self iconNamed: #'') ].
	^ modelMixed
]

{ #category : #'as yet unclassified' }
PyFormVisibility >> modelSameValue [

	^ {
		  self modelVisible.
		  self modelHidden.
		  self modelGone }
]

{ #category : #'as yet unclassified' }
PyFormVisibility >> modelVisible [

	modelVisible ifNil: [
		modelVisible := PyFormVisibilityModel new
			             visibility: BlVisibility visible;
			             label: 'visible';
			             icon: (self iconNamed: #haloView) ].
	^ modelVisible
]

{ #category : #'as yet unclassified' }
PyFormVisibility >> submitValue: aVisibilityModel [

	aVisibilityModel ifNil: [ ^ self ].
	aVisibilityModel visibility ifNil: [ ^ self ].
	self action value: aVisibilityModel visibility
]
