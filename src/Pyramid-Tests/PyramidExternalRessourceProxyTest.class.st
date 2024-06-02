Class {
	#name : 'PyramidExternalRessourceProxyTest',
	#superclass : 'TestCase',
	#category : 'Pyramid-Tests-cases-external-ressources',
	#package : 'Pyramid-Tests',
	#tag : 'cases-external-ressources'
}

{ #category : 'tests - other' }
PyramidExternalRessourceProxyTest class >> dummyExample [

	^ PyramidExternalRessourceDummyForTest new
]

{ #category : 'tests - other' }
PyramidExternalRessourceProxyTest class >> stonAsObject [

	^ STON fromString: 'PyramidExternalRessourceDummyForTest{#dummyValue:0}'
]

{ #category : 'tests - other' }
PyramidExternalRessourceProxyTest class >> stonOnStonAsObject [

	^ STON fromString: '[
	PyramidExternalRessourceProxy {
		#source : PyramidExternalRessourceSource {
			#selector : #stonAsObject,
			#target : Class [ #PyramidExternalRessourceProxyTest ],
			#arguments : [ ]
		}
	},
	PyramidExternalRessourceProxy {
		#source : PyramidExternalRessourceSource {
			#selector : #stonAsObject,
			#target : @4,
			#arguments : [ ]
		}
	}
]'
]

{ #category : 'tests' }
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

{ #category : 'tests' }
PyramidExternalRessourceProxyTest >> testStonOnSton [

	| dummys newDummys |
	dummys := PyramidExternalRessourceProxy fromSource:
		          (PyramidExternalRessourceSource
			           target: self class
			           selector: #stonOnStonAsObject).
	self assert: dummys first dummyValue equals: 0.
	self assert: dummys last dummyValue equals: 0.
	dummys first dummyValuePlus.
	dummys first dummyValuePlus.
	dummys first dummyValuePlus.
	dummys last dummyValuePlus.
	self assert: dummys first dummyValue equals: 3.
	self assert: dummys last dummyValue equals: 1.

	newDummys := STON fromString: (STON toString: dummys).
	self assert: newDummys first dummyValue equals: 0.
	self assert: newDummys last dummyValue equals: 0.

	"dummys n'est plus une ressource exterieure"
	dummys := {
		          newDummys first.
		          newDummys last pyramidExternalRessourceObject }.
	self assert: dummys first dummyValue equals: 0.
	self assert: dummys last dummyValue equals: 0.
	dummys first dummyValuePlus.
	dummys first dummyValuePlus.
	dummys first dummyValuePlus.
	dummys last dummyValuePlus.
	self assert: dummys first dummyValue equals: 3.
	self assert: dummys last dummyValue equals: 1.

	newDummys := STON fromString: (STON toString: dummys).
	self assert: newDummys first dummyValue equals: 0.
	self assert: newDummys last dummyValue equals: 1
]
