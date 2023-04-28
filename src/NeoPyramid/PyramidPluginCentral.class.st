Class {
	#name : #PyramidPluginCentral,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'spaceView'
	],
	#category : #'NeoPyramid-plugin-central'
}

{ #category : #initialization }
PyramidPluginCentral class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #adding }
PyramidPluginCentral >> addPanelsOn: aPyramidSimpleWindow [

	self flag: #TODO. "Remove self spaceView presenter and modify connectOn: method."
	aPyramidSimpleWindow
		at: #center
		addItem: [ :builder |
		builder makePresenter: self spaceView presenter ]
]

{ #category : #'as yet unclassified' }
PyramidPluginCentral >> buildViewFrom: aPyramidGlobalViewBuilder [

	aPyramidGlobalViewBuilder model centralViews add: self spaceView
]

{ #category : #'as yet unclassified' }
PyramidPluginCentral >> connectOn: aPyramidEditor [

	self spaceView presenter editor: aPyramidEditor
]

{ #category : #initialization }
PyramidPluginCentral >> initialize [

	self initializeView
]

{ #category : #initialization }
PyramidPluginCentral >> initializeView [

	spaceView := PyramidSimplePresenter new
		             presenter: PyramidSpaceView new;
		             constraints: [ :c | c expand: true ];
		             yourself
]

{ #category : #accessing }
PyramidPluginCentral >> spaceView [

	^ spaceView
]
