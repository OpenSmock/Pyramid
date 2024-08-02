Extension { #name : #BlVisibility }

{ #category : #'*Pyramid-Bloc' }
BlVisibility >> asIcon [

	| bloc target |
	bloc := self class blocIcon.
	target := bloc isCollection
		          ifTrue: [
			          BlElement new
							 layout: BlFrameLayout new;
				          constraintsDo: [ :c |
					          c horizontal fitContent.
					          c vertical fitContent ];
				          addChildren: bloc;
				          yourself ]
		          ifFalse: [ bloc ].
	^ target exportAsForm
]

{ #category : #'*Pyramid-Bloc' }
BlVisibility >> asString [
	"return a String"

	^ self shouldBeImplemented
]

{ #category : #'*Pyramid-Bloc' }
BlVisibility class >> blocIcon [

	^ self shouldBeImplemented
]

{ #category : #'*Pyramid-Bloc' }
BlVisibility >> nextVisibilityForTree [
"return the next visibility.
Visible -> Hidden -> Gone -> Visible"
	^ self shouldBeImplemented
]

{ #category : #'*Pyramid-Bloc' }
BlVisibility >> setVisibilityOn: aPyramidVisibilityInputPresenter [

	self shouldBeImplemented
]
