Class {
	#name : #PyramidNavigationPluginTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-plugin-navigation'
}

{ #category : #tests }
PyramidNavigationPluginTest >> testRemoveSelectedElements [

	| plugin editor e1 e2 e3 |
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	editor := PyramidEditor new.
	editor window: PyramidSimpleWindow new.
	plugin := PyramidNavigationPlugin new.
	plugin connectOn: editor.
	editor projectModel firstLevelElements addAll: {
			e1.
			e2.
			e3 }.
	editor projectModel setSelection: {
			e1.
			e2 }.
	self assert: plugin navigation selectionPanel treeTable selectedItems size equals: 2.
	self assert: (plugin navigation selectionPanel treeTable selectedItems includes: e1).
	self assert: (plugin navigation selectionPanel treeTable selectedItems includes: e2).
	plugin removeSelectedElements.
	self assert: plugin navigation selectionPanel treeTable selectedItems size equals: 0.
	self assert: editor projectModel selection size equals: 0.
	self assert: editor projectModel firstLevelElements size equals: 1.
	self assert: editor projectModel firstLevelElements first equals: e3
]
