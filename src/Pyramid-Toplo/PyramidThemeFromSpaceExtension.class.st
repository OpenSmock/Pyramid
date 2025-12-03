Class {
	#name : #PyramidThemeFromSpaceExtension,
	#superclass : #Object,
	#traits : 'TPyramidPlugin + TPyramidSpaceExtension + TPyramidEditorSpaceIsReadyObserver + TPyramidOpenFromSpacePluginExtension',
	#classTraits : 'TPyramidPlugin classTrait + TPyramidSpaceExtension classTrait + TPyramidEditorSpaceIsReadyObserver classTrait + TPyramidOpenFromSpacePluginExtension classTrait',
	#instVars : [
		'defaultToTheme',
		'themeSpaceSelector',
		'spaceIsReady'
	],
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #asserting }
PyramidThemeFromSpaceExtension class >> shouldInstall [

	^ true
]

{ #category : #actions }
PyramidThemeFromSpaceExtension >> configureBuilder: aPyramidEditorBuilder [

	| pyramidOpenFromSpacePlugin pyramidSpacePlugin pyramidToploThemePlugin |
	[
		pyramidOpenFromSpacePlugin := aPyramidEditorBuilder findPlugin:
			                              PyramidOpenFromSpacePlugin.
		pyramidSpacePlugin := aPyramidEditorBuilder findPlugin:
			                      PyramidSpacePlugin.
		pyramidToploThemePlugin := aPyramidEditorBuilder findPlugin:
			                           PyramidToploThemePlugin ]
		on: PyramidNoPluginFoundError
		do: [ ^ self ].

	pyramidOpenFromSpacePlugin addExtension: self.
	pyramidSpacePlugin builder addExtension: self.
	self themeSpaceSelector:
		pyramidToploThemePlugin themePresenter themeSpaceSelector
]

{ #category : #'as yet unclassified' }
PyramidThemeFromSpaceExtension >> configureCloseOnSpace: aSpace [

	aSpace toTheme: themeSpaceSelector currentTheme.
]

{ #category : #'as yet unclassified' }
PyramidThemeFromSpaceExtension >> configureOpenFromSpace: aSpace [
	"Do something with the space"

	self defaultToTheme: aSpace toTheme.
]

{ #category : #accessing }
PyramidThemeFromSpaceExtension >> defaultToTheme [

	defaultToTheme ifNil: [ defaultToTheme := PyramidToploThemePlugin defaultTheme new ].
	^ defaultToTheme
]

{ #category : #accessing }
PyramidThemeFromSpaceExtension >> defaultToTheme: anObject [

	defaultToTheme := anObject.
	self themeSpaceSelector selectTheme: anObject.
	self spaceIsReady ifTrue: [ self informSpaceIsReady  ].
]

{ #category : #'as yet unclassified' }
PyramidThemeFromSpaceExtension >> informSpaceIsReady [

	self defaultToTheme ifNil: [ self spaceIsReady: true. ^ self ].
	self builder space toTheme: self defaultToTheme
]

{ #category : #initialization }
PyramidThemeFromSpaceExtension >> initialize [

	spaceIsReady := false.
]

{ #category : #displaying }
PyramidThemeFromSpaceExtension >> installOn: aBuilder [

	self builder: aBuilder.
	aBuilder addSpaceIsReadyObserver: self.
]

{ #category : #accessing }
PyramidThemeFromSpaceExtension >> spaceIsReady [

	^ spaceIsReady
]

{ #category : #accessing }
PyramidThemeFromSpaceExtension >> spaceIsReady: anObject [

	spaceIsReady := anObject
]

{ #category : #accessing }
PyramidThemeFromSpaceExtension >> themeSpaceSelector [

	^ themeSpaceSelector
]

{ #category : #accessing }
PyramidThemeFromSpaceExtension >> themeSpaceSelector: anObject [

	themeSpaceSelector := anObject
]
