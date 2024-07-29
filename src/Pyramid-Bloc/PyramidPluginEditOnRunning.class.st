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
		'keyCombination'
	],
	#category : #'Pyramid-Bloc-plugin-edit-on-running'
}

{ #category : #private }
PyramidPluginEditOnRunning class >> addShortcutInSpace: aSpace [

	(self canEditSpace: aSpace) ifFalse:[ ^ self ].
	(self spaceIds includes: aSpace id) ifTrue:[ ^ self ].
	
	self spaceIds add: aSpace id.
	aSpace root addShortcut: self shortcut 
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
	"Do some stuff here when the plugin used class oriented behavior"
	
	self installBlUniverseListeners.
	
]

{ #category : #'universe management' }
PyramidPluginEditOnRunning class >> installBlUniverseListeners [

	Beacon instance
		when: BlParallelUniverseOpenSpaceRequestSignal
		send: #receiveBlParallelUniverseHostSpaceSignal:
		to: self
]

{ #category : #accessing }
PyramidPluginEditOnRunning class >> keyCombination [

	^ keyCombination ifNil: [
		  keyCombination := (BlKeyCombination builder key: KeyboardKey F12) build ]
]

{ #category : #'universe management' }
PyramidPluginEditOnRunning class >> receiveBlParallelUniverseHostSpaceSignal: anEvent [

	BlSpace spaceWithId: anEvent spaceId do: [ :e | self addShortcutInSpace: e ]
]

{ #category : #private }
PyramidPluginEditOnRunning class >> removeShortcutInSpace: aSpace [

	aSpace ifNil: [ ^ self ].

	aSpace root removeShortcut: self shortcut.
	self spaceIds remove: aSpace id.
]

{ #category : #accessing }
PyramidPluginEditOnRunning class >> shortcut [

	^ shortcut ifNil: [
		  shortcut := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut';
			              combination: self keyCombination;
			              action: [ :event | self doShortcutAction: event ] ]
]

{ #category : #accessing }
PyramidPluginEditOnRunning class >> spaceIds [

	^ spaceIds ifNil: [ spaceIds := Set new ]
]

{ #category : #initialization }
PyramidPluginEditOnRunning class >> uninstall [
	"Undo some stuff here when the plugin used class oriented behavior"
	
	self uninstallBlUniverseListeners.
	
	self spaceIds do:[ :id | BlSpace spaceWithId: id do: [ :e | self removeShortcutInSpace: e ] ].
	self spaceIds removeAll.
	shortcutFork ifNotNil: [ shortcutFork terminate. shortcutFork := nil ]. 
	shortcut := nil.
	keyCombination := nil.
]

{ #category : #'universe management' }
PyramidPluginEditOnRunning class >> uninstallBlUniverseListeners [

	Beacon instance unsubscribe: self
]
