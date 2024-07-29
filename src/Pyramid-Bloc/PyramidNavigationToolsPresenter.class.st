Class {
	#name : #PyramidNavigationToolsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'navigationModel',
		'addRootButton',
		'displayChildrenOptions',
		'editor'
	],
	#category : #'Pyramid-Bloc-plugin-navigation'
}

{ #category : #accessing }
PyramidNavigationToolsPresenter >> addRootButton [

	^ addRootButton
]

{ #category : #layout }
PyramidNavigationToolsPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self addRootButton expand: false;
		  add: self displayChildrenOptions expand: true;
		  yourself
]

{ #category : #accessing }
PyramidNavigationToolsPresenter >> displayChildrenOptions [

	^ displayChildrenOptions
]

{ #category : #accessing }
PyramidNavigationToolsPresenter >> editor [

	^ editor
]

{ #category : #accessing }
PyramidNavigationToolsPresenter >> editor: anObject [

	editor := anObject
]

{ #category : #initialization }
PyramidNavigationToolsPresenter >> initializePresenters [

	addRootButton := SpButtonPresenter new
		                 label: 'Add new root';
		                 icon: (Smalltalk ui iconNamed: #add);
		                 yourself.
	displayChildrenOptions := SpButtonPresenter new
		                          help:
			                          'Show / Hide not serializable children.';
		                          yourself
]

{ #category : #accessing }
PyramidNavigationToolsPresenter >> navigationModel [

	^ navigationModel
]

{ #category : #accessing }
PyramidNavigationToolsPresenter >> navigationModel: anObject [

	navigationModel := anObject.
	self updateDisplayChildrenButton
]

{ #category : #'as yet unclassified' }
PyramidNavigationToolsPresenter >> updateDisplayChildrenButton [

	self navigationModel displayAllChildren ifTrue: [ 
		self updateDisplayChildrenButtonActivate.
		^ self ].
	self updateDisplayChildrenButtonDeactivate.
	
]

{ #category : #'as yet unclassified' }
PyramidNavigationToolsPresenter >> updateDisplayChildrenButtonActivate [

	self displayChildrenOptions state: true.
	self displayChildrenOptions icon:
		(Smalltalk ui icons iconNamed: #checkboxSelected).
	self displayChildrenOptions label: 'Show children'.
	self displayChildrenOptions action: [
		self navigationModel displayAllChildren: false.
		self updateDisplayChildrenButton ]
]

{ #category : #'as yet unclassified' }
PyramidNavigationToolsPresenter >> updateDisplayChildrenButtonDeactivate [

	self displayChildrenOptions state: false.
	self displayChildrenOptions icon:
		(Smalltalk ui icons iconNamed: #checkboxUnselected).
	self displayChildrenOptions label: 'Hide children'.
	self displayChildrenOptions action: [
		self navigationModel displayAllChildren: true.
		self updateDisplayChildrenButton ]
]
