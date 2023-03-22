Class {
	#name : #PyViewPlayground,
	#superclass : #PyViewAbstract,
	#traits : 'PyBlocInput',
	#classTraits : 'PyBlocInput classTrait',
	#instVars : [
		'code',
		'button'
	],
	#category : #'Pyramid-ZZZ-Deprecated'
}

{ #category : #layout }
PyViewPlayground >> defaultLayout [

	^ SpBoxLayout newTopToBottom
	spacing: 4;
		  add: button expand: false;
		  add: code;
		  yourself
]

{ #category : #'public access' }
PyViewPlayground >> evaluate [

	code evaluate: code selectedTextOrLine
		         onCompileError: [ ^ self ]
		         onError: [ :e | e pass ].
]

{ #category : #initialization }
PyViewPlayground >> initializePresenters [

	button := self newButton
		          label: 'Do it';
		          icon: (self iconNamed: #smallDoIt);
		          action: [ self evaluate ];
		          yourself.
	code := self newCode
		        beForObject: nil;
		        text: '"You must select a BlElement."';
		        whenSubmitDo: [ Transcript show: 'hello ' ];
		        whenResetDo: [ Transcript show: 'bye ' ];
		        yourself
]

{ #category : #accessing }
PyViewPlayground >> pageIcon [

	^ self iconNamed: #workspace
]

{ #category : #accessing }
PyViewPlayground >> pageTitle [

	^ 'Playground'
]

{ #category : #'as yet unclassified' }
PyViewPlayground >> receiveNewBlElement: aBlElement [

	code
		text: 'self';
		beForObject: aBlElement
]
