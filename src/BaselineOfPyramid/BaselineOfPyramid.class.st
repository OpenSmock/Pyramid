Class {
	#name : #BaselineOfPyramid,
	#superclass : #BaselineOf,
	#category : #BaselineOfPyramid
}

{ #category : #baselines }
BaselineOfPyramid >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec postLoadDoIt: #postload:package:.
		self dependencies: spec.
		spec
			package: #Pyramid
			with: [ spec requires: #( #BlocSerialization #Bloc ) ];
			package: #'Pyramid-Tests'
			with: [ spec requires: #( #Pyramid ) ] ]
]

{ #category : #baselines }
BaselineOfPyramid >> dependencies: spec [

		spec
			baseline: #Bloc
			with: [
			spec repository: 'github://pharo-graphics/Bloc:dev-1.0/src' ].
		spec
			baseline: #BlocSerialization
			with: [
			spec repository: 'github://OpenSmock/Bloc-Serialization:main/src' ].
]

{ #category : #actions }
BaselineOfPyramid >> postload: loader package: packageSpec [

	PyramidPluginManager reset
]
