"
A PyramidWorldTest is a test class for testing the behavior of PyramidWorld
"
Class {
	#name : #PyramidWorldTest,
	#superclass : #TestCase,
	#category : #'Pyramid-IDE-Tests-menus'
}

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
PyramidWorldTest >> testWorldMenuPostBuildSetup [

	"just test if there is no error"
	PyramidWorld worldMenuPostBuildSetup: nil
]
