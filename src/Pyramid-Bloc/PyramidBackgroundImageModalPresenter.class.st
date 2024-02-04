Class {
	#name : #PyramidBackgroundImageModalPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'radioProxy',
		'radioBitmap',
		'codeBitmap',
		'inputReceiverProxy',
		'inputSelectorProxy',
		'inputArgumentsProxy',
		'buttonInspect',
		'buttonExampleDefault',
		'buttonExampleFileSystem',
		'buttonExampleBloc'
	],
	#category : #'Pyramid-Bloc-plugin-bloc-background'
}

{ #category : #'as yet unclassified' }
PyramidBackgroundImageModalPresenter class >> ensurePharoBigFileExists [

	'./pharoBig.png' asFileReference exists ifTrue: [ ^ self ].
	PNGReadWriter putForm: (Object iconNamed: #pharoBig) onFileNamed: './pharoBig.png'
	
]

{ #category : #layout }
PyramidBackgroundImageModalPresenter >> baseLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpLabelPresenter new
				   label: 'Type';
				   displayBold: [ :t | true ];
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: self radioProxy;
				   add: self radioBitmap;
				   yourself)
		  expand: false;
		  add:
		  'The proxy allow you to call methods during the materialization of the object.'
		  expand: false;
		add:
		  'Use the bitmap to have a direct access to the image object.'
		  expand: false;
		add:
		  'Be carefull it will increase the size of the serialized strings.'
		  expand: false;
		add:
		  'Use a proxy to reduce the size of the serialized image.'
		  expand: false;
		  yourself
]

{ #category : #layout }
PyramidBackgroundImageModalPresenter >> bitmapLayout [

	^ self baseLayout
		  add: (SpLabelPresenter new
				   label: 'Code';
				   displayBold: [ :t | true ];
				   yourself)
		  expand: false;
		  add: self codeBitmap;
		  add: self buttonInpectLayout expand: false;
		  yourself
]

{ #category : #'special objects' }
PyramidBackgroundImageModalPresenter >> bitmapObject [

	^ self codeBitmap
		  evaluate: self codeBitmap text
		  onCompileError: [ :err | ^ self ]
		  onError: [ :err | err pass ]
]

{ #category : #initialization }
PyramidBackgroundImageModalPresenter >> buttonExampleBloc [

	^ buttonExampleBloc
]

{ #category : #initialization }
PyramidBackgroundImageModalPresenter >> buttonExampleDefault [
	^ buttonExampleDefault
]

{ #category : #initialization }
PyramidBackgroundImageModalPresenter >> buttonExampleFileSystem [

	^ buttonExampleFileSystem
]

{ #category : #layout }
PyramidBackgroundImageModalPresenter >> buttonInpectLayout [

	^ SpBoxLayout newHorizontal
		  add: self buttonExampleDefault expand: false;
		 add: self buttonExampleFileSystem expand: false;
		add: self buttonExampleBloc expand: false;
		  add: SpNullPresenter new expand: true;
		  add: self buttonInspect expand: false;
		  yourself
]

{ #category : #accessing }
PyramidBackgroundImageModalPresenter >> buttonInspect [

	^ buttonInspect
]

{ #category : #accessing }
PyramidBackgroundImageModalPresenter >> codeBitmap [

	^ codeBitmap
]

{ #category : #layout }
PyramidBackgroundImageModalPresenter >> defaultLayout [ 

	self isProxySelected ifTrue: [ ^ self proxyLayout ].
	^ self bitmapLayout
]

{ #category : #action }
PyramidBackgroundImageModalPresenter >> image: aForm [

	self codeBitmap beForObject: aForm.
	self codeBitmap text: self textBitmap , 'self 
'
]

{ #category : #initialization }
PyramidBackgroundImageModalPresenter >> initializePresenters [

	radioProxy := SpRadioButtonPresenter new
		              label: 'Proxy';
		              help:
			              'Create a proxy for an image. Take less place for the serialization.';
		              yourself.
	radioBitmap := SpRadioButtonPresenter new
		               label: 'Bitmap';
		               help:
			               'Create an image. Take more place for the serialization.';
		               yourself.
	radioProxy associatedRadioButtons: { radioBitmap }.
	radioProxy whenChangedDo: [ :state | self updatePresenter ].
	buttonInspect := SpButtonPresenter new
		                 help: 'Verify the image.';
		                 label: 'Inspect';
		                 icon: (self iconNamed: #smallInspectIt);
		                 action: [ self inspectCurrent ];
		                 yourself.
	codeBitmap := SpCodePresenter new
		              beForScripting;
		              text: self textBitmapDefault;
		              yourself.
	inputReceiverProxy := SpCodePresenter new
		                      beForScripting;
		                      text: self textReceiverDefault;
		                      yourself.
	inputSelectorProxy := SpCodePresenter new
		                      beForScripting;
		                      text: self textSelectorDefault;
		                      yourself.
	inputArgumentsProxy := SpCodePresenter new
		                       beForScripting;
		                       text: self textArgumentsDefault;
		                       yourself.
	buttonExampleDefault := SpButtonPresenter new
		                        label: 'Example image';
		                        action: [ self setTextToDefault ];
		                        yourself.
	buttonExampleFileSystem := SpButtonPresenter new
		                        label: 'Example file';
		                        action: [ self setTextToFile ];
		                        yourself.
	buttonExampleBloc := SpButtonPresenter new
		                        label: 'Example bloc';
		                        action: [ self setTextToBloc ];
		                        yourself
]

{ #category : #accessing }
PyramidBackgroundImageModalPresenter >> inputArgumentsProxy [

	^ inputArgumentsProxy
]

{ #category : #accessing }
PyramidBackgroundImageModalPresenter >> inputReceiverProxy [

	^ inputReceiverProxy
]

{ #category : #accessing }
PyramidBackgroundImageModalPresenter >> inputSelectorProxy [

	^ inputSelectorProxy
]

{ #category : #action }
PyramidBackgroundImageModalPresenter >> inspectCurrent [

	(self isProxySelected
		ifTrue: [ self proxyObject ]
		ifFalse: [ self bitmapObject ]) inspect
]

{ #category : #layout }
PyramidBackgroundImageModalPresenter >> isProxySelected [

	^ self radioProxy state
]

{ #category : #layout }
PyramidBackgroundImageModalPresenter >> proxyLayout [

	^ self baseLayout
		  add: (SpLabelPresenter new
				   label: 'Receiver';
				   displayBold: [ :t | true ];
				   yourself)
		  expand: false;
		  add: self inputReceiverProxy;
		  add: (SpLabelPresenter new
				   label: 'Selector';
				   displayBold: [ :t | true ];
				   yourself)
		  expand: false;
		  add: self inputSelectorProxy;
		  add: (SpLabelPresenter new
				   label: 'Arguments';
				   displayBold: [ :t | true ];
				   yourself)
		  expand: false;
		  add: self inputArgumentsProxy;
		  add: self buttonInpectLayout  expand: false;
		  yourself
]

{ #category : #'special objects' }
PyramidBackgroundImageModalPresenter >> proxyObject [

	| receiver selector arguments proxySource proxy |
	receiver := self inputReceiverProxy
		            evaluate: self inputReceiverProxy text
		            onCompileError: [ :err | ^ self ]
		            onError: [ :err | err pass ].


	selector := self inputSelectorProxy
		            evaluate: self inputSelectorProxy text
		            onCompileError: [ :err | ^ self ]
		            onError: [ :err | err pass ].

	arguments := self inputArgumentsProxy
		             evaluate: self inputArgumentsProxy text
		             onCompileError: [ :err | ^ self ]
		             onError: [ :err | err pass ].

	proxySource := PyramidExternalRessourceSource
		               target: receiver
		               selector: selector
		               arguments: arguments.
	^ PyramidExternalRessourceProxy fromSource: proxySource
]

{ #category : #accessing }
PyramidBackgroundImageModalPresenter >> radioBitmap [

	^ radioBitmap
]

{ #category : #accessing }
PyramidBackgroundImageModalPresenter >> radioProxy [

	^ radioProxy
]

{ #category : #initialization }
PyramidBackgroundImageModalPresenter >> setTextToBloc [

	self codeBitmap text: self textBitmapBloc.
	self inputReceiverProxy text: self textReceiverBloc.
	self inputSelectorProxy text: self textSelectorBloc.
	self inputArgumentsProxy text: self textArgumentsBloc
]

{ #category : #initialization }
PyramidBackgroundImageModalPresenter >> setTextToDefault [

	self codeBitmap text: self textBitmapDefault.
	self inputReceiverProxy text: self textReceiverDefault.
	self inputSelectorProxy text: self textSelectorDefault.
	self inputArgumentsProxy text: self textArgumentsDefault.
]

{ #category : #initialization }
PyramidBackgroundImageModalPresenter >> setTextToFile [

	self codeBitmap text: self textBitmapFile.
	self inputReceiverProxy text: self textReceiverFile.
	self inputSelectorProxy text: self textSelectorFile.
	self inputArgumentsProxy text: self textArgumentsFile
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textArguments [

	^ '"Use it like a Playground. Last object must be a Collection that will be used as arguments."
'
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textArgumentsBloc [

	^ self textArguments , '{  }
'
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textArgumentsDefault [

	^ self textArguments, '#(#pharoBig)
'
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textArgumentsFile [

	^ self textArguments , '{ ''./pharoBig.png'' }
'
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textBitmap [

	^ '"Use it like a Playground. Last object must be a Form."
'
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textBitmapBloc [

	^ self textBitmap , 'BlElement new background: Color red; size: 25 @ 50; asForm
'
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textBitmapDefault [

	^ self textBitmap, 'Object iconNamed: #pharoBig
'
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textBitmapFile [

	^ self textBitmap
	  , 'PyramidBackgroundImageModalPresenter ensurePharoBigFileExists.
Form fromFileNamed: ''./pharoBig.png'' asFileReference.
'
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textReceiver [

	^ '"Use it like a Playground. Last object will be the serialized receiver."
'
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textReceiverBloc [

	^ self textReceiver , 'BlElement new
	background: Color red;
	size: 25 @ 50;
	yourself.
'
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textReceiverDefault [

	^ self textReceiver , 'Object 
'
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textReceiverFile [

	^ self textReceiver , 'PyramidBackgroundImageModalPresenter ensurePharoBigFileExists.
Form 
'
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textSelector [

	^ '"Use it like a Playground. Last object must be a Symbol that will be performed on the receiver."
'
]

{ #category : #'as yet unclassified' }
PyramidBackgroundImageModalPresenter >> textSelectorBloc [
	^ self textSelector, '#asForm'
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textSelectorDefault [

	^ self textSelector, '#iconNamed:
'
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textSelectorFile [

	^ self textSelector , '#fromFileNamed:
'
]

{ #category : #text }
PyramidBackgroundImageModalPresenter >> textSelectorbloc [

	^ self textSelector , '#asForm
'
]

{ #category : #update }
PyramidBackgroundImageModalPresenter >> updatePresenter [

	self layout: self defaultLayout
]
