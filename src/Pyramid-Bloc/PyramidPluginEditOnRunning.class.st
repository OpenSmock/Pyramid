Class {
	#name : #PyramidPluginEditOnRunning,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#classInstVars : [
		'editOnRunning',
		'shortcut',
		'keyCombination',
		'breakpoint'
	],
	#category : #'Pyramid-Bloc-plugin-edit-on-running'
}

{ #category : #private }
PyramidPluginEditOnRunning class >> addShortcutInSpace: aSpace [

	(self canEditSpace: aSpace) ifFalse: [ ^ self ].
	aSpace root addShortcut: self shortcut
]

{ #category : #initialization }
PyramidPluginEditOnRunning class >> breakpoint [
	^ breakpoint
]

{ #category : #'as yet unclassified' }
PyramidPluginEditOnRunning class >> canEditSpace: aSpace [

	aSpace ifNil:[ ^ false ].

	"Not edit the editor space or already edited to prevent cycling"
	aSpace userData at: #pyramid_isEditor ifPresent:[ ^ false ].
	aSpace userData at: #pyramid_isOnEdition ifPresent:[ ^ false ].
	
	^ true
]

{ #category : #initialization }
PyramidPluginEditOnRunning class >> cleanUp: anObject [

	"do nothing"
]

{ #category : #private }
PyramidPluginEditOnRunning class >> doShortcutAction: anEvent [

	| space editor whenClosedDo |
	self editOnRunning ifFalse: [ ^ self ].
	space := anEvent source space.
	(self canEditSpace: space) ifFalse: [ ^ self ].
	editor := space editWithPyramid.
	whenClosedDo := editor window whenClosedDo.
	editor window whenClosedDo: [ whenClosedDo value ]
]

{ #category : #'as yet unclassified' }
PyramidPluginEditOnRunning class >> editOnRunning [

	^ editOnRunning ifNil: [ editOnRunning := true ]
]

{ #category : #'as yet unclassified' }
PyramidPluginEditOnRunning class >> editOnRunning: aBoolean [

	editOnRunning := aBoolean
]

{ #category : #initialization }
PyramidPluginEditOnRunning class >> install [

	self isBreakpointInstall ifTrue: [ ^ self ].
	self installBreakpoint.
]

{ #category : #'universe management' }
PyramidPluginEditOnRunning class >> installBreakpoint [

	| node |
	PyramidBreakpoint removeAllPyramidBreakpoint.
	node := (BlParallelUniverse methodNamed: #openSpace:) ast.

	breakpoint := PyramidBreakpoint new.
	breakpoint node: node.
	breakpoint whenHitDo: [ :context |
		self addShortcutInSpace: context arguments first ].
	breakpoint install
]

{ #category : #initialization }
PyramidPluginEditOnRunning class >> isBreakpointInstall [

	self breakpoint ifNil: [ ^ false ].
	^ self breakpoint isInstalled 
]

{ #category : #accessing }
PyramidPluginEditOnRunning class >> keyCombination [

	^ keyCombination ifNil: [
		  keyCombination := (BlKeyCombination builder key: KeyboardKey F12) build ]
]

{ #category : #private }
PyramidPluginEditOnRunning class >> removeShortcutInSpace: aSpace [

	aSpace ifNil: [ ^ self ].
	aSpace root removeShortcut: self shortcut.
]

{ #category : #accessing }
PyramidPluginEditOnRunning class >> shortcut [

	^ shortcut ifNil: [
		  shortcut := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut';
			              combination: self keyCombination;
			              action: [ :event | self doShortcutAction: event ] ]
]

{ #category : #initialization }
PyramidPluginEditOnRunning class >> uninstall [
	"Undo some stuff here when the plugin used class oriented behavior"

	PyramidBreakpoint removeAllPyramidBreakpoint.
	breakpoint := nil.
]
