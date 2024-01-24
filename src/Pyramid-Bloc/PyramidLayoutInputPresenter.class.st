Class {
	#name : #PyramidLayoutInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'buttonsDictionary',
		'buttons',
		'whenValueChangedDo'
	],
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidLayoutInputPresenter >> allAssociationsLayoutClass [

	^ {
		  (BlBasicLayout -> #basic).
		  (BlLinearLayout -> #linear).
		  (BlFlowLayout -> #flow).
		  (BlFrameLayout -> #frame).
		  (BlProportionalLayout -> #proportionnal) }
]

{ #category : #'as yet unclassified' }
PyramidLayoutInputPresenter >> associatedClassOf: aLabel [

	| allClasses  |
	allClasses :=  self allAssociationsLayoutClass select: [ :each | each value = aLabel ]  thenCollect: [ :each | each key ].
	allClasses ifEmpty: [ ^ PyramidUnknowState new ].
	allClasses size = 1 ifTrue: [ ^ allClasses first new ].
	^ PyramidUnknowState new
]

{ #category : #accessing }
PyramidLayoutInputPresenter >> buttons [

	^ buttons
]

{ #category : #accessing }
PyramidLayoutInputPresenter >> buttonsDictionary [

	^ buttonsDictionary
]

{ #category : #layout }
PyramidLayoutInputPresenter >> defaultLayout [

	| defaultLayout currentLine counter |
	defaultLayout := SpBoxLayout newVertical
		                 spacing: 4;
		                 yourself.
	currentLine := SpBoxLayout newHorizontal spacing: 4.
	counter := 1.
	self buttons do: [ :each |
		currentLine add: each.
		counter := counter + 1.
		counter = 4 ifTrue: [
			defaultLayout add: currentLine.
			currentLine := SpBoxLayout newHorizontal spacing: 4.
			counter := 1 ] ].
	defaultLayout add: currentLine.
	^ defaultLayout
]

{ #category : #initialization }
PyramidLayoutInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :newVal | ].
	buttonsDictionary := Dictionary new.
	buttons := OrderedCollection new.
	self allAssociationsLayoutClass do: [ :association |
		| button |
		button := self makeButtonFor: association.
		buttons add: button.
		buttonsDictionary at: association key put: button ]
]

{ #category : #'as yet unclassified' }
PyramidLayoutInputPresenter >> makeButtonFor: anAssociation [

	| class label |
	class := anAssociation key.
	label := anAssociation value.

	^ SpButtonPresenter new
		  icon: class new asIcon;
		  label: label;
		  action: [ self triggerFor: class ];
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidLayoutInputPresenter >> triggerFor: aLayoutClass [

	self whenValueChangedDo value: aLayoutClass new.
	
]

{ #category : #'as yet unclassified' }
PyramidLayoutInputPresenter >> value [

	self buttons do: [ :each |
		each state ifTrue: [ ^ self associatedClassOf: each label ] ].
	^ PyramidUnknowState new.
]

{ #category : #'as yet unclassified' }
PyramidLayoutInputPresenter >> value: aLayout [

	self buttons do: [ :each | each state: false ].
	self buttonsDictionary
		at: aLayout class
		ifPresent: [ :button | button state: true ]
]

{ #category : #'as yet unclassified' }
PyramidLayoutInputPresenter >> valueButtons [
	"used for testing"

	^ self buttons select: [ :each | each state ]
]

{ #category : #'as yet unclassified' }
PyramidLayoutInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #'as yet unclassified' }
PyramidLayoutInputPresenter >> whenValueChangedDo: aBlock [

	whenValueChangedDo := aBlock
]
