Class {
	#name : #PyramidAddStampPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'stampManagerPresenter',
		'treeTableAddStamp',
		'selectedStampToAdd',
		'addStampButton'
	],
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #adding }
PyramidAddStampPresenter >> addSelectedStampToElement [ 

	selectedStampToAdd ifNil: [ ^ self ].
	
	selectedStampToAdd command 
		setValueFor: self stampManagerPresenter currentSelectedElement 
		with: true.
		
	self refreshStampTreeTable.
]

{ #category : #accessing }
PyramidAddStampPresenter >> addStampButton [

	^ addStampButton
]

{ #category : #layout }
PyramidAddStampPresenter >> defaultLayout [

	| defaultLayout stampToolBarAddButton |
	
	defaultLayout := SpBoxLayout newVertical spacing: 6; yourself.
	
	stampToolBarAddButton := SpBoxLayout newHorizontal hAlignStart; yourself.
	stampToolBarAddButton add: addStampButton width: 380.
	
	defaultLayout add: treeTableAddStamp expand: true.
	defaultLayout add: stampToolBarAddButton expand: false.
	
	^ defaultLayout
]

{ #category : #'initialization - deprecated' }
PyramidAddStampPresenter >> initializePresenter [ 

	addStampButton := SpButtonPresenter new
								label: 'Add Stamp';
								icon: (Smalltalk ui icons iconNamed: #add);
								whenActivatedDo: [ self addSelectedStampToElement ].

	treeTableAddStamp := SpTreeTablePresenter new.
	treeTableAddStamp whenSelectedItemChangedDo: [ :aStampSelected | selectedStampToAdd := aStampSelected ].
	treeTableAddStamp addColumn: (SpCompositeTableColumn new
			title: 'List of stamps';
			addColumn: (SpStringTableColumn evaluated: #name);
			yourself).
]

{ #category : #adding }
PyramidAddStampPresenter >> refreshStampTreeTable [

		self stampManagerPresenter refreshStampTreeTable
]

{ #category : #accessing }
PyramidAddStampPresenter >> stampManagerPresenter [

	^ stampManagerPresenter
]

{ #category : #accessing }
PyramidAddStampPresenter >> stampManagerPresenter: aPyramidStampManagerPresenter [

	stampManagerPresenter := aPyramidStampManagerPresenter
]

{ #category : #accessing }
PyramidAddStampPresenter >> treeTableAddStamp [

	^ treeTableAddStamp
]
