Class {
	#name : #PyramidMementoInverser,
	#superclass : #PyramidMementoVisitor,
	#category : 'Pyramid-history'
}

{ #category : #visiting }
PyramidMementoInverser >> visitCommandMemento: aCommandMemento [

	| memento |
	memento := aCommandMemento class new.
	memento
		target: aCommandMemento target;
		arguments: aCommandMemento arguments;
		command: aCommandMemento command commandInverse.
	^ memento
]

{ #category : #visiting }
PyramidMementoInverser >> visitCompositeMemento: aCompositeMemento [

	| memento |
	memento := aCompositeMemento class new.
	memento mementos: (aCompositeMemento mementos collect: [ :each | each accept: self ]).
	^ memento
]
