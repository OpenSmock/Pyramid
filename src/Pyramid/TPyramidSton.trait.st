Trait {
	#name : #TPyramidSton,
	#category : #'Pyramid-plugin-save'
}

{ #category : #inspecting }
TPyramidSton classSide >> edit [

	<script>
	| model |
	model := PyramidSaveModel new
		         savingClassName: self name;
		         savingMethodName: #pystonSpec;
		         savingPackageName: self package name;
		         onClass;
		         yourself.


	PyramidSavePlugin
		openOn: self pystonSpec materializeAsBlElement
		saveModel: model
]

{ #category : #inspecting }
TPyramidSton classSide >> inspect [

	<script>
	| element |
	element := self new.
	element buildElements.
	element inspect
]

{ #category : #inspecting }
TPyramidSton classSide >> open [

	<script>
	| element |
	element := self new.
	element buildElements.
	element openInNewSpace
]

{ #category : #'as yet unclassified' }
TPyramidSton classSide >> pystonSpec [
<pySTON>
^ 'OrderedCollection []'
]

{ #category : #'as yet unclassified' }
TPyramidSton >> buildElements [

	self hasChildren ifTrue: [ self removeChildren ].
	self addChild: self class pystonSpec materializeAsBlElement.
]
