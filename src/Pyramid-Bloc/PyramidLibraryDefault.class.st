Class {
	#name : #PyramidLibraryDefault,
	#superclass : #Object,
	#category : #'Pyramid-Bloc-plugin-navigation'
}

{ #category : #accessing }
PyramidLibraryDefault >> defaultCategory [

	<pyramidLibraryCategory: 0>
	^ {PyramidLibraryCategory new
		  icon: (Smalltalk ui icons iconNamed: #box);
		  name: 'Default';
		  elements: {
				  (PyramidLibraryElement new
					   name: 'Simple element';
					   icon: (Smalltalk ui icons iconNamed: #blank);
					   block: [ BlElement new background: Color random ];
					   yourself).
				  (PyramidLibraryElement new
					   name: 'Text element';
					   icon: (Smalltalk ui icons iconNamed: #smallFonts);
					   block: [ 'Change me' asRopedText asElement ];
					   yourself) };
		  yourself}
]

{ #category : #accessing }
PyramidLibraryDefault >> pystashCategory [

	<pyramidLibraryCategory: 1>
	| pragmas methods packages categories |
	pragmas := Pragma allNamed: #pyStash.
	methods := (pragmas collect: #method) asSet.
	packages := (methods collect: #package) asSet.

	categories := OrderedCollection new.

	^ packages collect: [ :package |
		  | elements |
		  elements := methods
			              select: [ :method | method package = package ]
			              thenCollect: [ :method |
				              PyramidLibraryElement new
					              icon: (Smalltalk ui icons iconNamed:
								               method methodClass soleInstance systemIconName);
					              name: method selector;
					              block: [
						              (method methodClass soleInstance perform:
								               method selector) materializeAsBlElement ];
					              yourself ].
		  PyramidLibraryCategory new
			  name: package name;
			  icon: (Smalltalk ui icons iconNamed: #smallSave);
			  elements: elements asArray;
			  yourself ]
]

{ #category : #accessing }
PyramidLibraryDefault >> pystonCategory [

	<pyramidLibraryCategory: 1>
	| pragmas methods packages categories |
	pragmas := Pragma allNamed: #pySTON.
	methods := (pragmas collect: #method) asSet.
	packages := (methods collect: #package) asSet.

	categories := OrderedCollection new.

	^ packages collect: [ :package |
		  | elements |
		  elements := methods
			              select: [ :method | method package = package ]
			              thenCollect: [ :method |
				              PyramidLibraryElement new
					              icon: (Smalltalk ui icons iconNamed:
								               method methodClass soleInstance systemIconName);
					              name: method selector;
					              block: [
						              (method methodClass soleInstance perform:
								               method selector) materializeAsBlElement ];
					              yourself ].
		  PyramidLibraryCategory new
			  name: package name;
			  icon: (Smalltalk ui icons iconNamed: #smallSave);
			  elements: elements;
			  yourself ]
]
