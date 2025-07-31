Extension { #name : #SpTActionContainer }

{ #category : #'*Pyramid' }
SpTActionContainer >> ensureInternalActions [

	^ internalActionGroup ifNil: [
		internalActionGroup := SpActionGroup new 
			name: #internalActionGroup;
			beRoot ]
]
