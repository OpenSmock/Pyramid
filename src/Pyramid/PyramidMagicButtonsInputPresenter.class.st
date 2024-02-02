Class {
	#name : #PyramidMagicButtonsInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'valueArray',
		'buttonsSelected',
		'buttonsNotSelected',
		'whenValueChangedDo',
		'selectedIndex',
		'buttonUnknow'
	],
	#classInstVars : [
		'whenValueChangedDo'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #deprecated }
PyramidMagicButtonsInputPresenter class >> stringsClass [

	^ PyramidMagicButtonsModel
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonsInputPresenter >> applyStrings [

	self strings buttonsModel do: [ :each |
		self makeAssociatedButtonFor: each ].
	self selectedIndex: 0.
	self setUnknowValue
]

{ #category : #accessing }
PyramidMagicButtonsInputPresenter >> buttonUnknow [

	^ buttonUnknow
]

{ #category : #accessing }
PyramidMagicButtonsInputPresenter >> buttonsNotSelected [

	^ buttonsNotSelected
]

{ #category : #accessing }
PyramidMagicButtonsInputPresenter >> buttonsSelected [

	^ buttonsSelected
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonsInputPresenter >> defaultButtonsModel [

	^ PyramidMagicButtonsModel new
		  addButtonModel: (PyramidMagicButtonModel new
				   icon: (self iconNamed: #smallOk);
				   helpSelected: 'The value is ok.';
				   helpNotSelected: 'Set the value to ok.';
				   label: 'ok';
				   inputValue: #ok;
				   yourself);
		  addButtonModel: (PyramidMagicButtonModel new
				   icon: (self iconNamed: #smallCancel);
				   helpSelected: 'The value is cancel.';
				   helpNotSelected: 'Set the value to cancel.';
				label: 'cancel';
				   inputValue: #ok;
				   yourself);
		  yourself
]

{ #category : #layout }
PyramidMagicButtonsInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: SpNullPresenter new;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonsInputPresenter >> emptyValue [

	self selectedIndex: 0.
	 self setUnknowValue
]

{ #category : #accessing }
PyramidMagicButtonsInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :val |  ].
	valueArray := OrderedCollection new.
	buttonsSelected := OrderedCollection new.
	buttonsNotSelected := OrderedCollection new.
	buttonUnknow := SpButtonPresenter new label: 'Unknow'; yourself
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonsInputPresenter >> layoutFor: aButtonsCollection withSelectedIndex: index [

	| buttonsLayout |
	buttonsLayout := SpBoxLayout newHorizontal
		                 spacing: 4;
		                 yourself.
	1 to: aButtonsCollection size do: [ :i |
		i = index
			ifTrue: [
			buttonsLayout add: (aButtonsCollection at: i) expand: true ]
			ifFalse: [
				buttonsLayout
					add: (aButtonsCollection at: i)
					withConstraints: [ :c |
						c width: 24.
						c height: 24 ] ] ].
		^ buttonsLayout
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonsInputPresenter >> makeAssociatedButtonFor: aButtonModel [

	| buttonSelected buttonNotSelected |
	buttonSelected := SpButtonPresenter new
		                  icon: aButtonModel icon;
		                  help: aButtonModel helpSelected;
		                  label: aButtonModel label;
		                  yourself.
	buttonNotSelected := SpButtonPresenter new
		                     icon: aButtonModel icon;
		                     help: aButtonModel helpNotSelected;
		                     action: [
			                     self whenValueChangedDo value:
					                     aButtonModel inputValue ];
		                     yourself.

	self valueArray add: aButtonModel inputValue.
	self buttonsSelected  add: buttonSelected.
	self buttonsNotSelected  add: buttonNotSelected
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonsInputPresenter >> mixedValues [

	self selectedIndex: 0.
	self setUnknowValue
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonsInputPresenter >> selectedIndex [

	^ selectedIndex
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonsInputPresenter >> selectedIndex: anObject [

	selectedIndex := anObject
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonsInputPresenter >> setUnknowValue [

	| buttonsList |
	self selectedIndex: 0.
	buttonsList := { self buttonUnknow }
	               , self buttonsNotSelected asArray.
	buttonsList at: 1 put: (self buttonsSelected at: 1).
	self layout: (self layoutFor: buttonsList withSelectedIndex: 1)
]

{ #category : #accessing }
PyramidMagicButtonsInputPresenter >> strings [

	strings ifNil: [ strings := self defaultButtonsModel ].
	^ strings
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonsInputPresenter >> value [

	self selectedIndex = 0 ifTrue: [ ^ PyramidUnknowState new ].
	^ self valueArray at: self selectedIndex
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonsInputPresenter >> value: aValue [

	| buttonsList |
	self selectedIndex: (self valueArray indexOf: aValue).
	self selectedIndex = 0 ifTrue: [ self setUnknowValue. ^ self ].
	buttonsList := self buttonsNotSelected asArray.
	buttonsList at: self selectedIndex put: (self buttonsSelected at: self selectedIndex).
	self layout: (self layoutFor: buttonsList withSelectedIndex: self selectedIndex)
]

{ #category : #accessing }
PyramidMagicButtonsInputPresenter >> valueArray [

	^ valueArray
]

{ #category : #accessing }
PyramidMagicButtonsInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidMagicButtonsInputPresenter >> whenValueChangedDo: aBlockClosure [

	whenValueChangedDo := aBlockClosure
]
