Trait {
	#name : 'TPyramidSpaceExtension',
	#instVars : [
		'builder'
	],
	#category : 'Pyramid-Bloc-plugin-space-extensions',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-space-extensions'
}

{ #category : 'accessing' }
TPyramidSpaceExtension >> builder [

	^ builder
]

{ #category : 'accessing' }
TPyramidSpaceExtension >> builder: anObject [

	builder:= anObject.
]

{ #category : 'accessing' }
TPyramidSpaceExtension >> editor: aPyramidEditor [
]

{ #category : 'displaying' }
TPyramidSpaceExtension >> installOn: aBuilder [

	self builder: aBuilder.
		
]

{ #category : 'accessing' }
TPyramidSpaceExtension >> projectModel: aProjectModel [
]
