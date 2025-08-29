"
A PyramidWorldTest is a test class for testing the behavior of PyramidWorld
"
Class {
	#name : #PyramidWorldTest,
	#superclass : #TestCase,
	#classInstVars : [
		'worldMenuItemCheck'
	],
	#category : #'Pyramid-IDE-Tests-menus'
}

{ #category : #accessing }
PyramidWorldTest class >> worldMenuItemCheck [

	^ worldMenuItemCheck
]

{ #category : #accessing }
PyramidWorldTest class >> worldMenuItemCheck: anObject [

	worldMenuItemCheck := anObject
]

{ #category : #'tests - menu' }
PyramidWorldTest class >> worldMenuItemTestMethod: anItem [
	"This method check if the pragma mecanism to setup a menu item is working"
	"Be aware to not inject behavior here because this is just a test method ant it is called when the menu is build!"

	<worldMenuItem: #Pyramid>
	worldMenuItemCheck := true.
	
	anItem ifNil:[ Exception signal: 'Menu item should be not nil' ].
	anItem item = (PyramidWorld menuKey) ifFalse:[ Exception signal: 'Menu item should be equals to ', PyramidWorld menuKey printString ].
]

{ #category : #running }
PyramidWorldTest >> setUp [

	super setUp.

	self class worldMenuItemCheck: false.
	self deny: self class worldMenuItemCheck.
]

{ #category : #tests }
PyramidWorldTest >> testCleanUp [

	PyramidWorld cleanUp
]

{ #category : #tests }
PyramidWorldTest >> testMenuKey [

	self assert: PyramidWorld menuKey equals: #Pyramid
]

{ #category : #tests }
PyramidWorldTest >> testOpenAbout [

	| object |
	object := PyramidWorld openAbout.
	self assert: object notNil
]

{ #category : #tests }
PyramidWorldTest >> testThemeIcons [

	| theme |	
	theme := PyramidWorld themeIcons.
	self assert: theme notNil.
	
	self deny: (theme iconNamed: #pin16) isAllWhite.
	self deny: (theme iconNamed: #pin24) isAllWhite.
	self deny: (theme iconNamed: #pin32) isAllWhite.
	
	self deny: (theme iconNamed: #pinPtah16) isAllWhite.
	self deny: (theme iconNamed: #pinPtah24) isAllWhite.
	self deny: (theme iconNamed: #pinPtah32) isAllWhite.
	
	self deny: (theme iconNamed: #logotype512) isAllWhite.
	self deny: (theme iconNamed: #cartouche512) isAllWhite.
]

{ #category : #tests }
PyramidWorldTest >> testWorldMenuBuilding [

	| menuBuilder menuMethods |
	menuBuilder := PragmaMenuAndShortcutRegistration new.
	PyramidWorld menuPyramidOn: menuBuilder.
	
	menuMethods := PyramidWorld class pragmas select:[ :p | p selector = #worldMenu ] thenCollect:[ :p | p methodSelector ].
	self assert: menuMethods notEmpty.
	
	menuMethods do:[ :p |
		PyramidWorld perform: p with: menuBuilder.
	].

	self assert: self class worldMenuItemCheck.
]
