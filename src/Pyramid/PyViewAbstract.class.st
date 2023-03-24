Class {
	#name : #PyViewAbstract,
	#superclass : #SpPresenter,
	#category : #'Pyramid-ZZZ-DeprecatedEditor-Views'
}

{ #category : #testing }
PyViewAbstract class >> isAbstract [

	^ self == PyViewAbstract
]

{ #category : #converting }
PyViewAbstract >> asNotebookPage [

	^ SpNotebookPage title: self pageTitle icon: self pageIcon provider: [ self ]
]

{ #category : #testing }
PyViewAbstract >> isPyBlocInput [

	^ false
]

{ #category : #testing }
PyViewAbstract >> isPyBlocOutput [

	^ false
]

{ #category : #accessing }
PyViewAbstract >> pageIcon [

	^ self iconNamed: #delete
]

{ #category : #accessing }
PyViewAbstract >> pageTitle [

	^ 'Abstract'
]
