Class {
	#name : #PyramidFakeExtension,
	#superclass : #Object,
	#instVars : [
		'isInstalled',
		'editor',
		'projectModel'
	],
	#category : 'Pyramid-Tests-cases-plugin-space'
}

{ #category : #accessing }
PyramidFakeExtension >> editor [

	^ editor
]

{ #category : #accessing }
PyramidFakeExtension >> editor: anObject [

	editor := true.
]

{ #category : #accessing }
PyramidFakeExtension >> initialize [

	isInstalled := false.
	projectModel := false.
	editor := false.
]

{ #category : #displaying }
PyramidFakeExtension >> installOn: anObject [

	isInstalled := true
]

{ #category : #accessing }
PyramidFakeExtension >> isInstalled [

	^ isInstalled
]

{ #category : #accessing }
PyramidFakeExtension >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidFakeExtension >> projectModel: anObject [

	projectModel := true
]
