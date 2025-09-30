Class {
	#name : #PyramidMenuExtension,
	#superclass : #Object,
	#traits : 'TPyramidSpaceExtension + TPyramidEditorExtension',
	#classTraits : 'TPyramidSpaceExtension classTrait + TPyramidEditorExtension classTrait',
	#instVars : [
		'menu',
		'projectModel'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #'as yet unclassified' }
PyramidMenuExtension >> backgroundColors [

	^ {
		Color white.
		Color gray.
		Color black }
]

{ #category : #accessing }
PyramidMenuExtension >> editor: aPyramidEditor [

	self menu: (aPyramidEditor window services at: #selectionMenu)
]

{ #category : #displaying }
PyramidMenuExtension >> installOn: aBuilder [

	self builder: aBuilder.

	self elementAtDisplays background: Color gray.

	self elementAtEvents addEventHandler: (BlEventHandler
			 on: BlSecondaryMouseUpEvent
			 do: [ :evt | self showMenuAt: evt ])
]

{ #category : #accessing }
PyramidMenuExtension >> menu [

	^ menu
]

{ #category : #accessing }
PyramidMenuExtension >> menu: anObject [

	menu := anObject
]

{ #category : #accessing }
PyramidMenuExtension >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidMenuExtension >> projectModel: aProjectModel [

	projectModel := aProjectModel
]

{ #category : #accessing }
PyramidMenuExtension >> showMenuAt: anEvent [

	| currentMenu chooseColorSubMenu |
	self menu ifNil: [ ^ self ].
	self projectModel ifNil: [ ^ self ].
	currentMenu := self menu builder menuFor: self projectModel selection.
	chooseColorSubMenu := SpMenuPresenter new.
	self backgroundColors do: [ :color |
			chooseColorSubMenu addItem: [ :item |
					item
						name: color printString;
						action: [ self elementAtDisplays background: color ];
						icon: [
								self elementAtDisplays background paint color = color
									ifTrue: [ Smalltalk ui icons iconNamed: #testGreen ]
									ifFalse: [ Smalltalk ui icons iconNamed: #testNotRun ] ] ] ].

	currentMenu addGroup: [ :group |
			group addItem: [ :item |
					item
						name: 'Space background color';
						subMenu: chooseColorSubMenu ] ].
	currentMenu openWithSpecAt: self currentHand position
]
