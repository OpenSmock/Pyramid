Class {
	#name : #PyramidPluginOpenInWindow,
	#superclass : #Object,
	#traits : 'TPyramidPlugin + TPyramidEditorExtension',
	#classTraits : 'TPyramidPlugin classTrait + TPyramidEditorExtension classTrait',
	#instVars : [
		'button',
		'spacePlugin',
		'builder',
		'projectModel',
		'savePlugin'
	],
	#category : #'Pyramid-Bloc-plugin-openinwindow'
}

{ #category : #adding }
PyramidPluginOpenInWindow >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow
		at: #topRight
		addItem: [ :b | b makeButtonWithIcon: self button order: 1 ]. 
]

{ #category : #accessing }
PyramidPluginOpenInWindow >> builder [
    ^ builder
]

{ #category : #accessing }
PyramidPluginOpenInWindow >> button [ 

	^ button
]

{ #category : #connecting }
PyramidPluginOpenInWindow >> connectOn: aPyramidEditor [
    spacePlugin := aPyramidEditor plugins
                       detect: [ :p | p isKindOf: PyramidSpacePlugin ]
                       ifNone: [  ].
    spacePlugin ifNotNil: [ builder := spacePlugin builder ].
    projectModel := aPyramidEditor projectModel.
    savePlugin := aPyramidEditor plugins
                       detect: [ :p | p isKindOf: PyramidSavePlugin ]
                       ifNone: [  ]
]

{ #category : #initialization }
PyramidPluginOpenInWindow >> initialize [
    button := SpButtonPresenter new
                  icon: self openInWindowIcon;
                  help: 'Open interface in a separate window.';
                  action: [ self openSpaceInWindow ];
                  yourself
]

{ #category : #'as yet unclassified' }
PyramidPluginOpenInWindow >> openInWindowIcon [

	^ Smalltalk ui icons iconNamed: #glamorousInspect 
]

{ #category : #'as yet unclassified' }
PyramidPluginOpenInWindow >> openSpaceInWindow [

	| elements stash newElements space |
	projectModel ifNil: [ ^ self inform: 'No project found.' ].

	elements := projectModel firstLevelElements asOrderedCollection.
	elements ifEmpty: [ ^ self inform: 'Nothing to display.' ].

	elements size = 1
		ifTrue: [
				stash := BlSerializer
					         serialize: elements first
					         with: BlStashSerializer.
				newElements := { stash materializeAsBlElement } ]
		ifFalse: [
				| container |
				container := BlElement new
					             extent: 4000 @ 2000;
					             yourself.
				elements do: [ :each |
						stash := BlSerializer serialize: each with: BlStashSerializer.
						container addChild: stash materializeAsBlElement ].
				newElements := { container } ].

	space := newElements first openInNewSpace.
	newElements size > 1 ifTrue: [
		space root addChildren: newElements allButFirst ]
]

{ #category : #accessing }
PyramidPluginOpenInWindow >> projectModel [
    ^ projectModel
]
