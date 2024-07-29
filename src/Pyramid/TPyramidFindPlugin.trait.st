Trait {
	#name : #TPyramidFindPlugin,
	#category : #'Pyramid-core'
}

{ #category : #'as yet unclassified' }
TPyramidFindPlugin >> findPlugin: aSymbolOrAClass [

	| allPlugins |
	allPlugins := aSymbolOrAClass isString
		              ifTrue: [
		              self plugins select: [ :each |
			              each class name = aSymbolOrAClass ] ]
		              ifFalse: [
		              self plugins select: [ :each |
			              each class = aSymbolOrAClass ] ].

	allPlugins ifEmpty: [
		^ PyramidNoPluginFoundError new
			  query: aSymbolOrAClass;
			  signal ].
	allPlugins size > 1 ifTrue: [
		^ PyramidMultiplePluginsFoundError new
			  plugins: allPlugins;
			  signal ].
	^ allPlugins asArray first
]

{ #category : #accessing }
TPyramidFindPlugin >> plugins [
	"Return a collection of TPyramidPlugin instances."

	^ self shouldBeImplemented
]
