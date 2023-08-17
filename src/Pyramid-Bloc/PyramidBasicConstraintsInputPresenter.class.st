Class {
	#name : #PyramidBasicConstraintsInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'buttonExact',
		'buttonMatchParent',
		'buttonFitContent',
		'whenValueChangedDo',
		'value'
	],
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #accessing }
PyramidBasicConstraintsInputPresenter >> buttonExact [

	^ buttonExact
]

{ #category : #accessing }
PyramidBasicConstraintsInputPresenter >> buttonFitContent [

	^ buttonFitContent
]

{ #category : #accessing }
PyramidBasicConstraintsInputPresenter >> buttonMatchParent [

	^ buttonMatchParent
]

{ #category : #layout }
PyramidBasicConstraintsInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self buttonExact;
add: self buttonMatchParent;
add: self buttonFitContent;
		  yourself
]

{ #category : #initialization }
PyramidBasicConstraintsInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :visibility |  ].
	buttonExact := SpButtonPresenter new
		               label: 'Exact';
							help: 'Set the constraints to an exact value in px.';
		               action: [
			               self value:
					               (BlLayoutCommonConstraintsAxis new exact: 50).
			               self whenValueChangedDo value: self value ];
		               enabled: false;
		               yourself.
	buttonMatchParent := SpButtonPresenter new
		                     label: 'Match Parent';
		help: 'Set the constraints to match the parent size.';
		                     action: [
			                     self value:
					                     BlLayoutCommonConstraintsAxis new
						                     matchParent.
			                     self whenValueChangedDo value: self value ];
		                     enabled: false;
		                     yourself.
	buttonFitContent := SpButtonPresenter new
		                    label: 'Fit Content';
		help: 'Set the constraints to match the children size.';
		                    action: [
			                    self value:
					                    BlLayoutCommonConstraintsAxis new fitContent.
			                    self whenValueChangedDo value: self value ];
		                    enabled: false;
		                    yourself
]

{ #category : #initialization }
PyramidBasicConstraintsInputPresenter >> setExact [

	self buttonExact
		enabled: true;
		icon: (self iconNamed: #checkboxSelected).
	self buttonFitContent
		enabled: true;
		icon: (self iconNamed: #checkboxUnselected).
	self buttonMatchParent
		enabled: true;
		icon: (self iconNamed: #checkboxUnselected)
]

{ #category : #initialization }
PyramidBasicConstraintsInputPresenter >> setFitContent [

	self buttonExact
		enabled: true;
		icon: (self iconNamed: #checkboxUnselected).
	self buttonFitContent
		enabled: true;
		icon: (self iconNamed: #checkboxSelected).
	self buttonMatchParent
		enabled: true;
		icon: (self iconNamed: #checkboxUnselected)
]

{ #category : #initialization }
PyramidBasicConstraintsInputPresenter >> setMatchParent [

	self buttonExact enabled: true; icon: (self iconNamed: #checkboxUnselected).
	self buttonFitContent enabled: true; icon: (self iconNamed: #checkboxUnselected).
	self buttonMatchParent enabled: true; icon: (self iconNamed: #checkboxSelected).
]

{ #category : #initialization }
PyramidBasicConstraintsInputPresenter >> setUnknowValue [

	self buttonExact enabled: false; icon: (self iconNamed: #checkboxUnselected).
	self buttonFitContent enabled: false; icon: (self iconNamed: #checkboxUnselected).
	self buttonMatchParent enabled: false; icon: (self iconNamed: #checkboxUnselected).
]

{ #category : #'as yet unclassified' }
PyramidBasicConstraintsInputPresenter >> value [

	^ value asPyramidConstraintsArgument
]

{ #category : #'as yet unclassified' }
PyramidBasicConstraintsInputPresenter >> value: aCommonConstraints [

	value := aCommonConstraints.
	aCommonConstraints setConstraintsOn: self
]

{ #category : #accessing }
PyramidBasicConstraintsInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidBasicConstraintsInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
