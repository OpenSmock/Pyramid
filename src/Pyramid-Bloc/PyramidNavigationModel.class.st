Class {
	#name : #PyramidNavigationModel,
	#superclass : #Object,
	#traits : 'TObservable',
	#classTraits : 'TObservable classTrait',
	#instVars : [
		'#displayAllChildren => ObservableSlot'
	],
	#category : #'Pyramid-Bloc-plugin-navigation'
}

{ #category : #accessing }
PyramidNavigationModel >> displayAllChildren [

	^ displayAllChildren
]

{ #category : #accessing }
PyramidNavigationModel >> displayAllChildren: anObject [

	displayAllChildren := anObject
]

{ #category : #initialization }
PyramidNavigationModel >> initialize [

	super initialize.
	self class initializeSlots: self.
	self property: #displayAllChildren rawValue: false
]
