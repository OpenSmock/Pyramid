Trait {
	#name : #TPySaveModelObserver,
	#instVars : [
		'selection',
		'aPySelection',
		'model'
	],
	#category : #'Pyramid-Plugin-Save'
}

{ #category : #accessing }
TPySaveModelObserver >> model [

	model ifNil: [
		model := PySaveModel new
			             addObserver: self;
			             yourself ].
	^ model
]

{ #category : #accessing }
TPySaveModelObserver >> model: aPySaveModel [

	self model removeObserver: self.
	model := aPySaveModel.
	model addObserver: self
]

{ #category : #'as yet unclassified' }
TPySaveModelObserver >> pySaveModelChanged [

	self shouldBeImplemented
]
