Class {
	#name : #PyramidPluginManager,
	#superclass : #Object,
	#instVars : [
		'pluginClasses'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Pyramid-core'
}

{ #category : #'instance creation' }
PyramidPluginManager class >> cleanUp [
	<script>
	
	self reset.
]

{ #category : #'instance creation' }
PyramidPluginManager class >> cleanUp: anObject [
	"clean up pyramid plugins"

	self cleanUp
]

{ #category : #initialization }
PyramidPluginManager class >> imagePluginClasses [

	<script: 'self imagePluginClasses inspect'>
	^ TPyramidPlugin users reject: [ :each | each isTestPlugin ]
]

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
	"Initialize each class implementing the trait TPyramidPlugin."

	| imagePlugins |
	self initialize.
	imagePlugins := self imagePluginClasses.
	imagePlugins do: [ :each | each uninstall ].
	imagePlugins do: [ :each | each initialize ]
]

{ #category : #'instance creation' }
PyramidPluginManager class >> uniqueInstance [

	uniqueInstance ifNil: [ self initialize ].
	^ uniqueInstance
]

{ #category : #adding }
PyramidPluginManager >> addPlugin: aPluginClass [

	self pluginClasses add: aPluginClass.

	"Install the class of the plugin when added"
	aPluginClass install.

]

{ #category : #private }
PyramidPluginManager >> buildEditor [

	^ PyramidEditorBuilder new
		  plugins: (self pluginClasses collect: [ :class | class new ]);
		  build
]

{ #category : #initialization }
PyramidPluginManager >> initialize [

	super initialize.
	pluginClasses := Set new
]

{ #category : #adding }
PyramidPluginManager >> isPluginInstalled: aPluginClass [

	^ self pluginClasses includes: aPluginClass
]

{ #category : #private }
PyramidPluginManager >> makeEditor [

	^ PyramidEditorBuilder new
		  plugins: (self pluginClasses collect: [ :class | class new ]);
		  build
]

{ #category : #private }
PyramidPluginManager >> pluginClasses [

	^ pluginClasses
]

{ #category : #adding }
PyramidPluginManager >> removePlugin: aPluginClass [

	self pluginClasses remove: aPluginClass ifAbsent: [  ].

	"Uninstall the class of the plugin when added"
	aPluginClass uninstall
]
