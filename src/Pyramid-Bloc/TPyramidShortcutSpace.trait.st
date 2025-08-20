Trait {
	#name : #TPyramidShortcutSpace,
	#instVars : [
		'shortcutAction',
		'keyCombination',
		'plugin'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
TPyramidShortcutSpace >> defaultKeyCombination [

	"CTRL + S as example"
	keyCombination := "(BlKeyCombination builder primary key:
		                       KeyboardKey S) build" nil
]

{ #category : #initialization }
TPyramidShortcutSpace >> initialize [

	self defaultKeyCombination
]

{ #category : #accessing }
TPyramidShortcutSpace >> keyCombination: aKeyCombination [

	^ keyCombination := aKeyCombination
]

{ #category : #'accessing - classes' }
TPyramidShortcutSpace >> pluginFromPyramid: aPyramidEditor [
	
	| listOfPlugins pluginSorted |
	
	listOfPlugins := aPyramidEditor plugins.
	pluginSorted := listOfPlugins select: [ :extensions | "extensions isKindOf: PyramidHistoryPlugin" ].
	pluginSorted size = 1
	ifFalse: [^ self].
	plugin := pluginSorted asArray first
]

{ #category : #accessing }
TPyramidShortcutSpace >> shortcutAction [

	^ shortcutAction := BlShortcutWithAction new
		                    name: 'Pyramid edition shortcut save';
		                    combination: keyCombination;
		                    action: [ :event |
			                    plugin
				                    ifNil: [ self inform: 'Problem with the plugin' "Add the name of the plugin" ]
				                    ifNotNil: [ "Action here" ] ]
]
