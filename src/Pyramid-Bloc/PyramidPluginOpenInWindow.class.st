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
		'savePlugin',
		'space'
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
PyramidPluginOpenInWindow >> builder: anObject [

builder := anObject 
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

{ #category : #private }
PyramidPluginOpenInWindow >> openInWindowIcon [

	| svgString coloredSvg blElement |
	svgString := ToMaterialDesignIconProvider sharp_openinnew.
	coloredSvg := svgString
		              copyReplaceAll: '<path '
		              with: '<path fill="#1DB954" '.
	blElement := BlSvgConverter convertFromString: coloredSvg.
	blElement extent: 22@22.
	^ blElement asForm
]

{ #category : #private }
PyramidPluginOpenInWindow >> openSpaceInWindow [
    | elements container stash currentTheme windowSize |
    elements := projectModel firstLevelElements asOrderedCollection.
    currentTheme := nil.
    builder ifNotNil: [ :aBuilder |
        aBuilder space ifNotNil: [ :aSpace |
            aSpace root ifNotNil: [ :aRoot | currentTheme := aRoot localTheme ] ] ].

windowSize := [
    | mainExtension |
    mainExtension := builder extensions
        detect: [ :e | e isKindOf: PyramidMainExtension ]
        ifNone: [ nil ].
    mainExtension sizeElement extent ]
        on: Error
        do: [ PyramidMainExtension currentGridWindowSize ].

    container := BlElement new
        constraintsDo: [ :c |
            c horizontal matchParent.
            c vertical matchParent ];
        yourself.
    elements do: [ :each |
        stash := BlSerializer serialize: each with: BlStashSerializer.
        container addChild: stash materializeAsBlElement ].
    space := container openInNewSpace.
    space extent: windowSize.
    currentTheme ifNotNil: [ space toTheme: currentTheme ].
    ^ space
]

{ #category : #accessing }
PyramidPluginOpenInWindow >> projectModel [
    ^ projectModel
]

{ #category : #accessing }
PyramidPluginOpenInWindow >> projectModel: anObject [

projectModel := anObject
]

{ #category : #accessing }
PyramidPluginOpenInWindow >> space [ 

^ space 
]
