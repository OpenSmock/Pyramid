Trait {
	#name : #TPyramidWindowWithMessages,
	#instVars : [
		'messagesDialog'
	],
	#category : #'Pyramid-views'
}

{ #category : #accessing }
TPyramidWindowWithMessages >> atMessagesAddItem: aBlock [

	self ensureMessagesServiceExists.
	self at: #messages addItem: aBlock
]

{ #category : #'initialize-release' }
TPyramidWindowWithMessages >> close [

	self closeAnyMessagesDialog.
	^ self closeWindow
]

{ #category : #messages }
TPyramidWindowWithMessages >> closeAnyMessagesDialog [

	self messagesDialogIsOpened ifFalse: [ ^ self ].
	self messagesDialog close.
	messagesDialog := nil
]

{ #category : #accessing }
TPyramidWindowWithMessages >> ensureMessagesServiceExists [
	(self doesServiceExists: #messages) ifFalse: [
		PyramidPanelModel messages installOn: self at: #messages ].
	
]

{ #category : #messages }
TPyramidWindowWithMessages >> hasMessagesToShow [

	^ (self services at: #messages) items isNotEmpty
]

{ #category : #messages }
TPyramidWindowWithMessages >> messagesDialog [

	^ messagesDialog.
]

{ #category : #messages }
TPyramidWindowWithMessages >> messagesDialogIsNotOpened [

	^ self messagesDialogIsOpened not
]

{ #category : #messages }
TPyramidWindowWithMessages >> messagesDialogIsOpened [

	^ self messagesDialog isNotNil
]

{ #category : #'instance creation' }
TPyramidWindowWithMessages >> open [

	| result |
	result := self openWindow.
	self openAnyMessagesDialog.
	^ result
]

{ #category : #messages }
TPyramidWindowWithMessages >> openAnyMessagesDialog [

	self ensureMessagesServiceExists.
	(self hasMessagesToShow and: [ self messagesDialogIsNotOpened ])
		ifTrue: [
			messagesDialog := (self services at: #messages) presenter
				                  asDialogWindow open ]
]
