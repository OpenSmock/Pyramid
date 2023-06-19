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
		 order: 20
]

{ #category : #accessing }
PyramidBlocProperties class >> contraintsHorizontal [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand constraints
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory constraintsInputHorizontal
		 order: 61
]

{ #category : #accessing }
PyramidBlocProperties class >> contraintsVertical [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand constraints
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory constraintsInputVertical
		 order: 62
]

{ #category : #accessing }
PyramidBlocProperties class >> fontSize [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand textAttribute
		  inputBuilder: PyramidPropertyInputModelBuilderFactory fontSize
		 order: 11
]

{ #category : #accessing }
PyramidBlocProperties class >> fontWeight [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand textAttribute
		  inputBuilder: PyramidPropertyInputModelBuilderFactory fontWeight
		 order: 12
]

{ #category : #accessing }
PyramidBlocProperties class >> geometry [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand geometry
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory geometryInput
		 order: 30
]

{ #category : #accessing }
PyramidBlocProperties class >> identifier [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand identifier
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory identifierTextInput
		 order: 1
]

{ #category : #'class initialization' }
PyramidBlocProperties class >> initialize [

	PyramidPluginManager uniqueInstance removePlugin: self.
	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #accessing }
PyramidBlocProperties class >> position [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand position
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory positionInput
		 order: 60
]

{ #category : #accessing }
PyramidBlocProperties class >> text [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand text
		  inputBuilder: PyramidPropertyInputModelBuilderFactory textInput
		  order: 10
]

{ #category : #accessing }
PyramidBlocProperties class >> textForeground [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand textAttribute
		  inputBuilder: PyramidPropertyInputModelBuilderFactory textForeground
		  order: 12
]

{ #category : #accessing }
PyramidBlocProperties class >> textSpacing [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand textAttribute
		  inputBuilder: PyramidPropertyInputModelBuilderFactory textSpacing
		  order: 2
]

{ #category : #accessing }
PyramidBlocProperties class >> visibility [

	^ PyramidProperty
		  fromCommand: PyramidBlocCommand visibility
		  inputBuilder:
		  PyramidPropertyInputModelBuilderFactory visibilityDropList
		order: 2
]

{ #category : #'as yet unclassified' }
PyramidBlocProperties >> connectOn: aPyramidEditor [

	aPyramidEditor properties addProperty: self class identifier.
	aPyramidEditor properties addProperty: self class visibility.
	aPyramidEditor properties addProperty: self class background.
	aPyramidEditor properties addProperty: self class geometry.
	aPyramidEditor properties addProperty: self class position.
	aPyramidEditor properties addProperty: self class contraintsVertical.
	aPyramidEditor properties addProperty:
		self class contraintsHorizontal.
	aPyramidEditor properties addProperty: self class fontSize.
	aPyramidEditor properties addProperty: self class fontWeight.
	aPyramidEditor properties addProperty: self class text.
	aPyramidEditor properties addProperty: self class textSpacing.
	aPyramidEditor properties addProperty: self class textForeground.
	
]

{ #category : #'see class side' }
PyramidBlocProperties >> seeClassSide [
]
