Class {
	#name : #PyramidTreePluginTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-plugin-tree-library'
}

{ #category : #tests }
PyramidTreePluginTest >> testAddColumns [

	| plugin |
	plugin := PyramidTreePlugin new.
	self assert: plugin treePresenter columns size equals: 0.
	plugin addColumns: { SpStringTableColumn new
		  title: 'Test1';
		  yourself. SpStringTableColumn new
		  title: 'Test2';
		  yourself. SpStringTableColumn new
		  title: 'Test3';
		  yourself }.
	self assert: plugin treePresenter columns size equals: 3.
]

{ #category : #tests }
PyramidTreePluginTest >> testRemoveSelectedElements [

	| plugin editor e1 e2 e3 |
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.
	editor := PyramidEditor new.
	editor window: PyramidSimpleWindow new.
	plugin := PyramidTreePlugin new.
	plugin editor: editor.
	editor projectModel addObserver: plugin treePresenter.
	editor projectModel firstLevelElements addAll: {
			e1.
			e2.
			e3 }.
	editor projectModel setSelection: {
			e1.
			e2 }.
	self assert: plugin treePresenter tree selectedItems size equals: 2.
	self assert: (plugin treePresenter tree selectedItems includes: e1).
	self assert: (plugin treePresenter tree selectedItems includes: e2).
	plugin removeSelectedElements.
	self assert: plugin treePresenter tree selectedItems size equals: 0.
	self assert: editor projectModel selection size equals: 0.
	self assert: editor projectModel firstLevelElements size equals: 1.
	self assert: editor projectModel firstLevelElements first equals: e3.
]
