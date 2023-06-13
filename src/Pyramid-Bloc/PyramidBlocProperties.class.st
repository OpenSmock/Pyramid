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
PyramidBlocProperties class >> contraintsHorizontal [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand constraints
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory constraintsInputHorizontal
]

{ #category : #accessing }
PyramidBlocProperties class >> contraintsVertical [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand constraints
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory constraintsInputVertical
]

{ #category : #accessing }
PyramidBlocProperties class >> fontSize [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand textAttribute
		  inputBuilder: PyramidPropertyInputModelBuilderFactory fontSize
]

{ #category : #accessing }
PyramidBlocProperties class >> fontWeight [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand textAttribute
		  inputBuilder: PyramidPropertyInputModelBuilderFactory fontWeight
]

{ #category : #accessing }
PyramidBlocProperties class >> geometry [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand geometry
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory geometryInput
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
	aPyramidEditor properties addProperty: self class geometry.
	aPyramidEditor properties addProperty: self class position.
	aPyramidEditor properties addProperty: self class fontSize.
	aPyramidEditor properties addProperty: self class fontWeight.
	aPyramidEditor properties addProperty: self class text.
	aPyramidEditor properties addProperty: self class contraintsVertical.
	aPyramidEditor properties addProperty:
		self class contraintsHorizontal
]

{ #category : #'see class side' }
PyramidBlocProperties >> seeClassSide [
]
