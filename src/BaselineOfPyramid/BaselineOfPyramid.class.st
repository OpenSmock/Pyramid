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
			package: #Pyramid
			with: [ spec requires: #( #'BlocSerialization' #Bloc
					   #'Pyramid-Spec' ) ];
			package: #'Pyramid-Spec';
			baseline: #Bloc
			with: [ 
				spec repository: 'github://pharo-graphics/Bloc:dev-1.0/src' ];
			baseline: #'BlocSerialization'
			with: [ 
				spec repository: 'github://OpenSmock/Bloc-Serialization:main/src' ] ]
]
