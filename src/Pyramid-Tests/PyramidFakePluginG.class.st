Class {
	#name : #PyramidFakePluginG,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #'meta-data' }
PyramidFakePluginG class >> dependencies [
	"Put symbol as the class name for each dependencies."

	^ { #PyramidFakePluginA . #PyramidFakePluginB . #PyramidFakePluginC . #PyramidFakePluginF }
]

{ #category : #initialization }
PyramidFakePluginG class >> initialize [

	<script>

]
