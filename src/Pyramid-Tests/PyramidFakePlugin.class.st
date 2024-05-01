Class {
	#name : #PyramidFakePlugin,
	#superclass : #Object,
	#instVars : [
		'addPanelsOn',
		'configureBuilder',
		'connectOn'
	],
	#category : #'Pyramid-Tests-cases-core'
}

{ #category : #asserting }
PyramidFakePlugin class >> shouldInstall [

	^ true
]

{ #category : #adding }
PyramidFakePlugin >> addPanelsOn: aPyramidSimpleWindow [

	addPanelsOn := true
]

{ #category : #actions }
PyramidFakePlugin >> configureBuilder: aPyramidEditorBuilder [

	configureBuilder:=true
]

{ #category : #accessing }
PyramidFakePlugin >> connectOn: aPyramidEditor [

	connectOn:=true
]

{ #category : #initialization }
PyramidFakePlugin >> initialize [

	addPanelsOn := false. configureBuilder := false. connectOn := false
]

{ #category : #testing }
PyramidFakePlugin >> isInstalled [


	^ addPanelsOn & configureBuilder & connectOn
]
