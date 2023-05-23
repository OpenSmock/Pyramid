Class {
	#name : #PyramidNilPrjectModel,
	#superclass : #Object,
	#traits : 'TPyramidActiveProjectModel',
	#classTraits : 'TPyramidActiveProjectModel classTrait',
	#category : #'Pyramid-models'
}

{ #category : #adding }
PyramidNilPrjectModel >> addObserver: anObserver [
]

{ #category : #adding }
PyramidNilPrjectModel >> removeObserver: anObserver [
]

{ #category : #accessing }
PyramidNilPrjectModel >> selection [

	^ PyramidObservableElementCollection new
]
