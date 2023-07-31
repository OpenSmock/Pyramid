Extension { #name : #BlElement }

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
