Class {
	#name : #PyramidHistoryDeprecated,
	#superclass : #Object,
	#traits : 'TPyramidHistory',
	#classTraits : 'TPyramidHistory classTrait',
	#instVars : [
		'afterMementoSaver',
		'beforeMementoSaver',
		'undoCounter',
		'mementos',
		'undoPipeline',
		'mainPipeline'
	],
	#category : #'NeoPyramid-plugin-history'
}

{ #category : #'accessing - method dictionary' }
PyramidHistoryDeprecated class >> addAndClassifySelector: selector withMethod: compiledMethod inProtocol: aProtocol [
	"When a new methods is added, I add it to the localMethodDict and also propagate the changes to my users"

	self localMethodDict at: selector put: compiledMethod.

	super addAndClassifySelector: selector withMethod: compiledMethod inProtocol: aProtocol.

	TraitChange addSelector: selector on: self
]

{ #category : #'accessing - method dictionary' }
PyramidHistoryDeprecated class >> addSelector: selector withMethod: compiledMethod [
	"When a new selector is installed in a class I insert the selector in the local methodDict and propagate the changes to my users"

	self localMethodDict at: selector put: compiledMethod.
	super addSelector: selector withMethod: compiledMethod.
	TraitChange addSelector: selector on: self
]

{ #category : #'accessing - method dictionary' }
PyramidHistoryDeprecated class >> addSelector: selector withRecompiledMethod: compiledMethod [
	"When a new selector is installed in a class I insert the selector in the local methodDict and propagate the changes to my users"

	compiledMethod isFromTrait
		ifTrue: [ ^ super addSelector: selector withRecompiledMethod: compiledMethod ].

	self localMethodDict at: selector put: compiledMethod.
	super addSelector: selector withRecompiledMethod: compiledMethod.
	TraitChange addSelector: selector on: self
]

{ #category : #querying }
PyramidHistoryDeprecated class >> allTraits [
	^ self traitComposition allTraits
]

{ #category : #initialization }
PyramidHistoryDeprecated class >> doRebuildMethodDictionary [
	| selectors removedSelectors removeFromOrganization modified|

	"During the creation of the class or after a change in the traitComposition, the whole method dictionary is calculated.
	If I return true, my users should be updated"

	"1. I recreate the local methodDict"
	modified := false.
	self methodDict valuesDo: [ :m | m traitSource ifNil: [ self localMethodDict at: m selector put: m ]].

	"2. I filter the selectors from the trait composition, rejecting the ones that are locally defined.
	And then I install the methods in myself. The trait composition only install the method if it is needed."
	selectors := self traitComposition selectors reject: [ :e | (self localMethodDict includesKey: e) ].
	selectors do: [ :e | modified := modified | (self traitComposition installSelector: e into: self replacing: false)].

	"3. I handle the methods that I have and they are no more in the traitComposition."
	removedSelectors := self methodDict keys reject: [ :aSelector | (selectors includes: aSelector) or: [ self localMethodDict includesKey: aSelector] ].
	modified := modified | (removedSelectors isNotEmpty).
	removedSelectors do: [ :aSelector | self methodDict removeKey: aSelector ].

	"4. Finally, I remove these methods from my class organization"
	removeFromOrganization := self organization allMethodSelectors reject: [:e | self methodDict includesKey: e ].
	removeFromOrganization do: [ :aSelector | self organization removeElement: aSelector ].

	^ modified
]

{ #category : #testing }
PyramidHistoryDeprecated class >> findOriginClassOf: aMethod [

	"I return the myself or the trait that has the original implementation of a method.
	If the method is an alias, the returned class includes the original aliased method"

	(aMethod hasProperty: #traitSource)
		ifTrue: [ ^ aMethod traitSource innerClass ].

	(self includesLocalSelector: aMethod selector)
		ifTrue: [ ^ self ].

	^ (self traitComposition traitDefining: aMethod selector ifNone: [ ^ self ]) innerClass
]

{ #category : #testing }
PyramidHistoryDeprecated class >> findOriginMethodOf: aMethod [

	"I return the original method for a aMethod.
	If this is a local method, the original method is itself.
	If it cames from a trait composition I look for the method in the trait composition.
	First I try with the trait stored in the traitSource.
	If it is an aliased or conflicting method, the method is look up in the whole trait composition"

	(self includesLocalSelector: aMethod selector)
		ifTrue: [ ^ aMethod ].

	(aMethod hasProperty: #traitSource)
		ifTrue: [ |newSelector|
			newSelector := self traitComposition originSelectorOf: aMethod selector.
			^ aMethod traitSource compiledMethodAt: newSelector ifAbsent: [aMethod] ].

	^ (self traitComposition traitDefining: aMethod selector ifNone: [ self ])
		compiledMethodAt: aMethod selector ifAbsent: [ ^ aMethod ]
]

{ #category : #testing }
PyramidHistoryDeprecated class >> hasTraitComposition [

	^ self traitComposition isEmpty not
]

{ #category : #testing }
PyramidHistoryDeprecated class >> includesLocalSelector: aSymbol [
	^ self isLocalSelector: aSymbol
]

{ #category : #testing }
PyramidHistoryDeprecated class >> isAliasSelector: aSymbol [
	"Return true if the selector aSymbol is an alias defined
	in my or in another composition somewhere deeper in
	the tree of traits compositions."

	^ self traitComposition isAliasSelector: aSymbol
]

{ #category : #testing }
PyramidHistoryDeprecated class >> isLocalAliasSelector: aSymbol [
	"Return true if the selector aSymbol is an alias defined
	in my trait composition."

	^ self traitComposition isLocalAliasSelector: aSymbol
]

{ #category : #testing }
PyramidHistoryDeprecated class >> isLocalMethodsProtocol: aProtocol [
	"Checks if the protocol has local selectors"

	aProtocol methodSelectors ifEmpty: [ ^ true ].
	^ aProtocol methodSelectors anySatisfy: [ :each | self isLocalSelector: each ]
]

{ #category : #testing }
PyramidHistoryDeprecated class >> isLocalSelector: aSelector [

	^ self localMethodDict includesKey: aSelector
]

{ #category : #accessing }
PyramidHistoryDeprecated class >> localMethodDict [
	"The local methodDict is in the metaclass. In this way I do not have to recompile the methods during the bootstrap when we don't have a compiler."
	^ self class baseLocalMethods
]

{ #category : #accessing }
PyramidHistoryDeprecated class >> localMethodDict: aMethodDictionary [
	^ self class baseLocalMethods: aMethodDictionary
]

{ #category : #accessing }
PyramidHistoryDeprecated class >> localMethods [
	"returns the methods of classes excluding the ones of the traits that the class uses"

	^ self localMethodDict values
]

{ #category : #'accessing - method dictionary' }
PyramidHistoryDeprecated class >> localSelectors [

	^ self localMethodDict keys
]

{ #category : #initialization }
PyramidHistoryDeprecated class >> rebuildMethodDictionary [

	"Useful to be rewritten in Traits"
	^ self doRebuildMethodDictionary
]

{ #category : #categories }
PyramidHistoryDeprecated class >> recategorizeSelector: selector from: oldProtocolName to: newProtocolName [

	| original |
	"When a method is recategorized I have to classify the method, but also recategorize the aliases pointing to it"
	original := self organization protocolNameOfElement: selector ifAbsent: [ ^ self ].

	"If it is nil is because it is a removal. It will removed when the method is removed."
	newProtocolName ifNil: [ ^ self ].

	original = oldProtocolName ifTrue: [ self organization classify: selector under: newProtocolName ].

	(self traitComposition reverseAlias: selector) do: [ :e |
		self recategorizeSelector: e from: oldProtocolName to: newProtocolName.
		self notifyOfRecategorizedSelector: e from: oldProtocolName to: newProtocolName ].

	self organization removeEmptyProtocols
]

{ #category : #recompilation }
PyramidHistoryDeprecated class >> recompile: selector from: oldClass [
	"Compile the method associated with selector in the receiver's method dictionary."

	| method newMethod |
	method := oldClass compiledMethodAt: selector.
	newMethod := self recompileBasic: selector from: oldClass.

	method properties
		at: #traitSource
		ifPresent: [ :aSource | newMethod propertyAt: #traitSource put: aSource].

	self addSelector: selector withRecompiledMethod: newMethod
]

{ #category : #'trait-composition' }
PyramidHistoryDeprecated class >> removeFromComposition: aTrait [

	self setTraitComposition: (self traitComposition copyWithoutTrait: aTrait asTraitComposition)
]

{ #category : #removing }
PyramidHistoryDeprecated class >> removeFromSystem: logged [

	"When a traited class is removed the traits it is using should be updated"
	| mySubclasses |
	self traitComposition removeUser: self.
	self class traitComposition removeUser: self class.

	TraitedClass removeUser: self class.

	mySubclasses := self subclasses.

	super removeFromSystem: logged.

	"As I am a traited class my subclasses does not have the basic traited class
	methods, so I add them."
	mySubclasses do: [ :each | each class initializeBasicMethods ]
]

{ #category : #removing }
PyramidHistoryDeprecated class >> removeSelector: aSelector [

	"When a selector is removed it should be notified to my users.
	Check the class TraitChange for more details"
	super removeSelector: aSelector.
	self localMethodDict removeKey: aSelector ifAbsent: [  ].

	TraitChange removeSelector: aSelector on: self
]

{ #category : #accessing }
PyramidHistoryDeprecated class >> traitComposition [
	"My trait composition is in my class. So I do not need to recompile the methods when installing them during bootstrap"
	^ self class baseComposition
]

{ #category : #accessing }
PyramidHistoryDeprecated class >> traitComposition: aComposition [

	aComposition asTraitComposition allTraits do: [ :aMaybeTrait |
		aMaybeTrait isTrait ifFalse: [
			self error: 'All the members of the trait composition should be traits' ]].

	self class baseComposition: aComposition
]

{ #category : #accessing }
PyramidHistoryDeprecated class >> traitCompositionString [
	^ self traitComposition asString
]

{ #category : #accessing }
PyramidHistoryDeprecated class >> traitUsers [
	"I am a traited class, I have no users, this is for compatibility with traits"
	^ #()
]

{ #category : #accessing }
PyramidHistoryDeprecated class >> traits [
	^ self traitComposition traits
]

{ #category : #adding }
PyramidHistoryDeprecated >> addObserver: anObserver [

	self observers add: anObserver
]

{ #category : #accessing }
PyramidHistoryDeprecated >> afterMementoSaver [

	^ afterMementoSaver
]

{ #category : #accessing }
PyramidHistoryDeprecated >> beforeMementoSaver [

	^ beforeMementoSaver.
]

{ #category : #testing }
PyramidHistoryDeprecated >> canRedo [

	^ self redoCollection isNotEmpty 
]

{ #category : #testing }
PyramidHistoryDeprecated >> canUndo [

	^ self undoCollection isNotEmpty
]

{ #category : #notifying }
PyramidHistoryDeprecated >> informCounterReset [

	self observers do: [ :observer | observer pyramidHistoryCounterReset ]
]

{ #category : #notifying }
PyramidHistoryDeprecated >> informRedo [

	self observers do: [ :observer |
		observer pyramidHistoryRedo ]
]

{ #category : #notifying }
PyramidHistoryDeprecated >> informUndo [

	self observers do: [ :observer | observer pyramidHistoryUndo ]
]

{ #category : #initialization }
PyramidHistoryDeprecated >> initialize [

	undoCounter := 0.
	mementos := OrderedCollection new.
	undoPipeline := PyramidPipeline new.
	beforeMementoSaver := PyramidMementoSaverForOriginAndReset new
		                      history: self;
		                      pipeline: self undoPipeline;
		                      yourself.
	afterMementoSaver := PyramidMementoSaver new
		                     collection: self mementos;
		                     pipeline: self undoPipeline;
		                     yourself
]

{ #category : #'as yet unclassified' }
PyramidHistoryDeprecated >> installHistoryOn: aPipeline [

	aPipeline workersBeforeExecute add: self beforeMementoSaver.
	aPipeline workersAfterExecute add: self afterMementoSaver.
	mainPipeline := aPipeline
]

{ #category : #accessing }
PyramidHistoryDeprecated >> mainPipeline [

	^ mainPipeline
]

{ #category : #accessing }
PyramidHistoryDeprecated >> mementos [

	^ mementos
]

{ #category : #adding }
PyramidHistoryDeprecated >> observers [ 

	observers ifNil: [ observers := Set new ].
	^ observers
]

{ #category : #'menu messages' }
PyramidHistoryDeprecated >> redo [

	self canRedo ifFalse: [ ^ self ].
	self redoCollection last restore.
	self undoCounterDecrement.
	self mainPipeline informPipelineExecuteCommand.
	self informRedo
]

{ #category : #accessing }
PyramidHistoryDeprecated >> redoCollection [

	^ self mementos first: self undoCounter
]

{ #category : #adding }
PyramidHistoryDeprecated >> removeObserver: anObserver [

	self observers remove: anObserver ifAbsent: [  ]
]

{ #category : #initialization }
PyramidHistoryDeprecated >> resetUndoCounter [

	undoCounter := 0.
	self mementos removeAll: self redoCollection.
	self informCounterReset
]

{ #category : #'menu messages' }
PyramidHistoryDeprecated >> undo [

	self canUndo ifFalse: [ ^ self ].
	self undoCollection first restore.
	self undoCounterIncrement.
	self mainPipeline informPipelineExecuteCommand.
	self informUndo
]

{ #category : #accessing }
PyramidHistoryDeprecated >> undoCollection [

	^ self mementos allButFirst: (self undoCounter + 1)
]

{ #category : #testing }
PyramidHistoryDeprecated >> undoCounter [

	^ undoCounter
]

{ #category : #testing }
PyramidHistoryDeprecated >> undoCounterDecrement [

	undoCounter := undoCounter - 1
]

{ #category : #testing }
PyramidHistoryDeprecated >> undoCounterIncrement [

	undoCounter := undoCounter + 1
]

{ #category : #accessing }
PyramidHistoryDeprecated >> undoPipeline [
^undoPipeline
]
