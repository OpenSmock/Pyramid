Trait {
	#name : #TPyramidInputPresenterTest,
	#category : #'NeoPyramid-cases-property'
}

{ #category : #accessing }
TPyramidInputPresenterTest >> dummyValues [

	^ self shouldBeImplemented
]

{ #category : #tests }
TPyramidInputPresenterTest >> expectedEmptyValue [

	^ self shouldBeImplemented
]

{ #category : #tests }
TPyramidInputPresenterTest >> expectedMixedValues [

	^ self shouldBeImplemented
]

{ #category : #tests }
TPyramidInputPresenterTest >> makeNewInput [

	^ self shouldBeImplemented 
]

{ #category : #tests }
TPyramidInputPresenterTest >> testEmptyValue [

	| input hasTrigger |
	hasTrigger := false.
	input := self makeNewInput.
	input whenValueChangedDo: [ :val | hasTrigger := true ].
	input emptyValue.
	self deny: hasTrigger.
	self assert: input value equals: self expectedEmptyValue
	
]

{ #category : #tests }
TPyramidInputPresenterTest >> testMixedValues [

	| input hasTrigger |
	hasTrigger := false.
	input := self makeNewInput.
	input whenValueChangedDo: [ :val | hasTrigger := true ].
	input mixedValues.
	self deny: hasTrigger.
	self assert: input value equals: self expectedMixedValues
]

{ #category : #tests }
TPyramidInputPresenterTest >> testTrigger [

	| input count current |
	count := 0.
	current := Object new.
	input := self makeNewInput.
	input whenValueChangedDo: [ :val |
		count := count + 1.
		current := val ].
	self dummyValues do: [ :each |
		input value: each.
		self triggerValueChangedOf: input.
		self assert: input value equals: current ].
	self assert: self dummyValues size equals: count
]

{ #category : #tests }
TPyramidInputPresenterTest >> testValue [

	| input hasTrigger |
	hasTrigger := false.
	input := self makeNewInput.
	input whenValueChangedDo: [ :val | hasTrigger := true ].
	self dummyValues do: [ :each |
		input value: each.
		self deny: hasTrigger.
		self assert: input value equals: each ]
]

{ #category : #'as yet unclassified' }
TPyramidInputPresenterTest >> triggerValueChangedOf: anInput [

	self shouldBeImplemented 
]
