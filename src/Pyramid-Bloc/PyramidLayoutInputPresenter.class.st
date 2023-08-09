Class {
	#name : #PyramidLayoutInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'buttonBasic',
		'buttonFlow',
		'buttonProportionnal',
		'whenValueChangedDo',
		'value'
	],
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #accessing }
PyramidLayoutInputPresenter >> buttonBasic [

	^ buttonBasic
]

{ #category : #accessing }
PyramidLayoutInputPresenter >> buttonFlow [

	^ buttonFlow
]

{ #category : #accessing }
PyramidLayoutInputPresenter >> buttonProportionnal [

	^ buttonProportionnal
]

{ #category : #layout }
PyramidLayoutInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self buttonBasic;
		  add: self buttonFlow;
		  add: self buttonProportionnal;
		  yourself
]

{ #category : #initialization }
PyramidLayoutInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :visibility |  ].
	buttonBasic := SpButtonPresenter new
		               label: 'No layout';
		               action: [
			               self value: BlBasicLayout new.
			               self whenValueChangedDo value: self value ];
		               enabled: false;
		               yourself.
	buttonFlow := SpButtonPresenter new
		              label: 'Flow';
		              action: [
			              self value: BlFlowLayout horizontal.
			              self whenValueChangedDo value: self value ];
		              enabled: false;
		              yourself.
	buttonProportionnal := SpButtonPresenter new
		                       label: 'ST layout';
		                       action: [
			                       self value:
					                       BlProportionalLayout new.
			                       self whenValueChangedDo value: self value ];
		                       enabled: false;
		                       yourself
]

{ #category : #initialization }
PyramidLayoutInputPresenter >> setBasic [

	self buttonBasic
		enabled: true;
		icon: (self iconNamed: #checkboxSelected).
	self buttonFlow
		enabled: true;
		icon: (self iconNamed: #checkboxUnselected).
	self buttonProportionnal
		enabled: true;
		icon: (self iconNamed: #checkboxUnselected)
]

{ #category : #initialization }
PyramidLayoutInputPresenter >> setFlow [

	self buttonBasic
		enabled: true;
		icon: (self iconNamed: #checkboxUnselected).
	self buttonFlow
		enabled: true;
		icon: (self iconNamed: #checkboxSelected).
	self buttonProportionnal
		enabled: true;
		icon: (self iconNamed: #checkboxUnselected)
]

{ #category : #initialization }
PyramidLayoutInputPresenter >> setProportionnal [

	self buttonBasic
		enabled: true;
		icon: (self iconNamed: #checkboxUnselected).
	self buttonFlow
		enabled: true;
		icon: (self iconNamed: #checkboxUnselected).
	self buttonProportionnal
		enabled: true;
		icon: (self iconNamed: #checkboxSelected)
]

{ #category : #initialization }
PyramidLayoutInputPresenter >> setUnknowValue [

	self buttonBasic
		enabled: false;
		icon: (self iconNamed: #checkboxUnselected).
	self buttonFlow
		enabled: false;
		icon: (self iconNamed: #checkboxUnselected).
	self buttonProportionnal
		enabled: false;
		icon: (self iconNamed: #checkboxUnselected)
]

{ #category : #'as yet unclassified' }
PyramidLayoutInputPresenter >> value [

	^ value
]

{ #category : #'as yet unclassified' }
PyramidLayoutInputPresenter >> value: anObject [

	value := anObject.
	anObject setLayoutOn: self
]

{ #category : #accessing }
PyramidLayoutInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidLayoutInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
