Class {
	#name : #PyramidContextMenuPluginTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-plugin-context-menu'
}

{ #category : #tests }
PyramidContextMenuPluginTest >> testMenuBrowseAndInspectOn [

	| builder menu |
	builder := PyramidMenuPanelBuilder new.
	PyramidContextMenuPlugin new menuBrowseAndInspectOn: builder.
	
	menu := builder menuFor: {  }.
	self assert: menu menuGroups isEmpty.
	
	menu := builder menuFor: { BlElement new }.
	self assert: menu menuGroups size equals: 1.
	self assert: menu menuGroups first menuItems size equals: 2.
	
	menu := builder menuFor: { BlElement new id: #test; yourself }.
	self assert: menu menuGroups size equals: 1.
	self assert: menu menuGroups first menuItems size equals: 2.
	
	menu := builder menuFor: { BlElement new . BlElement new id: #test; yourself }.
	self assert: menu menuGroups size equals: 1.
	self assert: menu menuGroups first menuItems size equals: 2.
]

{ #category : #tests }
PyramidContextMenuPluginTest >> testMenuContextOn [

	| builder menu |
	builder := PyramidMenuPanelBuilder new.
	PyramidContextMenuPlugin new menuContextOn: builder.
	
	menu := builder menuFor: {  }.
	self assert: menu menuGroups isEmpty.
	
	menu := builder menuFor: { BlElement new }.
	self assert: menu menuGroups size equals: 1.
	self assert: menu menuGroups first menuItems size equals: 1.
	self assert: (menu menuGroups first menuItems first name beginsWith: '@\no name\ ').
	
	menu := builder menuFor: { BlElement new id: #test; yourself }.
	self assert: (menu menuGroups first menuItems first name beginsWith: 'test ').
	
	menu := builder menuFor: { BlElement new . BlElement new id: #test; yourself }.
	self assert: menu menuGroups first menuItems first name equals: '2 elements'.
]
