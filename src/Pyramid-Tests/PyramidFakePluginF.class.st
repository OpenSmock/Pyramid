Class {
	#name : #PyramidFakePluginF,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #'meta-data' }
PyramidFakePluginF class >> dependencies [
	"Put symbol as the class name for each dependencies."

	^ { #PyramidFakePluginE. #PyramidFakePluginD }
]

{ #category : #initialization }
PyramidFakePluginF class >> initialize [

	<script>

]
