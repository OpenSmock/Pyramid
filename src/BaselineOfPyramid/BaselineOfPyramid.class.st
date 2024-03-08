Class {
	#name : #BaselineOfPyramid,
	#superclass : #BaselineOf,
	#category : #BaselineOfPyramid
}

{ #category : #baselines }
BaselineOfPyramid >> baseline: spec [

	<baseline>
	"Common baseline for all Pharo versions"
	spec for: #common do: [ self baselineForCommon: spec ]
]

{ #category : #baselines }
BaselineOfPyramid >> baselineForCommon: spec [

	<baseline>
	spec preLoadDoIt: #preload:package:.
	spec postLoadDoIt: #postload:package:.

	"Dependencies"
	self blocDependencies: spec.
	self toploDependencies: spec.

	"Packages"
	self pyramidPackages: spec.
	self blocPackages: spec.
	self toploPackages: spec.

	"Groups"
	spec group: 'default' with: #( 'BlocUI' 'ToploUI' ). "complete version"
	spec group: 'BlocUI' with: self blocPackagesNames. "only Bloc"
	spec group: 'ToploUI' with: self toploPackagesNames "only Bloc and Toplo"
]

{ #category : #dependencies }
BaselineOfPyramid >> blocDependencies: spec [

	spec
		baseline: 'Bloc'
		with: [ spec repository: 'github://pharo-graphics/Bloc:master/src' ].
	spec
		baseline: 'BlocSerialization'
		with: [
		spec repository: 'github://OpenSmock/Bloc-Serialization:main/src' ]
]

{ #category : #packages }
BaselineOfPyramid >> blocPackages: spec [

	spec
		package: 'Pyramid-Bloc'
		with: [ spec requires: #( 'Pyramid' 'Bloc' ) ].
	spec
		package: 'Pyramid-Tests'
		with: [ spec requires: #( 'Pyramid-Bloc' ) ].
	spec
		package: 'Pyramid-Examples'
		with: [ spec requires: #( 'Pyramid-Bloc' ) ]
]

{ #category : #packages }
BaselineOfPyramid >> blocPackagesNames [

	^ #( 'Pyramid' 'Pyramid-Bloc' 'Pyramid-Tests' 'Pyramid-IDE' 'Pyramid-Examples' )
]

{ #category : #actions }
BaselineOfPyramid >> postload: loader package: packageSpec [

	PyramidPluginManager reset
]

{ #category : #actions }
BaselineOfPyramid >> preload: loader package: packageSpec [

]

{ #category : #packages }
BaselineOfPyramid >> pyramidPackages: spec [

	spec package: 'Pyramid'.
	spec
		package: 'Pyramid-IDE'
		with: [ spec requires: #( 'Pyramid' ) ].

]

{ #category : #dependencies }
BaselineOfPyramid >> toploDependencies: spec [

	spec
		baseline: 'Toplo'
		with: [ spec repository: 'github://pharo-graphics/Toplo:master/src' ].
	spec
		baseline: 'ToploSerialization'
		with: [ spec repository: 'github://OpenSmock/Toplo-Serialization:main/src' ]
]

{ #category : #packages }
BaselineOfPyramid >> toploPackages: spec [

	spec
		package: 'Pyramid-Toplo'
		with: [ spec requires: #( 'Toplo' 'ToploSerialization') ].
	spec
		package: 'Pyramid-Toplo-Tests'
		with: [ spec requires: #( 'Pyramid-Toplo' ) ].
	spec
		package: 'Pyramid-Toplo-Examples'
		with: [ spec requires: #( 'Pyramid-Toplo' ) ]
]

{ #category : #packages }
BaselineOfPyramid >> toploPackagesNames [

	| packages |
	packages := self blocPackagesNames asOrderedCollection.
	packages addAll: #( 'Pyramid-Toplo' 'Pyramid-Toplo-Tests' 'Pyramid-Toplo-Examples' ).
	^ packages asArray
]
