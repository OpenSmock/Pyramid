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

{ #category : #converting }
PyramidVisualPystonForCly >> asSaveModel [

	| class model  |
	model := PyramidSaveModel new.
	class := method classBinding value.
	class isMeta ifTrue: [ class := class instanceSide. model onClass] ifFalse: [ model onInstance ] .
	
	^ model
		  savingClassName: class name;
		  savingMethodName: method selector;
		  savingPackageName: class package name;
		  yourself
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
	blElement := self getStonFromMethod materializeAsBlElement.
	blElement isCollection ifTrue: [
		blElement := BlElement new
			             addChildren: blElement;
			             size: 1500 @ 1500;
			             yourself ].
	imageMorph := ImageMorph withForm: blElement exportAsForm.
	self addMorph: imageMorph fullFrame: LayoutFrame identity.
	self addMorph: buttonEditor.
	self addMorph: buttonOpen
]

{ #category : #'as yet unclassified' }
PyramidVisualPystonForCly >> buttonEditor [

	^ self buttonLabel: 'Edit' help: 'Open the design in Pyramid' action: [ self openEditor ].
	
]

{ #category : #'as yet unclassified' }
PyramidVisualPystonForCly >> buttonLabel: aLabel help: aString action: aBlock [

	| button |
	button := SimpleButtonMorph newWithLabel: aLabel.
	button
		actionSelector: #value;
		helpText: aString;
		extent: 200 @ 25;
		useRoundedCorners;
		color: Color white.
	button target: aBlock.

	^ button
]

{ #category : #'as yet unclassified' }
PyramidVisualPystonForCly >> buttonOpen [

	^ self
		  buttonLabel: 'Open in new Space'
		  help: 'Open this design in a new BlSpace'
		  action: [ self openInNewSpace ]

]

{ #category : #initialization }
PyramidVisualPystonForCly >> defaultIconName [

	^ #smallPaint
]

{ #category : #initialization }
PyramidVisualPystonForCly >> defaultTitle [

	^ 'Pyramid preview'
]

{ #category : #controlling }
PyramidVisualPystonForCly >> detachFromSystem [

	browser system unsubscribe: self
]

{ #category : #'as yet unclassified' }
PyramidVisualPystonForCly >> getStonFromMethod [

	^ (method valueWithReceiver: self arguments: {  })

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

	| class elements |
	class := method classBinding value.
	elements := class isMeta
		            ifTrue: [
			            (method classBinding value instanceSide perform:
				             method selector) materializeAsBlElement ]
		            ifFalse: [
			            (method classBinding value new perform: method selector)
				            materializeAsBlElement ].

	elements isCollection ifFalse: [ elements := { elements } ].
	PyramidSavePlugin openOn: elements saveModel: self asSaveModel
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
	space := elements first openInNewSpace.
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

	method := context firstSelectedMethod
]

{ #category : #updating }
PyramidVisualPystonForCly >> update [

	super update.
	method := method origin
		          localMethodNamed: method selector
		          ifAbsent: [ ^ self ].
	blElement := self getStonFromMethod materializeAsBlElement.
	blElement isCollection ifTrue: [
		blElement := BlElement new
			             addChildren: blElement;
			             size: 1500 @ 1500;
			             yourself ].

	imageMorph form: blElement exportAsForm
]
