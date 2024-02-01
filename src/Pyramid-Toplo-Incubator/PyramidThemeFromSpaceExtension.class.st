Class {
	#name : #PyramidThemeFromSpaceExtension,
	#superclass : #Object,
	#traits : 'TPyramidPlugin + TPyramidSpaceExtension + TPyramidEditorSpaceIsReadyObserver + TPyramidOpenFromSpacePluginExtension',
	#classTraits : 'TPyramidPlugin classTrait + TPyramidSpaceExtension classTrait + TPyramidEditorSpaceIsReadyObserver classTrait + TPyramidOpenFromSpacePluginExtension classTrait',
	#instVars : [
		'defaultToTheme'
	],
	#category : #'Pyramid-Toplo-Incubator'
}

{ #category : #actions }
PyramidThemeFromSpaceExtension >> configureBuilder: aPyramidEditorBuilder [

	(aPyramidEditorBuilder findPlugin: PyramidOpenFromSpacePlugin)
		addExtension: self.
		(aPyramidEditorBuilder findPlugin: PyramidSpacePlugin) builder
		addExtension: self
]

{ #category : #'as yet unclassified' }
PyramidThemeFromSpaceExtension >> configureOpenFromSpace: aSpace [
	"Do something with the space"

	self defaultToTheme: aSpace toTheme
]

{ #category : #accessing }
PyramidThemeFromSpaceExtension >> defaultToTheme [

	^ defaultToTheme
]

{ #category : #accessing }
PyramidThemeFromSpaceExtension >> defaultToTheme: anObject [

	defaultToTheme := anObject
]

{ #category : #'as yet unclassified' }
PyramidThemeFromSpaceExtension >> informSpaceIsReady [

	self builder space toTheme: self defaultToTheme
]

{ #category : #displaying }
PyramidThemeFromSpaceExtension >> installOn: aBuilder [

	self builder: aBuilder.
	aBuilder addSpaceIsReadyObserver: self.
]
