Trait {
	#name : #TPyramidPlugin,
	#instVars : [
		'allSubsDependencies'
	],
	#category : #'Pyramid-core'
}

{ #category : #visiting }
TPyramidPlugin classSide >> accept: aVisitor [

	aVisitor applyOnPluginClass: self
]

{ #category : #'meta-data' }
TPyramidPlugin classSide >> dependencies [
	"Put symbol as the class name for each dependencies."

	^ {  }
]

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

{ #category : #comparing }
TPyramidPlugin >> <= aTPyramidPlugin [
	"
	true if self is in aTPyramidPlugin depencies.
	false if aTPyramidPlugin is in depencies of self."

	self = aTPyramidPlugin ifTrue: [ ^ true ].
	self class = aTPyramidPlugin class ifTrue: [ ^ true ].
	(self isDependentOf: aTPyramidPlugin class) ifTrue: [ ^ false ].
	^ true
]

{ #category : #visiting }
TPyramidPlugin >> accept: aVisitor [

	aVisitor applyOnPlugin:  self
]

{ #category : #adding }
TPyramidPlugin >> addPanelsOn: aPyramidSimpleWindow [
]

{ #category : #'meta-data' }
TPyramidPlugin >> allSubsDependencies [
	"return me + my depencies + their dependencies + their dep ..."

	allSubsDependencies ifNil: [
		self computeAllSubsDependencies ].
	^ allSubsDependencies
]

{ #category : #'as yet unclassified' }
TPyramidPlugin >> checkDependenciesWith: aCollectionOfPlugins [

	| errors |
	errors := self allSubsDependencies reject: [ :pluginClass |
		          aCollectionOfPlugins anySatisfy: [ :pluginInst | pluginInst class = pluginClass ] ].
	errors do: [ :each |
		PyramidPluginNotFoundError new
			querry: each;
			plugins: aCollectionOfPlugins;
			signal ]
]

{ #category : #'as yet unclassified' }
TPyramidPlugin >> computeAllSubsDependencies [

	| visitor |
	visitor := PyramidPluginDependenciesVisitor new.
	self accept: visitor.
	allSubsDependencies := visitor visited asArray.
	^ allSubsDependencies
]

{ #category : #actions }
TPyramidPlugin >> configureBuilder: aPyramidEditorBuilder [

	
]

{ #category : #connecting }
TPyramidPlugin >> connectOn: aPyramidEditor [
]

{ #category : #testing }
TPyramidPlugin >> isDependentOf: aClass [

	^ self allSubsDependencies anySatisfy: [ :each | aClass asString = each asString ]
]
