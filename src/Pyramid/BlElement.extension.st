Extension { #name : #BlElement }

{ #category : #'*Pyramid' }
BlElement >> editWithPyramid [

	| editor  oldParent |
	editor := PyramidPluginManager uniqueInstance makeEditor.
	oldParent := self parent.
	self hasParent ifTrue: [ oldParent removeChild: self ].

	editor projectModel roots add: self.
	editor window whenClosedDo: [ oldParent ifNotNil: [ oldParent addChild: self ] ].

	editor window open.
	^ editor
]

{ #category : #'*Pyramid' }
BlElement >> openInNewSpaceWithPyramidShortcut [

	| space isEdit |
	space := self openInNewSpace.
	isEdit := false.
	space when: BlKeyDownEvent do: [ :evt |
		| editor whenClosedDo |
		isEdit ifFalse: [
			evt key = KeyboardKey F12 ifTrue: [
				isEdit := true.
				editor := space editWithPyramid.
				whenClosedDo := editor window whenClosedDo.
				editor window whenClosedDo: [
					whenClosedDo value.
					isEdit := false ] ] ] ].

	^ space
]
