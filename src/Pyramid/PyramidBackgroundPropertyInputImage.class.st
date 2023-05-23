Class {
	#name : #PyramidBackgroundPropertyInputImage,
	#superclass : #PyramidBackgroundPropertyInputStrategy,
	#instVars : [
		'preview'
	],
	#category : #'Pyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundPropertyInputImage >> preview [

	^ preview
]

{ #category : #accessing }
PyramidBackgroundPropertyInputImage >> preview: anObject [

	preview := anObject
]

{ #category : #accessing }
PyramidBackgroundPropertyInputImage >> ressource: anExternalRessource [

	anExternalRessource ifNil: [
		self preview: (SpLabelPresenter new
		         label: 'No an external ressources';
		         yourself).
		^ self
	].
	
	self preview: (SpLabelPresenter new
		         label: anExternalRessource target name , ' - ' , anExternalRessource selector;
		         yourself)
]
