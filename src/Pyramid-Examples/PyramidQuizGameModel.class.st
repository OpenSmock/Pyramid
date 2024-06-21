Class {
	#name : 'PyramidQuizGameModel',
	#superclass : 'Object',
	#instVars : [
		'question',
		'trueAnswer',
		'falseAnswer1',
		'falseAnswer2',
		'falseAnswer3'
	],
	#category : 'Pyramid-Examples',
	#package : 'Pyramid-Examples'
}

{ #category : 'as yet unclassified' }
PyramidQuizGameModel class >> modelForTest [

	^ ((1 to: 4) collect: [ :i | self new question:('<1p> + <1p> = ?' expandMacrosWith: i); trueAnswer: (i+i) printString; falseAnswer1: '0'; falseAnswer2: '1'; falseAnswer3: '3'; yourself ]) shuffle.
]

{ #category : 'accessing' }
PyramidQuizGameModel >> falseAnswer1 [

	^ falseAnswer1
]

{ #category : 'accessing' }
PyramidQuizGameModel >> falseAnswer1: anObject [

	falseAnswer1 := anObject
]

{ #category : 'accessing' }
PyramidQuizGameModel >> falseAnswer2 [

	^ falseAnswer2
]

{ #category : 'accessing' }
PyramidQuizGameModel >> falseAnswer2: anObject [

	falseAnswer2 := anObject
]

{ #category : 'accessing' }
PyramidQuizGameModel >> falseAnswer3 [

	^ falseAnswer3
]

{ #category : 'accessing' }
PyramidQuizGameModel >> falseAnswer3: anObject [

	falseAnswer3 := anObject
]

{ #category : 'accessing' }
PyramidQuizGameModel >> question [

	^ question
]

{ #category : 'accessing' }
PyramidQuizGameModel >> question: anObject [

	question := anObject
]

{ #category : 'accessing' }
PyramidQuizGameModel >> trueAnswer [

	^ trueAnswer
]

{ #category : 'accessing' }
PyramidQuizGameModel >> trueAnswer: anObject [

	trueAnswer := anObject
]
