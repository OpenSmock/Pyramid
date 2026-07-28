Class {
	#name : #PyramidToButtonIconCommandTest,
	#superclass : #TestCase,
	#traits : 'TPyramidCommandTest',
	#classTraits : 'TPyramidCommandTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-editor'
}

{ #category : #accessing }
PyramidToButtonIconCommandTest >> command [

	^ PyramidToButtonIconCommand new
]

{ #category : #accessing }
PyramidToButtonIconCommandTest >> targetContainers [

	| buttonA buttonAWithIcon |
	buttonA := ToButton new
		           id: 'A';
		           yourself.

	buttonAWithIcon := ToButton new
		                   id: 'A';
		                   icon:
			                   (PyramidIconInputPresenter toImageFromName: #add);
		                   yourself.

	PyramidMainExtension addIconName: #add forElementId: 'A_icon'.


	^ { (PyramidCommandTestContainer
		   no: buttonA
		   with: buttonAWithIcon
		   prop: #add) }
]
