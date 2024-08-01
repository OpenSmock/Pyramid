Class {
	#name : #PyramidLibraryDefault,
	#superclass : #Object,
	#category : #'Pyramid-Bloc-plugin-navigation'
}

{ #category : #accessing }
PyramidLibraryDefault >> defaultCategory [

	<pyramidLibraryCategory: 0>
	^ { (PyramidLibraryCategory new
		   icon: (Smalltalk ui icons iconNamed: #box);
		   name: 'Default';
		   elements: {
				   (PyramidLibraryElement new
					    name: 'Simple element';
					    icon: (Smalltalk ui icons iconNamed: #blank);
					    block: [ {BlElement new background: Color random} ];
					    yourself).
				   (PyramidLibraryElement new
					    name: 'Text element';
					    icon: (Smalltalk ui icons iconNamed: #smallFonts);
					    block: [ {'Change me' asRopedText asElement} ];
					    yourself) };
		   yourself) }
]

{ #category : #accessing }
PyramidLibraryDefault >> pragmaCategory: aSymbol withIcon: anIcon [

	| pragmas methods packages categories |
	pragmas := Pragma allNamed: aSymbol.
	methods := (pragmas collect: #method) asSet.
	packages := (methods collect: #package) asSet.

	categories := OrderedCollection new.

	^ (packages collect: [ :package |
		   | elements |
		   elements := methods
			               select: [ :method | method package = package ]
			               thenCollect: [ :method |
				               PyramidLibraryElement new
					               icon: (Smalltalk ui icons iconNamed:
								                method methodClass soleInstance systemIconName);
					               name: ('<1s> (<2s>)'
							                expandMacrosWith: method selector
							                with: method methodClass name);
					               block: [
						               (method methodClass soleInstance perform:
								                method selector) materializeAsBlElement ];
					               yourself ].
		   PyramidLibraryCategory new
			   name: (package ifNil: [ '(nil)' ] ifNotNil: [ :p | p name ]);
			   icon: anIcon;
			   elements: (elements sorted: [ :a :b | a name < b name ]);
			   yourself ]) sorted: [ :a :b | a name < b name ]
]

{ #category : #accessing }
PyramidLibraryDefault >> pystashCategory [

	<pyramidLibraryCategory: 100>
	^ PyramidLibraryDefault new
		  pragmaCategory: #pyStash
		  withIcon: (Smalltalk ui icons iconNamed: #smallSave)
]

{ #category : #accessing }
PyramidLibraryDefault >> pystonCategory [

	<pyramidLibraryCategory: 101>
	^ PyramidLibraryDefault new
		  pragmaCategory: #pySTON
		  withIcon: (Smalltalk ui icons iconNamed: #smallSave)
]

{ #category : #accessing }
PyramidLibraryDefault >> smalltalkIconsCategory [

	<pyramidLibraryCategory: 10>
	| elements |
	elements := OrderedCollection new.
	elements := Smalltalk ui icons icons associations collect: [ :each |
		            PyramidLibraryElement new
			            icon: each value;
			            name: each key;
			            block: [
				            { (BlElement new
					             size: each value extent;
					             background:
						             (BlImageBackground image:
								              (PyramidExternalRessourceProxy fromSource:
										               (PyramidExternalRessourceSource
											                target: Object
											                selector: #iconNamed:
											                arguments: { each key })));
					             yourself) } ];
			            yourself ].
	^ { (PyramidLibraryCategory new
		   name: 'Smalltalk Icons';
		   icon: (Smalltalk ui icons iconNamed: #image);
		   elements: (elements sorted: [ :a :b | a name < b name ]);
		   yourself) }
]
