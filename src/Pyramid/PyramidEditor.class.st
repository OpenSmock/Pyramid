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
		'announcer',
		'collectionOfShortcutSpec'
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

{ #category : #adding }
PyramidEditor >> addShortcutSpecInCollection: aKeyCombination action: aBlockAction name: aString [

	| shortcutObject |

	shortcutObject := PyramidSpecShortcutActionObject new.
	shortcutObject	name: aString;
						shortcut: aKeyCombination;
						action: aBlockAction.											
													
	collectionOfShortcutSpec add: shortcutObject
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

{ #category : #'as yet unclassified' }
PyramidEditor >> defaultSpecShortcuts [

	"Shortcut using only projectModel"
	self
		addShortcutSpecInCollection: KeyboardKey I command mac |
											 KeyboardKey I control unix |
											 KeyboardKey I control win
		action: [
			self projectModel selection size = 1
				ifTrue: [
					self projectModel selection first inspect.
					self projectModel updateSelection ]
				ifFalse: [
				self inform: 'Cannot inspect zero or multiple selected element' ] ]
		name: 'Shortcut Spec Inspect selected element'.

	self
		addShortcutSpecInCollection: KeyboardKey escape
		action: [ self projectModel updateSelection ]
		name: 'Shortcut Spec unselect all elements'.

	self
		addShortcutSpecInCollection: KeyboardKey A command mac |
											 KeyboardKey A control unix |
											 KeyboardKey A control win
		action: [
			self projectModel selection asArray isEmpty
				ifTrue: [
					self projectModel setSelection:
						self projectModel firstLevelElements collection ]
				ifFalse: [
					self projectModel selection asArray size = 1 ifTrue: [
						self projectModel selection collection asArray first children
							isEmpty
							ifTrue: [
							self inform: 'No children to select in the selected element' ]
							ifFalse: [
								self projectModel setSelection:
									self projectModel selection collection asArray first children ] ] ] ]
		name: 'Shortcut Spec Select all element'
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
		                   yourself.
		
	collectionOfShortcutSpec := OrderedCollection new.
]

{ #category : #'open/close' }
PyramidEditor >> open [

	self window ifNil: [ ^ self ].
	self window isOpen ifTrue: [ ^ self ].
	self window open.
	self plugins do: [ :plugin | plugin windowOpenBy: self ].
	
	self defaultSpecShortcuts.

	collectionOfShortcutSpec do: [ :shortcutClass |
		window spec
			bindKeyCombination: shortcutClass shortcut
			toAction: shortcutClass action ]
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
