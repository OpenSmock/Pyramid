Class {
	#name : #PyramidBlocProperties,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#category : #'Pyramid-Bloc-plugin-bloc-properties'
}

{ #category : #accessing }
PyramidBlocProperties class >> background [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand background
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory backgroundInput
]

{ #category : #accessing }
PyramidBlocProperties class >> identifier [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand identifier
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory identifierTextInput
]

{ #category : #'class initialization' }
PyramidBlocProperties class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #accessing }
PyramidBlocProperties class >> position [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand position
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory positionInput
]

{ #category : #accessing }
PyramidBlocProperties class >> text [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand text
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory textInput
]

{ #category : #accessing }
PyramidBlocProperties class >> visibility [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand visibility
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory visibilityDropList
]

{ #category : #'as yet unclassified' }
PyramidBlocProperties >> connectOn: aPyramidEditor [

	aPyramidEditor properties addProperty: self class identifier.
	aPyramidEditor properties addProperty: self class visibility.
	aPyramidEditor properties addProperty: self class background.
	aPyramidEditor properties addProperty: self class position.
	aPyramidEditor properties addProperty: self class text
]

{ #category : #'see class side' }
PyramidBlocProperties >> seeClassSide [
]
