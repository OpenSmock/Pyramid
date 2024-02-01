Extension { #name : #BlSpace }

{ #category : #'*Pyramid' }
BlSpace >> editWithPyramid [

	| editor elements spacePlaceholder openFromSpacePlugin |
	"Prepare image to replace the application view"
	spacePlaceholder := (self root exportAsForm dimmed: 0.5) asElement.
	spacePlaceholder addChildren:
		PyramidBlElementHelper openInPyramidHelper materializeAsBlElement.

	"Build editor"
	editor := PyramidEditor buildEditor.

	"PyramidOpenFromSpacePlugin used to recover theme if Toplo is loaded."
	openFromSpacePlugin := editor findPlugin: PyramidOpenFromSpacePlugin.
	openFromSpacePlugin extensions do: [ :each |
		each configureOpenFromSpace: self ].

	"Open editor"
	editor window open.

	self flag:
		'labordep: the code below is too complicated, we need to have a more simple API to edit a BlSpace, for example editSpace:'.

	self userData at: #pyramid_isOnEdition put: true.

	"Remove all blElement of the application root to be replaced by the image"
	elements := self root children asArray copy.
	self root removeChildren.
	self root addChild: spacePlaceholder.

	"Add child into Pyramid to be edited"
	editor projectModel firstLevelElements addAll: elements.
	editor window whenClosedDo: [
		| pyramidRoots |
		pyramidRoots := editor projectModel firstLevelElements asArray.
		pyramidRoots do: [ :each |
			each hasParent ifTrue: [ each parent removeChild: each ] ].
		editor projectModel firstLevelElements removeAll.
		self root removeChildren.
		self root addChildren: pyramidRoots.
		self userData removeKey: #pyramid_isOnEdition.
		openFromSpacePlugin extensions do: [ :each |
		each configureCloseOnSpace: self ]. ].

	^ editor
]
