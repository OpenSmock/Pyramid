Class {
	#name : #PyramidGeometryInputModel,
	#superclass : #Object,
	#instVars : [
		'buttonPresenter',
		'blocIcon',
		'defaultGeometry',
		'help',
		'input'
	],
	#category : 'Pyramid-Bloc-plugin-bloc-geometry'
}

{ #category : #accessing }
PyramidGeometryInputModel >> blocIcon [

	^ blocIcon
]

{ #category : #accessing }
PyramidGeometryInputModel >> blocIcon: anObject [

	blocIcon := anObject
]

{ #category : #initialization }
PyramidGeometryInputModel >> buttonPresenter [

	^ buttonPresenter
]

{ #category : #accessing }
PyramidGeometryInputModel >> defaultGeometry [

	^ defaultGeometry
]

{ #category : #accessing }
PyramidGeometryInputModel >> defaultGeometry: anObject [

	defaultGeometry := anObject
]

{ #category : #'error handling' }
PyramidGeometryInputModel >> error [

	self buttonPresenter icon: self iconError; help: 'Will do nothing'; action: [  ]
]

{ #category : #accessing }
PyramidGeometryInputModel >> help [

	^ help
]

{ #category : #accessing }
PyramidGeometryInputModel >> help: anObject [

	help := anObject
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputModel >> iconColor: aColor [

	^ (self blocIcon background: aColor) exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputModel >> iconError [

	^self iconColor: (Color fromHexString: 'FFDB42')
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputModel >> iconNormal [

	^self iconColor: (Color fromHexString: 'a7a7a7')
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputModel >> iconSelected [

	^self iconColor: (Color fromHexString: 'AFD5FA')
]

{ #category : #initialization }
PyramidGeometryInputModel >> initialize [

	buttonPresenter := SpButtonPresenter new.
]

{ #category : #accessing }
PyramidGeometryInputModel >> input [

	^ input
]

{ #category : #accessing }
PyramidGeometryInputModel >> input: anObject [

	input := anObject
]

{ #category : #'error handling' }
PyramidGeometryInputModel >> normal [

	self buttonPresenter
		icon: self iconNormal;
		help: self help;
		action: [
			self input value: self defaultGeometry.
			self input whenValueChangedDo value: self defaultGeometry. ]
]

{ #category : #'error handling' }
PyramidGeometryInputModel >> selected [

	self buttonPresenter
		icon: self iconSelected;
		help: self help;
		action: [
			 ]
]
