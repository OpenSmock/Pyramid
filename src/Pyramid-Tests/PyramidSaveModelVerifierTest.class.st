"
A PyramidSaveModelVerifierTest is a test class for testing the behavior of PyramidSaveModelVerifier
"
Class {
	#name : 'PyramidSaveModelVerifierTest',
	#superclass : 'TestCase',
	#category : 'Pyramid-Tests-cases-plugin-save',
	#package : 'Pyramid-Tests',
	#tag : 'cases-plugin-save'
}

{ #category : 'test' }
PyramidSaveModelVerifierTest >> testInitialize [

	| verifier |
	verifier := PyramidSaveModelVerifier new.
	self assert: verifier nextVerifiers isCollection.
]

{ #category : 'test' }
PyramidSaveModelVerifierTest >> testModelNilError [
	"Test an error"
	
	| verifier |
	verifier := PyramidSaveModelVerifier modelNotNil.
	verifier verify: nil. "Send a nil model"
	verifier showOn: PyramidSaveProjectConfigurationView new.
]

{ #category : 'test' }
PyramidSaveModelVerifierTest >> testVerify [

	| verifier model result |
	verifier := PyramidSaveModelVerifier new.
	model := PyramidSaveModel new.

	result := false.
	verifier verifyBlock: [ :e | result := (e = model) ].
	verifier verify: model.
	
	self assert: result.
]

{ #category : 'test' }
PyramidSaveModelVerifierTest >> testVerifyBlock [

	| verifier |
	verifier := PyramidSaveModelVerifier new.
	verifier verifyBlock: [ :e | ].
	self assert: verifier verifyBlock isBlock.
	
	
]
