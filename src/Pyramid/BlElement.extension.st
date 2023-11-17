Extension { #name : #BlElement }

{ #category : #'*Pyramid' }
BlElement >> editWithPyramid [

	| editor  oldParent |
	editor := PyramidEditor buildEditor.
	
	self flag:'labordep: the code below is too complicated, we need to have a more simple API to edit a BlElement, for example editElement:'.
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
	self deprecated:'use the edition capacity in pyramid properties'.
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
