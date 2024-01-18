Class {
	#name : #PyramidFakePluginB,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #'meta-data' }
PyramidFakePluginB class >> dependencies [
	"Put symbol as the class name for each dependencies."

	^ { #PyramidFakePluginA }
]

{ #category : #initialization }
PyramidFakePluginB class >> initialize [

	<script>

]

{ #category : #testing }
PyramidFakePluginB class >> isTestPlugin [

	^ true
]
