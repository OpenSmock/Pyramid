Trait {
	#name : #TPyramidSerchablePlugin,
	#category : #'Pyramid-core'
}

{ #category : #'as yet unclassified' }
TPyramidSerchablePlugin >> findPluginNamed: aSymbol [

	| find |
	find := self plugins select: [ :each | aSymbol = each class name ].
	find ifEmpty: [ PyramidPluginNotFoundError new plugins: self plugins; querry: aSymbol; signal ].
	find size = 1 ifTrue: [ ^ find asArray first ].
	^ PyramidSamePluginReference new plugins: self plugins; ref: find first; signal
]

{ #category : #accessing }
TPyramidSerchablePlugin >> plugins [
	"return the collection of instances of plugins."

	^ self shouldBeImplemented
]
