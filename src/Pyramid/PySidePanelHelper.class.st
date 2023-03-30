Class {
	#name : #PySidePanelHelper,
	#superclass : #Object,
	#category : #'Pyramid-Editor-Panels-Side'
}

{ #category : #'as yet unclassified' }
PySidePanelHelper class >> defaultLayoutFrom: aLayout [

	^ SpScrollableLayout new child:
		  aLayout;
		  yourself
]

{ #category : #'see class side' }
PySidePanelHelper >> seeClassSide [ 

]
