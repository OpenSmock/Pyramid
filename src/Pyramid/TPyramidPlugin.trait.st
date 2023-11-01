Trait {
	#name : #TPyramidPlugin,
	#category : #'Pyramid-core'
}

{ #category : #initialization }
TPyramidPlugin classSide >> initialize [ 
	<script>

	self = TPyramidPlugin ifTrue:[ ^ self ].
	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #adding }
TPyramidPlugin >> addPanelsOn: aPyramidSimpleWindow [
]

{ #category : #actions }
TPyramidPlugin >> configureBuilder: aPyramidEditorBuilder [

	
]

{ #category : #connecting }
TPyramidPlugin >> connectOn: aPyramidEditor [
]
