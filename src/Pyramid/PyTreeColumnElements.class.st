Class {
	#name : #PyTreeColumnElements,
	#superclass : #Object,
	#traits : 'TPyTreeColumn',
	#classTraits : 'TPyTreeColumn classTrait',
	#instVars : [
		'column'
	],
	#category : #'Pyramid-Editor-Tree'
}

{ #category : #initialization }
PyTreeColumnElements >> initialize [

	column := SpCompositeTableColumn new
				 title: 'Elements';
				 addColumn: (SpImageTableColumn evaluated: [ :aClass |
							  self iconNamed: aClass systemIconName ]);
				 addColumn: (SpStringTableColumn new
						  title: 'Class';
						  evaluated: [ :aClass | aClass class name ];
						  yourself);
				 addColumn: (SpStringTableColumn new
						  title: 'Identity';
						  evaluated: [ :aClass | aClass identityHash printString ];
						  displayColor: [ :aClass | Color gray ];
						  yourself);
				 addColumn: (SpStringTableColumn new
						  title: 'Identifier';
						  evaluated: [ :aClass |
							  aClass id isNoId
								  ifTrue: [ '' ]
								  ifFalse: [ aClass id asSymbol ] ];
						  displayColor: [ :aClass |
							  aClass id isNoId
								  ifTrue: [ Color green ]
								  ifFalse: [ Smalltalk ui theme textColor ] ];
						  yourself);
				 yourself
]

{ #category : #accessing }
PyTreeColumnElements >> order [

	^ 1
]
