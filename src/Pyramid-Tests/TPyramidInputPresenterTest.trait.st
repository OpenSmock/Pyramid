Trait {
	#name : 'TPyramidInputPresenterTest',
	#category : 'Pyramid-Tests-cases-specs-custom',
	#package : 'Pyramid-Tests',
	#tag : 'cases-specs-custom'
}

{ #category : 'accessing' }
TPyramidInputPresenterTest >> dummyValues [

	^ self shouldBeImplemented
]

{ #category : 'as yet unclassified' }
TPyramidInputPresenterTest >> equalityTestFor: object1 and: object2 [

	object1 isAssociation ifTrue: [ ^ object1 value = object2 ].
	object1 isCollection ifTrue: [ ^ object1 asArray = object2 asArray ].
	^ object1 = object2
]

{ #category : 'accessing' }
TPyramidInputPresenterTest >> expectedEmptyValue [

	^ PyramidEmptyValue new
]

{ #category : 'accessing' }
TPyramidInputPresenterTest >> expectedMixedValues [

	^ PyramidMixedValues new
]

{ #category : 'tests' }
TPyramidInputPresenterTest >> makeNewInput [

	^ self shouldBeImplemented 
]

{ #category : 'as yet unclassified' }
TPyramidInputPresenterTest >> makeNewInputWithModel [

	| input |
	input := self makeNewInput.
	input strings: input class stringsClass new.
	^ input
]

{ #category : 'as yet unclassified' }
TPyramidInputPresenterTest >> putValue: object onInput: input [

	object isAssociation ifTrue: [ input value: object key. ^ self ].
	 input value: object
]

{ #category : 'tests' }
TPyramidInputPresenterTest >> testEmptyValue [

	| input hasTrigger |
	hasTrigger := false.
	input := self makeNewInputWithModel.
	input whenValueChangedDo: [ :val | hasTrigger := true ].
	input emptyValue.
	self deny: hasTrigger.
	self assert: input value equals: self expectedEmptyValue
]

{ #category : 'tests' }
TPyramidInputPresenterTest >> testMixedValues [

	| input hasTrigger |
	hasTrigger := false.
	input := self makeNewInputWithModel.
	input whenValueChangedDo: [ :val | hasTrigger := true ].
	input mixedValues.
	self deny: hasTrigger.
	self assert: input value equals: self expectedMixedValues
]

{ #category : 'tests' }
TPyramidInputPresenterTest >> testTrigger [

	| input count current |
	count := 0.
	input := self makeNewInputWithModel.
	input whenValueChangedDo: [ :val |
		count := count + 1.
		current := val ].
	self dummyValues do: [ :each |
		current := Object new.
		self putValue: each onInput: input.
		self triggerValueChangedOf: input.
		self assert: input value equals: current ].
	self assert: self dummyValues size equals: count
]

{ #category : 'tests' }
TPyramidInputPresenterTest >> testValue [

	| input hasTrigger |
	hasTrigger := false.
	input := self makeNewInputWithModel.
	input whenValueChangedDo: [ :val | hasTrigger := true ].
	self dummyValues do: [ :each |
		self putValue: each onInput: input.
		self assert: (self equalityTestFor: each and: input value) ]
]

{ #category : 'as yet unclassified' }
TPyramidInputPresenterTest >> triggerValueChangedOf: anInput [

	self shouldBeImplemented
]
