Class {
	#name : #PyramidFakePluginC,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #'meta-data' }
PyramidFakePluginC class >> dependencies [
	"Put symbol as the class name for each dependencies."

	^ { #PyramidFakePluginB }
]

{ #category : #initialization }
PyramidFakePluginC class >> initialize [

	<script>

]
