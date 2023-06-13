Trait {
	#name : #TPyramidSton,
	#category : #'Pyramid-plugin-save'
}

{ #category : #inspecting }
TPyramidSton classSide >> edit [

	<script>
	| model element children |
	model := PyramidSaveModel new
		         savingClassName: self name;
		         savingMethodName: #pystonSpec;
		         savingPackageName: self package name;
		         onClass;
		         yourself.

	element := self new buildElements.
	children := element children.
	element removeChildren.
	PyramidSavePlugin openOn: children saveModel: model
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
	self addChildren: self class pystonSpec materializeAsBlElement
]
