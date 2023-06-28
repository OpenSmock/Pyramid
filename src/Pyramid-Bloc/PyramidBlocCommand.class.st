Class {
	#name : #PyramidBlocCommand,
	#superclass : #Object,
	#category : #'Pyramid-Bloc-plugin-bloc-properties'
}

{ #category : #adding }
PyramidBlocCommand class >> addChildren [

	^ PyramidCommand
		  name: #addChildren
		  set: [ :state :target | target addChildren: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source children asArray ]
		  isExecutableBlock: [ :obj :state | obj isKindOf: BlElement ]
]

{ #category : #adding }
PyramidBlocCommand class >> addElementOnCollection [

	^ PyramidCommand
		  name: #addElementOnCollection
		  set: [ :state :target | target addAll: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source collection asArray ]
		  isExecutableBlock: [ :obj :state| obj isCollection ]
]

{ #category : #adding }
PyramidBlocCommand class >> background [

	^ PyramidCommand
		  name: #background
		  set: [ :state :target | target background: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source background ]
		  isExecutableBlock: [ :obj :state | (obj isKindOf: BlElement) ]
]

{ #category : #adding }
PyramidBlocCommand class >> border [

	^ PyramidCommand
		  name: #border
		  set: [ :state :target | target border: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source border ]
		  isExecutableBlock: [ :obj :state | obj isKindOf: BlElement ]
]

{ #category : #adding }
PyramidBlocCommand class >> borderPaint [

	^ PyramidCommand
		  name: #borderPaint
		  set: [ :state :target |
			  target border:
				  (BlBorder paint: state arguments width: target border width) ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source border paint ]
		  isExecutableBlock: [ :obj :state | obj isKindOf: BlElement ]
]

{ #category : #adding }
PyramidBlocCommand class >> borderWidth [

	^ PyramidCommand
		  name: #borderWidth
		  set: [ :state :target | target border: (BlBorder paint: target border paint width: state arguments) ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source border width ]
		  isExecutableBlock: [ :obj :state | obj isKindOf: BlElement ]
]

{ #category : #adding }
PyramidBlocCommand class >> constraints [

	^ PyramidCommand
		  name: #constraints
		  set: [ :state :target |
			  state arguments isBlock
				  ifTrue: [ target constraintsDo: state arguments ]
				  ifFalse: [ target constraints: state arguments ] ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source constraints ]
		  isExecutableBlock: [ :obj :state | obj isKindOf: BlElement ]
]

{ #category : #adding }
PyramidBlocCommand class >> geometry [

	^ PyramidCommand
		  name: #geometry
		  set: [ :state :target | target geometry: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source geometry ]
		  isExecutableBlock: [ :obj :state | obj isKindOf: BlElement ]
]

{ #category : #adding }
PyramidBlocCommand class >> identifier [

	^ PyramidCommand
		  name: #identifier
		  set: [ :state :target | target id: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source id asSymbol ]
		  isExecutableBlock: [ :obj :state |
			  (obj isKindOf: BlElement) and: [
					state arguments ifNil: [ true ] ifNotNil: [ state arguments ~= obj id asSymbol ]
				   ] ]
]

{ #category : #adding }
PyramidBlocCommand class >> position [

	^ PyramidCommand
		  name: #position
		  set: [ :state :target | target position: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source constraints position ]
		  isExecutableBlock: [ :obj :state | obj isKindOf: BlElement ]
]

{ #category : #adding }
PyramidBlocCommand class >> removeChildren [

	^ PyramidCommand
		  name: #removeChildren
		  set: [ :state :target | target removeChildren: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source children asArray ]
		  isExecutableBlock: [ :obj :state| obj isKindOf: BlElement ]
]

{ #category : #adding }
PyramidBlocCommand class >> removeElementOnCollection [

	^ PyramidCommand
		  name: #removeElementOnCollection
		  set: [ :state :target | target removeAll: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source collection asArray ]
		  isExecutableBlock: [ :obj :state| obj isCollection ]
]

{ #category : #adding }
PyramidBlocCommand class >> text [

	^ PyramidCommand
		  name: #text
		  set: [ :state :target |
			  | rope attributes |
			  rope := target text rope.
			  attributes := (rope class canUnderstand: #attributes) ifTrue: [ rope attributes ] ifFalse: [ {  } ].
			  target text: (BlRopedText rope: (BlAttributeRope attributes: attributes rope: state arguments rope)) ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source text ]
		  isExecutableBlock: [ :obj :state | obj isKindOf: BlTextElement ]
]

{ #category : #adding }
PyramidBlocCommand class >> textAttribute [

	^ PyramidCommand
		  name: #textAttribute
		  set: [ :state :target |
			  target text attribute: state arguments.
			  target textChanged ]
		  get: [ :state :source |
			  state source: source.
			  state arguments:
				  ((source text attributesFinder attributesAndIndicesSuchThat: [
					    :each | true ]) collect: [ :each | each key ]) ]
		  isExecutableBlock: [ :obj :state | obj isKindOf: BlTextElement ]
]

{ #category : #adding }
PyramidBlocCommand class >> visibility [

	^ PyramidCommand
		  name: #visibility
		  set: [ :state :target | target visibility: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source visibility ]
		  isExecutableBlock: [ :obj :state | (obj isKindOf: BlElement) and: [ state arguments ~= obj visibility ] ]
]

{ #category : #'see class side' }
PyramidBlocCommand >> seeClassSide [
]
