Class {
	#name : #PyramidSinglePopingPresenterBuilder,
	#superclass : #PyramidPropertyPresenterBuilder,
	#instVars : [
		'popupPanel'
	],
	#category : #'Pyramid-property'
}

{ #category : #'as yet unclassified' }
PyramidSinglePopingPresenterBuilder >> build [

	| presenterAll layout |
	presenterAll := self buildPresenterAll.

	self cluster size > 1
		ifTrue: [
		layout := self buildLayoutAllGroupedAndIndividual: presenterAll ]
		ifFalse: [ layout := self buildLayoutOnlyForAll: presenterAll ].

	^ SpPresenter new
		  layout: layout;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSinglePopingPresenterBuilder >> buildLayoutAllGroupedAndIndividual: presenterAll [

	| buttonPopup |
	buttonPopup := SpButtonPresenter new
		               icon: (Smalltalk ui icons iconNamed: #edit);
		               help: 'Show groups and individuals values';
		               yourself.

	buttonPopup action: [
		self popupPanel lastPropertyShown: self property.
		self popupPanel
		name: self property name
		grouped: self buildPresentersGrouped
		individual: self buildPresentersIndividual.
		self popupPanel popup ].

	self updatePopupPanel.

	^ self layoutForAll: presenterAll buttonPopup: buttonPopup
]

{ #category : #'as yet unclassified' }
PyramidSinglePopingPresenterBuilder >> buildLayoutOnlyForAll: presenterAll [

	| buttonPopup |
	buttonPopup := SpButtonPresenter new
		               icon: (Smalltalk ui icons iconNamed: #edit);
		               enabled: false;
		               yourself.

	^ self layoutForAll: presenterAll buttonPopup: buttonPopup
]

{ #category : #'as yet unclassified' }
PyramidSinglePopingPresenterBuilder >> buildPresenterAll [

	| input |
	input := self makeNewInput.

	self cluster isEmpty ifTrue: [
		input emptyValue.
		^ input ].

	self cluster isTargetsSameArguments
		ifTrue: [ input value: self cluster groups first ]
		ifFalse: [ input mixedValues ].

	input whenValueChangedDo: [ :value |
		self property commandExecutor
			use: self property command
			on: self cluster allTargets
			with: value ].
	^ input
]

{ #category : #'as yet unclassified' }
PyramidSinglePopingPresenterBuilder >> buildPresenterWithButtonsFor: anAssociation withLabel: aString [

	| input buttonApplyToAll layout |
	input := self makeNewInput.
	input value: anAssociation key.
	input whenValueChangedDo: [ :value |
		self property commandExecutor
			use: self property command
			on: anAssociation value
			with: value ].

	buttonApplyToAll := SpButtonPresenter new
		                    icon: (Smalltalk ui icons iconNamed: #smallExpert);
		help: 'Apply this value to all selected elements.';
		                    action: [
			                    self property commandExecutor
				                    use: self property command
				                    on: self cluster allTargets
				                    with: input value ].
	layout := self
		          layoutForLabel: aString
		          input: input
		          button: buttonApplyToAll.
	^ SpPresenter new
		  layout: layout;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSinglePopingPresenterBuilder >> buildPresentersGrouped [

	| size label |
	self cluster isEmpty ifTrue: [ ^ {  } ].
	^ self cluster groupedAssociations associations collect: [ :each |
		  size := each value size.
		  label := size = 1
			           ifTrue: [ '1 element' ]
			           ifFalse: [ size printString , ' elements' ].
		  self buildPresenterWithButtonsFor: each withLabel: label ]
]

{ #category : #'as yet unclassified' }
PyramidSinglePopingPresenterBuilder >> buildPresentersIndividual [

	| label |
	self cluster isEmpty ifTrue: [ ^ {  } ].
	^ self cluster individualAssociations collect: [ :each |
		  label := each value first hash printString.
		  self buildPresenterWithButtonsFor: each withLabel: label ]
]

{ #category : #'as yet unclassified' }
PyramidSinglePopingPresenterBuilder >> layoutForAll: presenterAll buttonPopup: buttonPopup [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   vAlignCenter;
				   add: buttonPopup width: 24;
				   add: (SpLabelPresenter new
						    label: self property name;
						    displayBold: [ :t | true ];
						    yourself);
				   yourself)
		  height: 24;
		  add: presenterAll expand: false;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSinglePopingPresenterBuilder >> layoutForLabel: aString input: anInput button: aButton [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		vAlignCenter;
		  add: aString width: 80;
		  add: anInput;
		  add: aButton width: 24;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSinglePopingPresenterBuilder >> makeNewInput [

	^ self property inputPresenterClass new
		  inputModel: self property inputPresenterModel;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSinglePopingPresenterBuilder >> popupPanel [

	^ popupPanel
]

{ #category : #'as yet unclassified' }
PyramidSinglePopingPresenterBuilder >> popupPanel: anObject [

	popupPanel := anObject
]

{ #category : #'as yet unclassified' }
PyramidSinglePopingPresenterBuilder >> updatePopupPanel [

	self popupPanel lastPropertyShown = self property ifFalse: [ ^ self ].
	self popupPanel
		name: self property name
		grouped: self buildPresentersGrouped
		individual: self buildPresentersIndividual
]
