Class {
	#name : #PyramidEditor,
	#superclass : #Object,
	#traits : 'TPyramidFindPlugin',
	#classTraits : 'TPyramidFindPlugin classTrait',
	#instVars : [
		'plugins',
		'projectModel',
		'window',
		'commandExecutor',
		'announcer'
	],
	#category : #'Pyramid-core'
}

{ #category : #private }
PyramidEditor class >> buildEditor [

	^ PyramidPluginManager uniqueInstance buildEditor
]

{ #category : #'instance creation' }
PyramidEditor class >> open [
	<script>

	self buildEditor open
]

{ #category : #'open/close' }
PyramidEditor >> announcer [

	^ announcer
]

{ #category : #'open/close' }
PyramidEditor >> close [

	self window ifNil: [ ^ self ].
	self window isClosed ifTrue:[ ^ self ].
	self window close
]

{ #category : #accessing }
PyramidEditor >> commandExecutor [

	^ commandExecutor
]

{ #category : #accessing }
PyramidEditor >> commandExecutor: anObject [

	commandExecutor := anObject
]

{ #category : #initialization }
PyramidEditor >> initialize [

	announcer := Announcer new.
	plugins := {  }.
	projectModel := PyramidProjectModel new
		                editor: self;
		                yourself.
	commandExecutor := PyramidCallbackCommandExecutor new
		                   afterDo: [
			                   self projectModel informElementsChanged ];
		                   wrappee: PyramidMainCommandExecutor new;
		                   yourself
]

{ #category : #'open/close' }
PyramidEditor >> open [

	self window ifNil: [ ^ self ].
	self window isOpen ifTrue:[ ^ self ].
	self window open.
	self plugins do: [ :plugin | plugin windowOpenBy: self ]
]

{ #category : #plugins }
PyramidEditor >> plugins [

	^ plugins
]

{ #category : #plugins }
PyramidEditor >> plugins: aCollection [

	plugins := aCollection
]

{ #category : #accessing }
PyramidEditor >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidEditor >> projectModel: anObject [

	projectModel := anObject.
	projectModel editor: self.
]

{ #category : #accessing }
PyramidEditor >> view [

	^ self window presenter
]

{ #category : #accessing }
PyramidEditor >> window [

	^ window
]

{ #category : #accessing }
PyramidEditor >> window: anObject [

	window := anObject.

]
