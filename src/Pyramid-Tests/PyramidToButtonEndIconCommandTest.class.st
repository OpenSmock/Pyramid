Class {
	#name : #PyramidToButtonEndIconCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-editor'
}

{ #category : #accessing }
PyramidToButtonEndIconCommandTest >> command [

	^ PyramidToButtonEndIconCommand new
]

{ #category : #'as yet unclassified' }
PyramidToButtonEndIconCommandTest >> targetContainers [
    ^ {
        (PyramidCommandTestContainer
            no: (ToButton new yourself)
            with: (ToButton new
                    endIcon: (ToIcon new 
                        iconImage: (Smalltalk ui icons iconNamed: #abstract))
                    yourself)
            prop: #abstract).
    }
]
