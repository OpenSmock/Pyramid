Class {
	#name : #PyramidVisualPystonForCly,
	#superclass : #ClyBrowserToolMorph,
	#instVars : [
		'blElement',
		'method',
		'imageMorph'
	],
	#category : #'Pyramid-plugin-save'
}

{ #category : #activation }
PyramidVisualPystonForCly class >> browserTabActivation [
	"This declaration specifies that in any browser when methods are selected, a diff tool will be available in a tab."

	<classAnnotation>
	^ClyTabActivationStrategyAnnotation for: ClyMethod asCalypsoItemContext
]

{ #category : #accessing }
PyramidVisualPystonForCly class >> shouldBeActivatedInContext: aBrowserContext [

	^ aBrowserContext selectedMethods anySatisfy: [ :method | 
		  method pragmas anySatisfy: [ :pragma | pragma selector = #pySTON ] ]
]

{ #category : #accessing }
PyramidVisualPystonForCly class >> tabOrder [

	^ 1
]

{ #category : #accessing }
PyramidVisualPystonForCly >> activationPriority [

	^ self tabOrder
]

{ #category : #controlling }
PyramidVisualPystonForCly >> attachToSystem [

	browser system
		when: (ClyMethodChange ofAll: { 
					 self method })
		send: #triggerUpdate
		to: self
]

{ #category : #testing }
PyramidVisualPystonForCly >> belongsToCurrentBrowserContext [

	^ browser isMethodSelected: self method
]

{ #category : #testing }
PyramidVisualPystonForCly >> belongsToRemovedBrowserContext [

	^ self method isInstalled
]

{ #category : #building }
PyramidVisualPystonForCly >> build [

	| buttonEditor buttonOpen |
	buttonEditor := self buttonEditor.
	buttonOpen := self buttonOpen.
	imageMorph := ImageMorph withForm: blElement exportAsForm.
	self addMorph: imageMorph fullFrame: LayoutFrame identity.
	self addMorph: buttonEditor.
	self addMorph: buttonOpen
]

{ #category : #'as yet unclassified' }
PyramidVisualPystonForCly >> buttonEditor [

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
PyramidVisualPystonForCly >> buttonOpen [

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
PyramidVisualPystonForCly >> defaultIconName [

	^ #smallPaint
]

{ #category : #initialization }
PyramidVisualPystonForCly >> defaultTitle [

	^ 'Bloc preview'
]

{ #category : #controlling }
PyramidVisualPystonForCly >> detachFromSystem [

	browser system unsubscribe: self
]

{ #category : #'as yet unclassified' }
PyramidVisualPystonForCly >> getClassName [

	^ (Character space split: method classBinding value name) first
]

{ #category : #'as yet unclassified' }
PyramidVisualPystonForCly >> getMethodName [

	^ method selector
]

{ #category : #'as yet unclassified' }
PyramidVisualPystonForCly >> getStonFromMethod [

	^(method literals select: [ :e | e isString ]) first.
]

{ #category : #testing }
PyramidVisualPystonForCly >> isSimilarTo: anotherBrowserTool [

	(super isSimilarTo: anotherBrowserTool) ifFalse: [ ^ false ].

	^ self method = anotherBrowserTool method
]

{ #category : #accessing }
PyramidVisualPystonForCly >> method [

	^ method
]

{ #category : #accessing }
PyramidVisualPystonForCly >> openEditor [

	| class openStrategy |
	"openStrategy := PyOpenStrategyObjectSelector new
		                sourceSelector: method selector;
		                yourself.
	class := method classBinding value.
	class isMeta
		ifTrue: [ openStrategy sourceObject: class instanceSide ]
		ifFalse: [ openStrategy sourceObject: class new ].

	PyBusiness new
		openStrategy: openStrategy;
		open"
		self flag: #TODO.
		self halt.
]

{ #category : #accessing }
PyramidVisualPystonForCly >> openInNewSpace [

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
PyramidVisualPystonForCly >> printContext [

	^ self method printSystemPath
]

{ #category : #initialization }
PyramidVisualPystonForCly >> resetStateForSnapshot [

	super resetStateForSnapshot.

	imageMorph := nil
]

{ #category : #initialization }
PyramidVisualPystonForCly >> setUpModelFromContext [

	method := context firstSelectedMethod.
	blElement := self getStonFromMethod materializeAsBlElement.
	blElement isCollection ifTrue: [
		blElement := BlElement new
			             addChildren: blElement;
			             size: 1500 @ 1500;
			             yourself ]
]

{ #category : #updating }
PyramidVisualPystonForCly >> update [

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
