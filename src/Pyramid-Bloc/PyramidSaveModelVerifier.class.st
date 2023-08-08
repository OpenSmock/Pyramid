Class {
	#name : #PyramidSaveModelVerifier,
	#superclass : #Object,
	#instVars : [
		'nextVerifiers',
		'showBlock',
		'verifyBlock'
	],
	#category : #'Pyramid-Bloc-plugin-save'
}

{ #category : #constructor }
PyramidSaveModelVerifier class >> classIsValid [

	^ self new
		  verifyBlock: [ :model | model savingClassName isValidGlobalName ];
		  showBlock: [ :view | view showClassIsNotValidError ];
		  yourself.
		
]

{ #category : #constructor }
PyramidSaveModelVerifier class >> classPackageIsEqual [

	^ self new
		  verifyBlock: [ :model |
			  self class environment
				  at: model savingClassName asSymbol
				  ifPresent: [ :class |
					  class package name = model savingPackageName ]
				  ifAbsent: [ true ] ];
		  showBlock: [ :view | view showClassPackageIsNotEqualError ];
		  yourself
]

{ #category : #constructor }
PyramidSaveModelVerifier class >> methodIsValid [

	^ self new
		  verifyBlock: [ :model | model savingMethodName isValidSelector ];
		  showBlock: [ :view | view showMethodIsNotValidError ];
		  yourself.
		  
]

{ #category : #constructor }
PyramidSaveModelVerifier class >> modelNotNil [

	^ self new
		  verifyBlock: [ :model | model isNotNil ];
		  showBlock: [ :view | view showModelNilError ];
		  yourself
]

{ #category : #constructor }
PyramidSaveModelVerifier class >> packageIsValid [

	^ self new
		  verifyBlock: [ :model |
			  ($- split: model savingPackageName) allSatisfy: [ :each |
					  each isValidGlobalName ] ];
		  showBlock: [ :view | view showPackageIsNotValidError ];
		  yourself
]

{ #category : #constructor }
PyramidSaveModelVerifier class >> projectModelNotNil [

	^ self new
		  verifyBlock: [ :model | model projectModel isNotNil ];
		  showBlock: [ :view | view showProjectModelNilError ];
		  yourself
]

{ #category : #constructor }
PyramidSaveModelVerifier class >> verifierNoError [

	^ self modelNotNil addNext: (self projectModelNotNil addNext:
		  (self methodIsValid addNext: (self packageIsValid addNext:
				    (self classIsValid addNext: self classPackageIsEqual))))
]

{ #category : #constructor }
PyramidSaveModelVerifier class >> verifierNoErrorForInputsView [

	^ self modelNotNil addNext: (self projectModelNotNil addNext:
		  self methodIsValid;
		  addNext: self classIsValid;
		  addNext: (self packageIsValid addNext:
					   (self classIsValid addNext: self classPackageIsEqual)))
]

{ #category : #initialization }
PyramidSaveModelVerifier >> addNext: aVerifier [

	self nextVerifiers add: aVerifier
]

{ #category : #'as yet unclassified' }
PyramidSaveModelVerifier >> allErrors: aSaveModel [

	(self verifyBlock value: aSaveModel) ifFalse: [ ^ { self } ].
	^ self nextVerifiers flatCollect: [ :each | each allErrors: aSaveModel ]
]

{ #category : #'as yet unclassified' }
PyramidSaveModelVerifier >> initialize [

	super initialize.
	nextVerifiers := OrderedCollection new
]

{ #category : #'as yet unclassified' }
PyramidSaveModelVerifier >> nextVerifiers [
	^ nextVerifiers
]

{ #category : #accessing }
PyramidSaveModelVerifier >> showBlock [

	^ showBlock
]

{ #category : #accessing }
PyramidSaveModelVerifier >> showBlock: anObject [

	showBlock := anObject
]

{ #category : #'as yet unclassified' }
PyramidSaveModelVerifier >> showOn: aView [

	self showBlock value: aView.
]

{ #category : #drawing }
PyramidSaveModelVerifier >> verify: aModel [

	(self verifyBlock value: aModel) ifFalse: [ ^ false ].
	^ self nextVerifiers allSatisfy: [ :each | each verify: aModel ]
]

{ #category : #accessing }
PyramidSaveModelVerifier >> verifyBlock [

	^ verifyBlock.
]

{ #category : #accessing }
PyramidSaveModelVerifier >> verifyBlock: anObject [

	verifyBlock := anObject
]
