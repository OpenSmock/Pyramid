Trait {
	#name : #TPyramidPlugin,
	#category : #'Pyramid-core'
}

{ #category : #initialization }
TPyramidPlugin classSide >> initialize [

	<script>
	self = TPyramidPlugin ifTrue: [ ^ self ].
	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #initialization }
TPyramidPlugin classSide >> install [
	"Do some stuff here when the plugin used class oriented behavior"
]

{ #category : #initialization }
TPyramidPlugin classSide >> reset [

	<script>
	self uninstall.
	self install
]

{ #category : #initialization }
TPyramidPlugin classSide >> uninstall [
	"Undo some stuff here when the plugin used class oriented behavior"
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
