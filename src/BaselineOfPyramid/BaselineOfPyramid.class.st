Class {
	#name : #BaselineOfPyramid,
	#superclass : #BaselineOf,
	#category : #BaselineOfPyramid
}

{ #category : #baselines }
BaselineOfPyramid >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			baseline: #Bloc
			with: [
			spec repository: 'github://pharo-graphics/Bloc:dev-1.0/src' ].
		spec
			baseline: #BlocSerialization
			with: [
			spec repository: 'github://OpenSmock/Bloc-Serialization:main/src' ].
		spec package: #'Pyramid-Commands'.
		spec package: #'Pyramid-Spec'.
		spec
			package: #Pyramid
			with: [
			spec requires: #( #BlocSerialization #Bloc #'Pyramid-Spec' #'Pyramid-Commands' ) ] ]
]
