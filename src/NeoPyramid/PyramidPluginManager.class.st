Class {
	#name : #PyramidPluginManager,
	#superclass : #Object,
	#instVars : [
		'plugins'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'NeoPyramid-core'
}

{ #category : #initialization }
PyramidPluginManager class >> initialize [

	uniqueInstance := self basicNew initialize.
]

{ #category : #'instance creation' }
PyramidPluginManager class >> new [

	Error signal: 'Use uniqueInstance instead.'
]

{ #category : #initialization }
PyramidPluginManager class >> reset [
<script>
self initialize.
TPyramidPlugin users do: [ :each | each initialize ]
]

{ #category : #'instance creation' }
PyramidPluginManager class >> uniqueInstance [

	uniqueInstance ifNil: [ self initialize ].
	^ uniqueInstance
]

{ #category : #adding }
PyramidPluginManager >> addPlugin: aPluginClass [

	self plugins add: aPluginClass
]

{ #category : #initialization }
PyramidPluginManager >> initialize [

	plugins := Set new
]

{ #category : #'as yet unclassified' }
PyramidPluginManager >> makeEditor [

	^ PyramidEditorBuilder new
	 	  viewBuilder: PyramidEditorViewBuilder new;
		  plugins: (self plugins collect: [ :class | class new ]);
		  build
]

{ #category : #'as yet unclassified' }
PyramidPluginManager >> makeEditorWithNewView [

	^ PyramidEditorBuilderV2 new
		  plugins: (self plugins collect: [ :class | class new ]);
		  build
]

{ #category : #'as yet unclassified' }
PyramidPluginManager >> plugins [

	^ plugins
]
