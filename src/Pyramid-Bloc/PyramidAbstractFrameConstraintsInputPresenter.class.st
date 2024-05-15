Class {
	#name : 'PyramidAbstractFrameConstraintsInputPresenter',
	#superclass : 'PyramidInputPresenter',
	#instVars : [
		'buttonNull',
		'buttonStart',
		'buttonCenter',
		'buttonEnd',
		'inputHasRelative',
		'inputRelative',
		'whenValueChangedDo',
		'shouldTrigger'
	],
	#category : 'Pyramid-Bloc-plugin-bloc-layout',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-layout'
}

{ #category : 'testing' }
PyramidAbstractFrameConstraintsInputPresenter class >> isAbstract [

	^ self == PyramidAbstractFrameConstraintsInputPresenter
]

{ #category : 'layout' }
PyramidAbstractFrameConstraintsInputPresenter >> buttonCenter [

	^ buttonCenter
]

{ #category : 'layout' }
PyramidAbstractFrameConstraintsInputPresenter >> buttonEnd [

	^ buttonEnd
]

{ #category : 'layout' }
PyramidAbstractFrameConstraintsInputPresenter >> buttonNull [

	^ buttonNull
]

{ #category : 'layout' }
PyramidAbstractFrameConstraintsInputPresenter >> buttonStart [
	^ buttonStart
]

{ #category : 'initialization' }
PyramidAbstractFrameConstraintsInputPresenter >> connectPresenters [

	self inputHasRelative whenChangedDo: [ :aBoolean |
		self inputRelative enabled: aBoolean.
		self triggerValueChanged ].
	self inputRelative whenValueChangedDo: [ :aValue |
		self whenValueChangedDo value: self value ].
	self buttonNull action: [
		self selectNull.
		self triggerValueChanged ].
	self buttonStart action: [
		self selectStart.
		self triggerValueChanged ].
	self buttonCenter action: [
		self selectCenter.
		self triggerValueChanged ].
	self buttonEnd action: [
		self selectEnd.
		self triggerValueChanged. ]
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> currentRelativeValue [

	^ self inputRelative value isNumber ifTrue: [ ^ self inputRelative value ] ifFalse: [ ^ 0 ]
]

{ #category : 'layout' }
PyramidAbstractFrameConstraintsInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self buttonNull withConstraints: [ :c | c width: 32 ];
		  add: self buttonStart withConstraints: [ :c | c width: 32 ];
		  add: self buttonCenter withConstraints: [ :c | c width: 32 ];
		  add: self buttonEnd withConstraints: [ :c | c width: 32 ];
		  add: self inputHasRelative withConstraints: [ :c | c width: 64 ];
		  add: self inputRelative expand: true;
		  yourself
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> doNotTriggerWhile: aBlock [

	self shouldTrigger: false.
	aBlock value.
	self shouldTrigger: true.
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> helpCenter [

	^ self shouldBeImplemented
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> helpEnd [

	^ self shouldBeImplemented
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> helpNull [

	^ self shouldBeImplemented
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> helpStart [

	^ self shouldBeImplemented
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> iconCenter [

	^ self shouldBeImplemented
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> iconEnd [

	^ self shouldBeImplemented
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> iconNull [

	^ self shouldBeImplemented 
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> iconStart [

	^ self shouldBeImplemented
]

{ #category : 'initialization' }
PyramidAbstractFrameConstraintsInputPresenter >> initialize [

	super initialize.
	whenValueChangedDo := [ :newVal ]
]

{ #category : 'initialization' }
PyramidAbstractFrameConstraintsInputPresenter >> initializePresenters [

	buttonNull := SpButtonPresenter new
		              icon: self iconNull;
		              help: self helpNull;
		              yourself.
	buttonStart := SpButtonPresenter new
		               icon: self iconStart;
		               help: self helpStart;
		               yourself.
	buttonCenter := SpButtonPresenter new
		                icon: self iconCenter;
		                help: self helpCenter;
		                yourself.
	buttonEnd := SpButtonPresenter new
		             icon: self iconEnd;
		             help: self helpEnd;
		             yourself.
	inputHasRelative := SpCheckBoxPresenter new
		                    label: 'at:';
		                    state: true;
		                    yourself.
	inputRelative := PyramidNumberInputPresenter new value: 0; yourself
]

{ #category : 'layout' }
PyramidAbstractFrameConstraintsInputPresenter >> inputHasRelative [

	^ inputHasRelative
]

{ #category : 'layout' }
PyramidAbstractFrameConstraintsInputPresenter >> inputRelative [

	^ inputRelative
]

{ #category : 'initialization' }
PyramidAbstractFrameConstraintsInputPresenter >> selectCenter [
		self buttonNull state: false.
		self buttonStart state: false.
		self buttonCenter state: true.
		self buttonEnd state: false.
		
]

{ #category : 'initialization' }
PyramidAbstractFrameConstraintsInputPresenter >> selectEnd [
		self buttonNull state: false.
		self buttonStart state: false.
		self buttonCenter state: false.
		self buttonEnd state: true.
		
]

{ #category : 'initialization' }
PyramidAbstractFrameConstraintsInputPresenter >> selectNull [.
		self buttonNull state: true.
		self buttonStart state: false.
		self buttonCenter state: false.
		self buttonEnd state: false.
		
]

{ #category : 'initialization' }
PyramidAbstractFrameConstraintsInputPresenter >> selectStart [.
		self buttonNull state: false.
		self buttonStart state: true.
		self buttonCenter state: false.
		self buttonEnd state: false.
		
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> shouldTrigger [

	^ shouldTrigger
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> shouldTrigger: aBoolean [
shouldTrigger:=aBoolean
]

{ #category : 'initialization' }
PyramidAbstractFrameConstraintsInputPresenter >> triggerValueChanged [

	self shouldTrigger ifFalse: [ ^ self ].
	self whenValueChangedDo value: self value
]

{ #category : 'initialization' }
PyramidAbstractFrameConstraintsInputPresenter >> unselectAll [

	self buttonNull state: false.
	self buttonStart state: false.
	self buttonCenter state: false.
	self buttonEnd state: false
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> value [

	^ self shouldBeImplemented
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> value: aValue [

	self doNotTriggerWhile: [ aValue pyramidSelectOn: self ]
	
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : 'as yet unclassified' }
PyramidAbstractFrameConstraintsInputPresenter >> whenValueChangedDo: aBlock [

	whenValueChangedDo := aBlock.
]
