Class {
	#name : #PyramidFakePluginE,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #'meta-data' }
PyramidFakePluginE class >> dependencies [
	"Put symbol as the class name for each dependencies."

	^ { #PyramidFakePluginC . #PyramidFakePluginD }
]

{ #category : #initialization }
PyramidFakePluginE class >> initialize [

	<script>

]

{ #category : #testing }
PyramidFakePluginE class >> isTestPlugin [

	^ true
]
