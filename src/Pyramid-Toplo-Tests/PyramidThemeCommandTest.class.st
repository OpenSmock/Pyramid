Class {
	#name : #PyramidThemeCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Toplo-Tests-cases-plugin-theme-management'
}

{ #category : #accessing }
PyramidThemeCommandTest >> command [

	^ PyramidThemeCommand new
]

{ #category : #'as yet unclassified' }
PyramidThemeCommandTest >> targetContainers [

	^ {
		  (PyramidCommandTestContainer
			   no: BlElement new
			   with: (BlElement new
					    toTheme: ToRawTheme dark;
					    yourself)
			   prop: ToRawTheme dark).
		  (PyramidCommandTestContainer
			   no: (BlElement new
					    toTheme: ToRawTheme dark;
					    yourself)
			   with: (BlElement new
					    toTheme: ToRawTheme light;
					    yourself)
			   prop: ToRawTheme light).
			 (PyramidCommandTestContainer
			   no: (BlElement new
					    toTheme: ToRawTheme dark;
					    yourself)
			   with: (BlElement new)
			   prop: nil) }
]
