Trait {
	#name : #TPyPropertyChanger,
	#instVars : [
		'property'
	],
	#category : #'Pyramid-Editor-Properties-Changer'
}

{ #category : #comparing }
TPyPropertyChanger >> <= aPyViewProperty [

	^ self order <= aPyViewProperty order
]

{ #category : #'as yet unclassified' }
TPyPropertyChanger >> commandClass [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
TPyPropertyChanger >> initialize [

	property := PyPropertyMVC
		            build: self sectionName
		            withSingleForm: self singleFormClass
		            withMultiForm: self mutliFormClass
		            withCommand: self commandClass
]

{ #category : #'as yet unclassified' }
TPyPropertyChanger >> mutliFormClass [

	^ self shouldBeImplemented
]

{ #category : #accessing }
TPyPropertyChanger >> order [

	^ 0
]

{ #category : #accessing }
TPyPropertyChanger >> pipeline: aPyPipeline [

	self property pipeline: aPyPipeline
]

{ #category : #accessing }
TPyPropertyChanger >> property [
	^ property
]

{ #category : #'as yet unclassified' }
TPyPropertyChanger >> sectionName [
	^ self shouldBeImplemented 
]

{ #category : #accessing }
TPyPropertyChanger >> selection: aPyPipeline [

	self property selection: aPyPipeline
]

{ #category : #'as yet unclassified' }
TPyPropertyChanger >> singleFormClass [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
TPyPropertyChanger >> view [

	^ self property view
]
