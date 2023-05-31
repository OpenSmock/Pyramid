Class {
	#name : #PyramidExternalRessourceProxyTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-Cases'
}

{ #category : #'as yet unclassified' }
PyramidExternalRessourceProxyTest class >> dummyExample [

	^ PyramidExternalRessourceDummyForTest new
]

{ #category : #tests }
PyramidExternalRessourceProxyTest >> testFromSource [

	| externalRessourceProxy |
	externalRessourceProxy := PyramidExternalRessourceProxy fromSource:
		                          (PyramidExternalRessourceSource
			                           target:
			                           PyramidExternalRessourceProxyTest
			                           selector: #dummyExample).
	self assert: externalRessourceProxy dummyValue equals: 0.
	externalRessourceProxy dummyValuePlus.
	externalRessourceProxy dummyValuePlus.
	externalRessourceProxy dummyValuePlus.
	self assert: externalRessourceProxy dummyValue equals: 3
]
