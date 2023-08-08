Class {
	#name : #PyramidTreeColumn,
	#superclass : #Object,
	#category : #'Pyramid-Incubator-plugin-hierarchy-selection-helper'
}

{ #category : #'as yet unclassified' }
PyramidTreeColumn class >> nameAndType [

	^ (SpCompositeTableColumn new
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
		   yourself)
]
