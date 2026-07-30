Class {
	#name : #PyramidToButtonEndIconCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-editor'
}

{ #category : #accessing }
PyramidToButtonEndIconCommandTest >> command [

	^ PyramidToButtonEndIconCommand new
]

{ #category : #accessing }
PyramidToButtonEndIconCommandTest >> targetContainers [

	| buttonA buttonAWithIcon |
	buttonA := ToButton new
		           id: 'A';
		           yourself.

	buttonAWithIcon := ToButton new
		                   id: 'A';
		                   icon:
			                   (PyramidIconInputPresenter toImageFromName: #add);
		                   yourself.

	PyramidMainExtension addIconName: #add forElementId: 'A_endIcon'.


	^ { (PyramidCommandTestContainer
		   no: buttonA
		   with: buttonAWithIcon
		   prop: #add) }
]
