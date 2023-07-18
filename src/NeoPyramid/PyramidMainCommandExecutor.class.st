"
I execute the command on the given targets with the given arguments.

"
Class {
	#name : #PyramidMainCommandExecutor,
	#superclass : #NeoPyramidCommandExecutor,
	#category : #'NeoPyramid-command'
}

{ #category : #'as yet unclassified' }
PyramidMainCommandExecutor >> use: aCommand on: aCollection with: arguments [

	aCommand useOn: aCollection with: arguments.

]
