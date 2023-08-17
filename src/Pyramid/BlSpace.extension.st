Extension { #name : #BlSpace }

{ #category : #'*Pyramid' }
BlSpace >> editWithPyramid [

	| editor elements spacePlaceholder |
	spacePlaceholder := (self root exportAsForm dimmed: 0.5) asElement.
	spacePlaceholder addChildren:
		PyramidLogo logoOpenInPyramid materializeAsBlElement.
	editor := PyramidPluginManager uniqueInstance makeEditor.
	editor window open.

	elements := self root children asArray.
	elements do: [ :each | self root removeChild: each ].
	self root addChild: spacePlaceholder.

	editor projectModel roots addAll: elements.
	editor window whenClosedDo: [
		| pyramidRoots |
		pyramidRoots := editor projectModel roots asArray.
		pyramidRoots do: [ :each |
			each hasParent ifTrue: [ each parent removeChild: each ] ].
		editor projectModel roots removeAll.
		self root removeChildren.
		self root addChildren: pyramidRoots ].
	^ editor
]
