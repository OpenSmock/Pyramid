Class {
	#name : #PyramidShadowCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-visuals'
}

{ #category : #tests }
PyramidShadowCommandTest >> assert: anObject hasSamePropertiesAs: anotherObject [

	self assert: anObject color equals: anotherObject color.
	self assert: anObject offset equals: anotherObject offset.
	(anObject isKindOf: BlGaussianShadowEffect) ifTrue: [
		self assert: anObject width equals: anotherObject width ]
]

{ #category : #accessing }
PyramidShadowCommandTest >> command [

	^ PyramidShadowCommand new
]

{ #category : #accessing }
PyramidShadowCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    effect: (BlSimpleShadowEffect color: Color red offset: 2 @ 2);
					    yourself)
			   prop: (BlSimpleShadowEffect color: Color red offset: 2 @ 2)).
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    effect:
						    (BlGaussianShadowEffect
							     color: Color blue
							     width: 10
							     offset: 4 @ 4);
					    yourself)
			   prop:
			   (BlGaussianShadowEffect
				    color: Color blue
				    width: 10
				    offset: 4 @ 4)).
			 (PyramidCommandTestContainer
			   no: (BlElement new effect: BlOverlayEffect new)
			   with: (BlElement new
					    effect:
						    (BlGaussianShadowEffect
							     color: Color blue
							     width: 10
							     offset: 4 @ 4);
					    yourself)
			   prop:
			   (BlGaussianShadowEffect
				    color: Color blue
				    width: 10
				    offset: 4 @ 4)) }
]

{ #category : #tests }
PyramidShadowCommandTest >> testGetValueFor [

	self targetsWithValuesAndValues do: [ :each |
		self assert: (self command getValueFor: each key) hasSamePropertiesAs: each value ]
]

{ #category : #tests }
PyramidShadowCommandTest >> testHistory [
	"Do once.
	undo
	redo
	undo
	redo"

	| history commandExecutor targets |
	targets := self targetsCanBeUsedFor.
	history := PyramidHistory new.
	commandExecutor := PyramidHistoryCommandExecutor new
		                   history: history;
		                   wrappee: PyramidMainCommandExecutor new;
		                   yourself.

	"Do once"
	self argumentsForHistory do: [ :each |
		commandExecutor use: self command on: targets with: each ].

	"Undo all"
	self argumentsForHistory reverseDo: [ :argument |
			targets do: [ :target |
				self assert: (self command getValueFor: target) hasSamePropertiesAs: argument ].
			history canUndo ifTrue: [ history undo ] ].

	"Redo all"
	self argumentsForHistory do: [ :argument |
			history canRedo ifTrue: [ history redo ].
			targets do: [ :target |
				self assert: (self command getValueFor: target) hasSamePropertiesAs: argument ] ].

	"Undo all"
	self argumentsForHistory reverseDo: [ :argument |
			targets do: [ :target |
				self assert: (self command getValueFor: target) hasSamePropertiesAs: argument ].
			history canUndo ifTrue: [ history undo ] ].

	"Redo all"
	self argumentsForHistory do: [ :argument |
			history canRedo ifTrue: [ history redo ].
			targets do: [ :target |
				self assert: (self command getValueFor: target) hasSamePropertiesAs: argument ] ]
]
