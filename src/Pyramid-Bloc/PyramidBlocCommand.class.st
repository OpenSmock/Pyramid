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
			  state arguments: source elements asArray ]
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
			  state arguments: source elements asArray ]
		  isExecutableBlock: [ :obj :state| obj isCollection ]
]

{ #category : #adding }
PyramidBlocCommand class >> text [

	^ PyramidCommand
		  name: #text
		  set: [ :state :target | target text: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source text ]
		  isExecutableBlock: [ :obj :state |
			  (obj isKindOf: BlTextElement) ]
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
