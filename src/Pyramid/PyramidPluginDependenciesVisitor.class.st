Class {
	#name : #PyramidPluginDependenciesVisitor,
	#superclass : #PyramidPluginVisitor,
	#instVars : [
		'visited'
	],
	#category : #'Pyramid-core'
}

{ #category : #'as yet unclassified' }
PyramidPluginDependenciesVisitor >> applyOnPlugin: aTPyramidPlugin [


		aTPyramidPlugin class accept: self
]

{ #category : #'as yet unclassified' }
PyramidPluginDependenciesVisitor >> applyOnPluginClass: aTPyramidPlugin [

	| toVisit |
	self visited add: aTPyramidPlugin.
	aTPyramidPlugin dependencies ifEmpty: [ ^ self ].
	toVisit := aTPyramidPlugin dependencies reject: [ :dependencyPluginSymbol |
		           self visited anySatisfy: [ :alreadyVisitedPlugin | dependencyPluginSymbol = alreadyVisitedPlugin name ] ].
	toVisit
		collect: [ :each | Smalltalk environment at: each ]
		thenDo: [ :each | each accept: self ]
]

{ #category : #initialization }
PyramidPluginDependenciesVisitor >> initialize [

	visited := OrderedCollection new.
]

{ #category : #accessing }
PyramidPluginDependenciesVisitor >> visited [

	^ visited
]
