Trait {
	#name : #TPyramidKeyboardExtension,
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #testing }
TPyramidKeyboardExtension >> isAnyKeyPressed [

	^ self builder keyboard isNotEmpty
]

{ #category : #testing }
TPyramidKeyboardExtension >> isNoKeyPressed [

	^ self isAnyKeyPressed not
]

{ #category : #testing }
TPyramidKeyboardExtension >> isOnlyCtrlKeyPressed [

	^ self builder keyboard isNotEmpty and: [
		  self builder keyboard allSatisfy: [ :key | key = key class controlLeft or: [ key = key class controlRight ] ] ]
]

{ #category : #testing }
TPyramidKeyboardExtension >> isOnlyShiftKeyPressed [

	^  self builder keyboard isNotEmpty and: [ self builder keyboard allSatisfy: [ :key | key isShift ]]
]
