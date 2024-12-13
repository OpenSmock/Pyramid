Class {
	#name : #PyramidPluginEditOnRunning,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'editOnRunning'
	],
	#classInstVars : [
		'editOnRunning',
		'spaceIds',
		'shortcut',
		'shortcutFork',
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

{ #category : #testing }
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
	self flag:
		'labordep: this is a temporary processing because this fork is due to a Bloc opened issue'.
	(shortcutFork notNil and: [ shortcutFork isTerminated not ]) ifTrue: [
		^ self ].

	shortcutFork := [
	                self editOnRunning ifTrue: [
		                space := anEvent source space.
		                (self canEditSpace: space) ifTrue: [
			                editor := space editWithPyramid.
			                whenClosedDo := editor window whenClosedDo.
			                editor window whenClosedDo: [ whenClosedDo value ] ] ] ]
		                forkAt: Processor userBackgroundPriority
		                named: 'Pyramid edit-on-running plugin shortcut'
]

{ #category : #accessing }
PyramidPluginEditOnRunning class >> editOnRunning [

	^ editOnRunning ifNil: [ editOnRunning := true ]
]

{ #category : #accessing }
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
	node := (BlParallelUniverse methodNamed: #openSpace:) ast.

	breakpoint := PyramidBreakpoint new.
	breakpoint node: node.
	breakpoint whenHitDo: [ :context | self addShortcutInSpace: context arguments first ].
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

	self breakpoint ifNotNil: [ :b | b remove ]
]
