Trait {
	#name : #TPyramidCommandTest,
	#category : #'Pyramid-Tests-cases-plugin-bloc'
}

{ #category : #accessing }
TPyramidCommandTest >> command [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
TPyramidCommandTest >> targetContainers [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
TPyramidCommandTest >> targetsCanBeUsedFor [

	^ self targetContainers flatCollect: [ :each | { each targetNoProp . each targetWithProp } ].
]

{ #category : #'as yet unclassified' }
TPyramidCommandTest >> targetsCannotBeUsedFor [
	"override if needed"
	^ { nil . false . 0 . $a }
]

{ #category : #accessing }
TPyramidCommandTest >> targetsWithValuesAndValues [

	^ self targetContainers collect: [ :each |
		  each targetWithProp -> each prop ]
]

{ #category : #accessing }
TPyramidCommandTest >> targetsWithoutValuesAndValues [

	^ self targetContainers collect: [ :each | each targetNoProp -> each prop ]
]

{ #category : #tests }
TPyramidCommandTest >> testCanBeUsedFor [

	self targetsCanBeUsedFor do: [ :each |
		self assert: (self command canBeUsedFor: each) ].
	self targetsCannotBeUsedFor do: [ :each |
		self deny: (self command canBeUsedFor: each) ].
]

{ #category : #tests }
TPyramidCommandTest >> testGetValueFor [

	self targetsWithValuesAndValues do: [ :each |
		self assert: (self command getValueFor: each key) equals: each value ].
]

{ #category : #tests }
TPyramidCommandTest >> testSetValueForWith [

	self targetsWithoutValuesAndValues do: [ :each |
		self command setValueFor: each key with: each value.
		self assert: (self command getValueFor: each key) equals: each value ].
]
