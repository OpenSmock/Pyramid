Class {
	#name : #PyramidBackgroundInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidBackgroundInputPresenterTest >> dummyValues [

	^ {
	 BlBackground transparent .
	 (BlBackground paint: Color red).
		  (BlBackground paint: Color red translucent).
		  (BlBackground paint: (BlLinearGradientPaint vertical stops: {
					    (0 -> Color blue).
					    (0.5 -> Color green).
					    (1 -> Color red) })).
		  (BlBackground paint: (BlRadialGradientPaint new
				    radius: 100;
				    center: 40 @ 200;
				    stops: {
						    (0 -> Color blue).
						    (0.5 -> Color green).
						    (1 -> Color red) }))}
]

{ #category : #tests }
PyramidBackgroundInputPresenterTest >> makeNewInput [

	^ PyramidBackgroundInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput bypassTrigger
]
