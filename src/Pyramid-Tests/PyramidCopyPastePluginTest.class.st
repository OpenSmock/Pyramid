Class {
	#name : 'PyramidCopyPastePluginTest',
	#superclass : 'TestCase',
	#category : 'Pyramid-Tests-cases-plugin-copy',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-copy'
}

{ #category : 'tests' }
PyramidCopyPastePluginTest >> testCopyAsStonMenu [

	| menuBuilder menu materialize |
	self skip.
	self flag: #BUG. "Clipboard comportment is not predictable."
	
	menuBuilder := PyramidMenuPanelBuilder new.
	PyramidCopyPastePlugin new copyAsStonMenu: menuBuilder.

	menu := menuBuilder menuFor: {  }.
	self assert: menu menuGroups size equals: 0.

	menu := menuBuilder menuFor: { BlElement new }.
	self assert: menu menuGroups size equals: 1.
	self assert: menu menuGroups first menuItems size equals: 1.
	self assert: menu menuGroups first menuItems first isEnabled.
	Clipboard clipboardText: ''.
	self assert: Clipboard clipboardText equals: ''.
	menu menuGroups first menuItems first action value.
	self deny: Clipboard clipboardText equals: ''.
	materialize := Clipboard clipboardText materializeAsBlElement.
	self assert: materialize isCollection.
	self assert: materialize size equals: 1.
	self assert: materialize first class equals: BlElement.

	menu := menuBuilder menuFor: {
			        BlElement new.
			        BlElement new }.
	self assert: menu menuGroups size equals: 1.
	self assert: menu menuGroups first menuItems size equals: 1.
	self deny: menu menuGroups first menuItems first isEnabled
]
