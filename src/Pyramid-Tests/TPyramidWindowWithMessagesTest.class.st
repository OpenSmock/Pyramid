Class {
	#name : #TPyramidWindowWithMessagesTest,
	#superclass : #TestCase,
	#instVars : [
		'window'
	],
	#category : #'Pyramid-Tests-cases-views'
}

{ #category : #running }
TPyramidWindowWithMessagesTest >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"
	window := PyramidTestWindow new.
	self window ensureMessagesServiceExists.
]

{ #category : #running }
TPyramidWindowWithMessagesTest >> tearDown [

	self window close
]

{ #category : #tests }
TPyramidWindowWithMessagesTest >> testAtMessagesAddItem [

	| message |
	message := PyramidCannotBuildMessageItem new
		           source: Object new;
		           because: PyramidError new.
	self window atMessagesAddItem: [ :builder |
		builder addMessage: message ].
	
	self assert: (self window services at: #messages) items size equals: 1.
	self assert: (self window services at: #messages) items first equals: message.
]

{ #category : #tests }
TPyramidWindowWithMessagesTest >> testEnsureMessagesServiceExists [

	self window ensureMessagesServiceExists.
	self assert: (self window doesServiceExists: #messages)
]

{ #category : #tests }
TPyramidWindowWithMessagesTest >> testHasMessagesToShow [

	| message |
	message := PyramidCannotBuildMessageItem new
		           source: Object new;
		           because: PyramidError new.

	self deny: self window hasMessagesToShow.
	self window atMessagesAddItem: [ :builder |
		builder addMessage: message ].
	self assert: self window hasMessagesToShow
]

{ #category : #tests }
TPyramidWindowWithMessagesTest >> testMessagesDialogIsNotOpened [

	| message |
	self assert: self window messagesDialogIsNotOpened.
	self window open.
	self assert: self window messagesDialogIsNotOpened.
	self window close.

	message := PyramidCannotBuildMessageItem new
		           source: Object new;
		           because: PyramidError new.
	self window atMessagesAddItem: [ :builder |
		builder addMessage: message ].
	self assert: self window messagesDialogIsNotOpened.
	self window open.
	self deny: self window messagesDialogIsNotOpened.
	self window close
]

{ #category : #tests }
TPyramidWindowWithMessagesTest >> testMessagesDialogIsOpened [

	| message |
	
	self deny: self window messagesDialogIsOpened.
	self window open.
	self deny: self window messagesDialogIsOpened.
	self window close.
	
	message := PyramidCannotBuildMessageItem new
		           source: Object new;
		           because: PyramidError new.
	self window atMessagesAddItem: [ :builder |
		builder addMessage: message ].
	self deny: self window messagesDialogIsOpened.
	self window open.
	self assert: self window messagesDialogIsOpened.
	self window close.
	
]

{ #category : #accessing }
TPyramidWindowWithMessagesTest >> window [

	^ window
]
