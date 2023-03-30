Class {
	#name : #PyTreeColumnVisibility,
	#superclass : #Object,
	#traits : 'TPyTreeColumn',
	#classTraits : 'TPyTreeColumn classTrait',
	#category : #'Pyramid-Editor-Tree'
}

{ #category : #initialization }
PyTreeColumnVisibility >> initialize [

	column := (SpCheckBoxTableColumn new
		           title: 'Visible';
		           evaluated: [ :element | element visibility isVisible ];
		           onActivation: [ :element |
			           self sendCommandVisibleTo: element.
			           ];
		           onDeactivation: [ :element |
			           self sendCommandHiddenTo: element ];
		           yourself)
		          width: 45;
		          yourself
]

{ #category : #accessing }
PyTreeColumnVisibility >> order [

	^ 2
]

{ #category : #'as yet unclassified' }
PyTreeColumnVisibility >> pipeline [

	^ self business pipeline
]

{ #category : #'as yet unclassified' }
PyTreeColumnVisibility >> selection [

	^ self business selection
]

{ #category : #'as yet unclassified' }
PyTreeColumnVisibility >> sendCommandHiddenTo: aBlElement [

	self pipeline selection: (PySelection new add: aBlElement;
			 yourself).
	self pipeline useCommand:
		(PyCommandVisibility new arguments: BlVisibility hidden).
	self selection notifyObservers
]

{ #category : #'as yet unclassified' }
PyTreeColumnVisibility >> sendCommandVisibleTo: aBlElement [

	self pipeline selection: (PySelection new add: aBlElement; yourself).
	self pipeline useCommand:
		(PyCommandVisibility new arguments: BlVisibility visible).
	self selection notifyObservers
]
