Extension { #name : #BlElement }

{ #category : #'*Pyramid-Bloc' }
BlElement >> asIcon [

	^ self layout asIcon
]

{ #category : #'*Pyramid-Bloc' }
BlElement >> editWithPyramid [

	| editor oldParent |
	editor := PyramidEditor buildEditor.

	self flag:
		'labordep: the code below is too complicated, we need to have a more simple API to edit a BlElement, for example editElement:'.
	oldParent := self parent.
	self hasParent ifTrue: [ oldParent removeChild: self ].

	editor projectModel firstLevelElements add: self.
	editor window whenClosedDo: [
		oldParent ifNotNil: [ oldParent addChild: self ] ].

	editor window open.
	^ editor
]

{ #category : #'*Pyramid-Bloc' }
BlElement >> parentsShouldSerializeChildren [

	self parent ifNil: [ ^ true ].
	self parent shouldSerializedChildren ifFalse: [ ^ false ].
	^ self parent parentsShouldSerializeChildren
]
