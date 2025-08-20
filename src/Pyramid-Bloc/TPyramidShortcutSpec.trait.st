Trait {
	#name : #TPyramidShortcutSpec,
	#instVars : [
		'shortcutAction',
		'keyCombination',
		'plugin'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
TPyramidShortcutSpec >> defaultKeyCombination [
]

{ #category : #initialization }
TPyramidShortcutSpec >> initialize [

	self defaultKeyCombination
]

{ #category : #accessing }
TPyramidShortcutSpec >> keyCombination: aKeyCombination [

	^ keyCombination := aKeyCombination
]

{ #category : #'accessing - classes' }
TPyramidShortcutSpec >> pluginFromPyramid: aPyramidEditor [
	
	| listOfPlugins pluginSorted |
	
	listOfPlugins := aPyramidEditor plugins.
	pluginSorted := listOfPlugins select: [ :extensions | extensions isKindOf: PyramidHistoryPlugin ].
	pluginSorted size = 1
	ifFalse: [^ self].
	plugin := pluginSorted asArray first
]

{ #category : #accessing }
TPyramidShortcutSpec >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin
				  ifNil: [ self inform: 'Problem with the plugin' ]
				  ifNotNil: [ "Action here" ] ]
]
