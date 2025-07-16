Class {
	#name : #PyramidEditElementTreeDragAndDropPluginTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Bloc-plugin-edit-element-tree'
}

{ #category : #tests }
PyramidEditElementTreeDragAndDropPluginTest >> testCanMoveSelectedElementTargetOnNil [

	| plugin |
	plugin := PyramidEditElementTreeDragAndDropPlugin new.
	self assert:
		(plugin canMoveSelectedElement: {  } target: nil)
]

{ #category : #tests }
PyramidEditElementTreeDragAndDropPluginTest >> testCanMoveSelectedElementTargetOnNilAlternative [

	| plugin a |
	plugin := PyramidEditElementTreeDragAndDropPlugin new.
	a := BlElement new.
	self assert:
		(plugin canMoveSelectedElement: { a } target: nil)
]

{ #category : #tests }
PyramidEditElementTreeDragAndDropPluginTest >> testCanMoveSelectedElementTargetSimpleCase [

	| plugin |
	plugin := PyramidEditElementTreeDragAndDropPlugin new.
	self assert: (plugin canMoveSelectedElement: {  } target: BlElement new)
	
]

{ #category : #tests }
PyramidEditElementTreeDragAndDropPluginTest >> testCanMoveSelectedElementTargetWithDirectParentLink [

	| plugin target a b |
	plugin := PyramidEditElementTreeDragAndDropPlugin new.
	target := BlElement new.
	a := BlElement new.
	b := BlElement new.
	target addChild: a.
	a addChild: b.
	self assert: (plugin
			 canMoveSelectedElement: {
					 a.
					 b }
			 target: target)
]

{ #category : #tests }
PyramidEditElementTreeDragAndDropPluginTest >> testCanMoveSelectedElementTargetWithOneElement [

	| plugin target a |
	plugin := PyramidEditElementTreeDragAndDropPlugin new.
	target := BlElement new.
	a := BlElement new.
	self assert: (plugin canMoveSelectedElement: { a } target: target)
	
]

{ #category : #tests }
PyramidEditElementTreeDragAndDropPluginTest >> testCanMoveSelectedElementTargetWithTwoElement [

	| plugin target a b |
	plugin := PyramidEditElementTreeDragAndDropPlugin new.
	target := BlElement new.
	a := BlElement new.
	b := BlElement new.
	self assert: (plugin canMoveSelectedElement: { a . b } target: target)
	
]

{ #category : #tests }
PyramidEditElementTreeDragAndDropPluginTest >> testCanMoveSelectedElementTargetWithTwoElementAlternative [

	| plugin target a b |
	plugin := PyramidEditElementTreeDragAndDropPlugin new.
	target := BlElement new.
	a := BlElement new.
	b := BlElement new.
	a addChild: b.
	self assert: (plugin
			 canMoveSelectedElement: {
					 a.
					 b }
			 target: target)
]

{ #category : #tests }
PyramidEditElementTreeDragAndDropPluginTest >> testCannotMoveSelectedElementTargetWithDirectParent [

	| plugin target a |
	plugin := PyramidEditElementTreeDragAndDropPlugin new.
	target := BlElement new.
	a := BlElement new.
	a addChild: target.
	self deny: (plugin canMoveSelectedElement: { a } target: target)
]

{ #category : #tests }
PyramidEditElementTreeDragAndDropPluginTest >> testCannotMoveSelectedElementTargetWithIndirectParent [

	| plugin target a b |
	plugin := PyramidEditElementTreeDragAndDropPlugin new.
	target := BlElement new.
	a := BlElement new.
	b := BlElement new.
	a addChild: b.
	b addChild: target.
	self deny: (plugin canMoveSelectedElement: { a } target: target)
]

{ #category : #tests }
PyramidEditElementTreeDragAndDropPluginTest >> testCannotMoveSelectedElementTargetWithMultipleIndirectParents [

	| plugin target a b c d|
	plugin := PyramidEditElementTreeDragAndDropPlugin new.
	target := BlElement new.
	a := BlElement new.
	b := BlElement new.
	c := BlElement new.
	d := BlElement new.
	a addChild: b.
	b addChild: c.
	c addChild: d.
	d addChild: target.
	self deny: (plugin canMoveSelectedElement: { a } target: target)
]

{ #category : #tests }
PyramidEditElementTreeDragAndDropPluginTest >> testCannotMoveSelectedElementTargetWithMultipleIndirectParentsAlternative [

	| plugin target a b c d|
	plugin := PyramidEditElementTreeDragAndDropPlugin new.
	target := BlElement new.
	a := BlElement new.
	b := BlElement new.
	c := BlElement new.
	d := BlElement new.
	a addChild: b.
	b addChild: target.
	target addChild: c.
	c addChild: d.
	self deny: (plugin canMoveSelectedElement: { a . d } target: target)
]

{ #category : #tests }
PyramidEditElementTreeDragAndDropPluginTest >> testCannotMoveSelectedElementTargetWithTargetOnTarget [

	| plugin target |
	plugin := PyramidEditElementTreeDragAndDropPlugin new.
	target := BlElement new.
	self deny: (plugin canMoveSelectedElement: { target } target: target)
]
