Class {
	#name : 'PyramidMagritteProperty',
	#superclass : 'Object',
	#instVars : [
		'magritteDescription',
		'commandExecutor',
		'presenterBuilder'
	],
	#category : 'Pyramid-property',
	#package : 'Pyramid',
	#tag : 'property'
}

{ #category : 'ad' }
PyramidMagritteProperty >> buildPresenterFromCluster: aCluster [

	^ self presenterBuilder
		  cluster: aCluster;
		  property: self;
		  build
]

{ #category : 'accessing' }
PyramidMagritteProperty >> command [

	^ PyramidGenericCommand new
		  selector: magritteDescription accessor readSelector;
		  yourself
]

{ #category : 'accessing' }
PyramidMagritteProperty >> commandExecutor [
	^ commandExecutor
]

{ #category : 'accessing' }
PyramidMagritteProperty >> commandExecutor: aPyramidCallbackCommandExecutor [ 
	
	commandExecutor := aPyramidCallbackCommandExecutor 
]

{ #category : 'accessing' }
PyramidMagritteProperty >> initialize [

	super initialize.
	presenterBuilder := PyramidPopingPresenterBuilder new
]

{ #category : 'accessing' }
PyramidMagritteProperty >> magritteDescription [

	^ magritteDescription
]

{ #category : 'accessing' }
PyramidMagritteProperty >> magritteDescription: anObject [

	magritteDescription := anObject
]

{ #category : 'tests' }
PyramidMagritteProperty >> makeNewInput [

	^ magritteDescription acceptSimpleReneVisitor: self
]

{ #category : 'accessing' }
PyramidMagritteProperty >> name [
	
	^ magritteDescription label
]

{ #category : 'accessing' }
PyramidMagritteProperty >> presenterBuilder [

	^ presenterBuilder
]

{ #category : 'visiting' }
PyramidMagritteProperty >> visitNumberDescription: aMANumberDescription [

	| presenter |
	presenter := PyramidNumberInputPresenter new.
	presenter help: magritteDescription comment.
	aMANumberDescription min ifNotNil: [
		presenter min: aMANumberDescription min ].

	^ presenter
]
