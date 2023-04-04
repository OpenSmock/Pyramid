Class {
	#name : #PySTONClyToolMorph,
	#superclass : #ClyBrowserToolMorph,
	#instVars : [
		'blElement',
		'method',
		'imageMorph'
	],
	#category : #'Pyramid-Utilities'
}

{ #category : #activation }
PySTONClyToolMorph class >> browserTabActivation [
	"This declaration specifies that in any browser when methods are selected, a diff tool will be available in a tab."

	<classAnnotation>
	^ClyTabActivationStrategyAnnotation for: ClyMethod asCalypsoItemContext
]

{ #category : #accessing }
PySTONClyToolMorph class >> shouldBeActivatedInContext: aBrowserContext [

	^ aBrowserContext selectedMethods anySatisfy: [ :method | 
		  method pragmas anySatisfy: [ :pragma | pragma selector = #pySTON ] ]
]

{ #category : #accessing }
PySTONClyToolMorph class >> tabOrder [

	^ 1
]

{ #category : #accessing }
PySTONClyToolMorph >> activationPriority [

	^ self tabOrder
]

{ #category : #controlling }
PySTONClyToolMorph >> attachToSystem [

	browser system
		when: (ClyMethodChange ofAll: { 
					 self method })
		send: #triggerUpdate
		to: self
]

{ #category : #testing }
PySTONClyToolMorph >> belongsToCurrentBrowserContext [

	^ browser isMethodSelected: self method
]

{ #category : #testing }
PySTONClyToolMorph >> belongsToRemovedBrowserContext [

	^ self method isInstalled
]

{ #category : #building }
PySTONClyToolMorph >> build [

	| buttonEditor buttonOpen |
	buttonEditor := self buttonEditor.
	buttonOpen := self buttonOpen.
	imageMorph := ImageMorph withForm: blElement exportAsForm.
	self addMorph: imageMorph fullFrame: LayoutFrame identity.
	self addMorph: buttonEditor.
	self addMorph: buttonOpen
]

{ #category : #'as yet unclassified' }
PySTONClyToolMorph >> buttonEditor [

	| button |
	button := SimpleButtonMorph newWithLabel: 'Edit'.
	button
		actionSelector: #value;
		helpText: 'Open the PyEditor on this STON';
		extent: 100 @ 25;
		useRoundedCorners;
		color: Color white.
	button target: [ self openEditor ].

	^ button
]

{ #category : #'as yet unclassified' }
PySTONClyToolMorph >> buttonOpen [

	| button |
	button := SimpleButtonMorph newWithLabel: 'Open'.
	button
		actionSelector: #value;
		helpText: 'Open the this STON in new space';
		extent: 100 @ 25;
		useRoundedCorners;
		color: Color white.
	button target: [ self openInNewSpace ].

	^ button
]

{ #category : #initialization }
PySTONClyToolMorph >> defaultIconName [

	^ #smallPaint
]

{ #category : #initialization }
PySTONClyToolMorph >> defaultTitle [

	^ 'Bloc preview'
]

{ #category : #controlling }
PySTONClyToolMorph >> detachFromSystem [

	browser system unsubscribe: self
]

{ #category : #'as yet unclassified' }
PySTONClyToolMorph >> editorButton [

	| button |
	button := SimpleButtonMorph newWithLabel: 'Edit'.
	button
		actionSelector: #value;
		helpText: 'Open the PyEditor on this STON';
		extent: 100 @ 25;
		useRoundedCorners;
		color: Color white.
	button target: [ self openEditor. 
		].

	^ button
]

{ #category : #'as yet unclassified' }
PySTONClyToolMorph >> getClassName [

	^ (Character space split: method classBinding value name) first
]

{ #category : #'as yet unclassified' }
PySTONClyToolMorph >> getMethodName [

	^ method selector
]

{ #category : #'as yet unclassified' }
PySTONClyToolMorph >> getStonFromMethod [

	^(method literals select: [ :e | e isString ]) first.
]

{ #category : #testing }
PySTONClyToolMorph >> isSimilarTo: anotherBrowserTool [

	(super isSimilarTo: anotherBrowserTool) ifFalse: [ ^ false ].

	^ self method = anotherBrowserTool method
]

{ #category : #accessing }
PySTONClyToolMorph >> method [

	^ method
]

{ #category : #accessing }
PySTONClyToolMorph >> openEditor [
	"PyEditorPresenter
			openOnSton: self getStonFromMethod
			fromClass: self getClassName
			andMethod: self getMethodName "
	| class |
	class := method classBinding value.
	class isMeta ifTrue: [ PyBusiness new openOn: method classBinding value instanceSide selector: method selector. ^ self ].
	PyBusiness new openOn: method classBinding value new selector: method selector.
	
	
]

{ #category : #accessing }
PySTONClyToolMorph >> openInNewSpace [

	| class elements space |
	class := method classBinding value.
	elements := class isMeta ifTrue: [
		 (method classBinding value instanceSide perform: method selector) materializeAsBlElement
		] ifFalse: [ 
	(method classBinding value new perform: method selector) materializeAsBlElement ].

	elements isCollection ifFalse: [ elements := { elements } ].
	
	elements ifEmpty: [ ^ self ].
	space := elements first openInNewSpaceWithPyramidShortcut.
	space root addChildren: elements allButFirst.
]

{ #category : #printing }
PySTONClyToolMorph >> printContext [

	^ self method printSystemPath
]

{ #category : #initialization }
PySTONClyToolMorph >> resetStateForSnapshot [

	super resetStateForSnapshot.

	imageMorph := nil
]

{ #category : #initialization }
PySTONClyToolMorph >> setUpModelFromContext [

	method := context firstSelectedMethod.
	blElement := self getStonFromMethod materializeAsBlElement.
	blElement isCollection ifTrue: [
		blElement := BlElement new
			             addChildren: blElement;
			             size: 1500 @ 1500;
			             yourself ]
]

{ #category : #updating }
PySTONClyToolMorph >> update [

	method := method origin
		          localMethodNamed: method selector
		          ifAbsent: [ ^ self ].
	blElement := self getStonFromMethod materializeAsBlElement.
	blElement isCollection ifTrue: [
		blElement := BlElement new
			             addChildren: blElement;
			             size: 1500 @ 1500;
			             yourself ].

	super update.

	imageMorph form: blElement exportAsForm
]
