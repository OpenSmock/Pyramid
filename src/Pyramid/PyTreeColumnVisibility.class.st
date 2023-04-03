Class {
	#name : #PyTreeColumnVisibility,
	#superclass : #Object,
	#traits : 'TPyTreeColumn',
	#classTraits : 'TPyTreeColumn classTrait',
	#category : #'Pyramid-Editor-Tree'
}

{ #category : #initialization }
PyTreeColumnVisibility >> initialize [

	column := SpCompositeTableColumn new
		          title: 'Visible';
					 addColumn: (SpStringTableColumn new
				           title: 'Parent is Visible';
				           evaluated: [ :element |
					           self visibilityLabelFor: element ];
				           yourself);
		          addColumn: (SpCheckBoxTableColumn new
				           title: 'Visible';
				           evaluated: [ :element | element visibility isVisible ];
				           onActivation: [ :element |
					           self sendCommandVisibleTo: element ];
				           onDeactivation: [ :element |
					           self sendCommandHiddenTo: element ];
				           yourself);
		          addColumn: (SpImageTableColumn evaluated: [ :element |
				           self visibilityIconFor: element ]);
		          width: 55;
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

{ #category : #'as yet unclassified' }
PyTreeColumnVisibility >> visibilityIconFor: aBlElement [

	^ (PyFormVisibilityModel from: aBlElement visibility) icon
]

{ #category : #'as yet unclassified' }
PyTreeColumnVisibility >> visibilityLabelFor: aBlElement [

	aBlElement
		allParentsTo: self business view rootLayer
		do: [ :each | each visibility isVisible ifFalse: [ ^ '!' ] ].
	^ ''
]
