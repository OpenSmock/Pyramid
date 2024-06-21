Class {
	#name : 'PyramidQuizGame',
	#superclass : 'Object',
	#instVars : [
		'viewStart',
		'viewQuestions',
		'viewEnd',
		'quizModel',
		'space',
		'currentQuestionNumber',
		'totalQuestionsNumber',
		'correctAnswers'
	],
	#category : 'Pyramid-Examples',
	#package : 'Pyramid-Examples'
}

{ #category : 'accessing' }
PyramidQuizGame >> correctAnswers [

	^ correctAnswers
]

{ #category : 'accessing' }
PyramidQuizGame >> correctAnswers: anObject [

	correctAnswers := anObject
]

{ #category : 'accessing' }
PyramidQuizGame >> currentQuestionNumber [

	^ currentQuestionNumber
]

{ #category : 'accessing' }
PyramidQuizGame >> currentQuestionNumber: anObject [

	currentQuestionNumber := anObject
]

{ #category : 'initialization' }
PyramidQuizGame >> goEnd [

	self viewStart visibility: BlVisibility gone.
	self viewQuestions visibility: BlVisibility gone.
	self viewEnd visibility: BlVisibility visible.
	
	self viewEnd game: self.
]

{ #category : 'initialization' }
PyramidQuizGame >> goQuestions [

	self viewStart visibility: BlVisibility gone.
	self viewQuestions visibility: BlVisibility visible.
	self viewEnd visibility: BlVisibility gone.
	
	self viewQuestions game: self.
]

{ #category : 'initialization' }
PyramidQuizGame >> goStart [

	self viewStart visibility: BlVisibility visible.
	self viewQuestions visibility: BlVisibility gone.
	self viewEnd visibility: BlVisibility gone.
	
	self viewStart game: self.
]

{ #category : 'initialization' }
PyramidQuizGame >> initialize [

	quizModel := PyramidQuizGameModel modelForTest.
	correctAnswers := 0.
	currentQuestionNumber := 1.
	totalQuestionsNumber := quizModel size.
	viewStart := PyramidQuizStartView new.
	viewQuestions := PyramidQuizQuestionsView new.
	viewEnd := PyramidQuizEndView new.
	space := BlSpace new.
	space root addChildren: {
			viewStart.
			viewQuestions.
			viewEnd }.
	self goStart
]

{ #category : 'as yet unclassified' }
PyramidQuizGame >> openGame [

	self space show
]

{ #category : 'accessing' }
PyramidQuizGame >> quizModel [

	^ quizModel
]

{ #category : 'accessing' }
PyramidQuizGame >> quizModel: anObject [

	quizModel := anObject
]

{ #category : 'accessing' }
PyramidQuizGame >> space [

	^ space
]

{ #category : 'accessing' }
PyramidQuizGame >> space: anObject [

	space := anObject
]

{ #category : 'accessing' }
PyramidQuizGame >> totalQuestionsNumber [

	^ totalQuestionsNumber
]

{ #category : 'accessing' }
PyramidQuizGame >> totalQuestionsNumber: anObject [

	totalQuestionsNumber := anObject
]

{ #category : 'accessing' }
PyramidQuizGame >> viewEnd [

	^ viewEnd
]

{ #category : 'accessing' }
PyramidQuizGame >> viewEnd: anObject [

	viewEnd := anObject
]

{ #category : 'accessing' }
PyramidQuizGame >> viewQuestions [

	^ viewQuestions
]

{ #category : 'accessing' }
PyramidQuizGame >> viewQuestions: anObject [

	viewQuestions := anObject
]

{ #category : 'accessing' }
PyramidQuizGame >> viewStart [

	^ viewStart
]

{ #category : 'accessing' }
PyramidQuizGame >> viewStart: anObject [

	viewStart := anObject
]
