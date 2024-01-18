Class {
	#name : #PyramidFakePluginD,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #'meta-data' }
PyramidFakePluginD class >> dependencies [
	"Put symbol as the class name for each dependencies."

	^ { #PyramidFakePluginC }
]

{ #category : #initialization }
PyramidFakePluginD class >> initialize [

	<script>

]

{ #category : #testing }
PyramidFakePluginD class >> isTestPlugin [

	^ true
]
