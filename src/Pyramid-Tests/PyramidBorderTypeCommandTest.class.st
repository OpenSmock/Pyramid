Class {
	#name : #PyramidBorderTypeCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-visuals'
}

{ #category : #accessing }
PyramidBorderTypeCommandTest >> command [

	^ PyramidBorderPaintCommand new
]

{ #category : #'as yet unclassified' }
PyramidBorderTypeCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    border: (BlBorderBuilder new paint: Color red; build);
					    yourself)
			   with: (BlElement new
					    border: (BlBorderBuilder new paint: Color blue; build);
					    yourself)
			   prop: Color blue asBlPaint).
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    border:
						    (BlBorderBuilder new paint: (BlRadialGradientPaint new
									      stops: {
											      (0.0 -> Color random).
											      (1.0 -> Color random) };
									      innerCenter: 50 @ 50;
									      innerRadius: 0;
									      outerCenter: 50 @ 50;
									      outerRadius: 50;
									      yourself); build);
					    yourself)
			   prop: (BlRadialGradientPaint new
					    stops: {
							    (0.0 -> Color random).
							    (1.0 -> Color random) };
					    innerCenter: 50 @ 50;
					    innerRadius: 0;
					    outerCenter: 50 @ 50;
					    outerRadius: 50;
					    yourself)) }
]

{ #category : #tests }
PyramidBorderTypeCommandTest >> testGetValueFor [

	self targetsWithValuesAndValues do: [ :each |
		self
			assert: (self command getValueFor: each key) class
			equals: each value value class ]
]

{ #category : #tests }
PyramidBorderTypeCommandTest >> testHistory [
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
			self assert: (self command getValueFor: target) class equals: argument value class ].
		history canUndo ifTrue: [ history undo ] ].

	"Redo all"
	self argumentsForHistory do: [ :argument |
		history canRedo ifTrue: [ history redo ].
		targets do: [ :target |
			self assert: (self command getValueFor: target)class equals: argument value class ] ].

	"Undo all"
	self argumentsForHistory reverseDo: [ :argument |
		targets do: [ :target |
			self assert: (self command getValueFor: target)class equals: argument value class].
		history canUndo ifTrue: [ history undo ] ].

	"Redo all"
	self argumentsForHistory do: [ :argument |
		history canRedo ifTrue: [ history redo ].
		targets do: [ :target |
			self assert: (self command getValueFor: target) class equals: argument value class] ]
]

{ #category : #tests }
PyramidBorderTypeCommandTest >> testSetValueForWith [

	self targetsWithoutValuesAndValues do: [ :each |
		self command setValueFor: each key with: each value.
		self assert: (self command getValueFor: each key) equals: each value value ]
]
