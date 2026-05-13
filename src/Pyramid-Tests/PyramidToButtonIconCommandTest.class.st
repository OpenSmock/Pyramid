Class {
	#name : #PyramidToButtonIconCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-editor'
}

{ #category : #accessing }
PyramidToButtonIconCommandTest >> command [

	^ PyramidToButtonIconCommand new
]

{ #category : #'as yet unclassified' }
PyramidToButtonIconCommandTest >> targetContainers [

	^ { (PyramidCommandTestContainer
		   no: ToButton new yourself
		   with: (ToButton new icon: 
				    (ToIcon new iconImage:
					     (Smalltalk ui icons iconNamed: #abstract)) yourself)
		   prop: #abstract) }
]
