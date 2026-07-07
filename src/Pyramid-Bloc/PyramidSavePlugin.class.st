Class {
	#name : #PyramidSavePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'inputsController',
		'inputsView',
		'saveModel',
		'inputsButton',
		'savingService',
		'saveButton',
		'projectModel'
	],
	#category : #'Pyramid-Bloc-plugin-save'
}

{ #category : #'instance creation' }
PyramidSavePlugin class >> openOn: aCollectionOfBlElement saveModel: aSaveModel [

	| editor savePlugin metaData mainExtension spacePlugin |
	PyramidSavingService currentProjectMetaData: nil.
	PyramidMainExtension currentGridWindowSize: nil.
	editor := PyramidEditor buildEditor.
	savePlugin := editor plugins select: [ :each | each class = self ].
	savePlugin size = 1 ifFalse: [
			Error signal:
				'Wrong installation of SavePlugin. Should only be one instance.' ].
	savePlugin := savePlugin asArray first.
	editor projectModel firstLevelElements addAll: aCollectionOfBlElement.

	[
		| metaDataSelector savingClass |
		metaDataSelector := (aSaveModel savingMethodName , 'MetaData')
			                    asSymbol.
		savingClass := self class environment classNamed:
			               aSaveModel savingClassName.
		savingClass perform: metaDataSelector ]
		on: Error
		do: [ nil ].

	metaData := PyramidSavingService currentProjectMetaData.
	savePlugin openOn: aSaveModel.
	editor open.

	metaData ifNotNil: [
			spacePlugin := editor plugins
				               detect: [ :p | p isKindOf: PyramidSpacePlugin ]
				               ifNone: [ nil ].
			spacePlugin ifNotNil: [
					mainExtension := spacePlugin builder extensions
						                 detect: [ :e |
						                 e isKindOf: PyramidMainExtension ]
						                 ifNone: [ nil ].
					mainExtension ifNotNil: [
							(metaData at: #windowSize ifAbsent: [ nil ]) ifNotNil: [ :size |
								mainExtension extent: size.
								mainExtension workplacePropertiesView workplaceSizeValue: size. ].
							(metaData at: #gridVisibility ifAbsent: [ nil ]) ifNotNil: [
								:visibility | mainExtension gridVisibility: visibility ].
							(metaData at: #gridSpacing ifAbsent: [ nil ]) ifNotNil: [
									:spacing |
									mainExtension gridSpacing: spacing.
									mainExtension workplacePropertiesView spacingText value:
										spacing ].
							(metaData at: #gridColor ifAbsent: [ nil ]) ifNotNil: [ :color |
									mainExtension gridColor: color.
									mainExtension workplacePropertiesView gridColorValue: color.
									mainExtension createGrid ] ] ] ]
]

{ #category : #adding }
PyramidSavePlugin >> addPanelsOn: aPyramidSimpleWindow [

	self inputsController editorWindow: aPyramidSimpleWindow.

	aPyramidSimpleWindow
		at: #topLeft
		addItem: [ :builder |
		builder makeButtonWithIcon: self saveButton order: 1 ].
	aPyramidSimpleWindow
		at: #topLeft
		addItem: [ :builder |
		builder makeButtonWithIcon: self inputsButton order: 2 ]
]

{ #category : #connecting }
PyramidSavePlugin >> connectOn: aPyramidEditor [

	self projectModel: aPyramidEditor projectModel.
	self saveModel projectModel: aPyramidEditor projectModel.
	self inputsController projectModel: aPyramidEditor projectModel.
	
	aPyramidEditor
		addShortcutSpecInCollection: $s command mac | $s control unix | $s control win
		action: [ self saveAction ]
		name: 'Save shortcut spec'
]

{ #category : #initialization }
PyramidSavePlugin >> initialize [

	inputsController := PyramidSaveProjectConfigurationController new.
	inputsView := inputsController view.
	saveModel := inputsController saveModel.

	savingService := PyramidSavingService new
		                 saveModel: saveModel;
		                 yourself.

	inputsButton := SpButtonPresenter new
		                icon: (Smalltalk ui icons iconNamed: #smallRemoteOpen);
		                help: 'Project configuration';
		                action: [
			                (PyramidPopoverFactory
				                 makeWithPresenter: inputsView
				                 relativeTo: inputsButton
				                 position: SpPopoverPosition right) popup ];
		                yourself.

	saveButton := SpButtonPresenter new
		              icon: (Smalltalk ui icons iconNamed: #smallSave);
		              help: 'Save project';
		              action: [ self saveAction ];
		              yourself
]

{ #category : #accessing }
PyramidSavePlugin >> inputsButton [

	^ inputsButton
]

{ #category : #accessing }
PyramidSavePlugin >> inputsController [

	^ inputsController
]

{ #category : #accessing }
PyramidSavePlugin >> inputsView [

	^ inputsView
]

{ #category : #'instance creation' }
PyramidSavePlugin >> openOn: aSaveModel [
	"self inputsView inputClass text: aSaveModel savingClassName.
	self inputsView inputMethod text: aSaveModel savingMethodName.
	self inputsView inputPackage text: aSaveModel savingPackageName.
	self inputsView model isSaved: aSaveModel isSaved."

	aSaveModel projectModel: self projectModel.
	self savingService saveModel: aSaveModel.
	self inputsController saveModel: aSaveModel.

	aSaveModel isClassSide
		ifTrue: [ self inputsView buttonClass click ]
		ifFalse: [ self inputsView buttonInstance click ]
]

{ #category : #accessing }
PyramidSavePlugin >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidSavePlugin >> projectModel: aPyramidProjectModel [

	projectModel := aPyramidProjectModel.
	self inputsController updateView
]

{ #category : #actions }
PyramidSavePlugin >> saveAction [
    [
        self savingService save.
        self inputsController isSaved.
        PyramidSavingService currentSaveModel: self saveModel ]
        on: Error
        do: [ :e |
            (e isKindOf: PyramidSaveError) ifTrue: [
                ^ UIManager default
                    alert: 'Cannot save the project, open project configuration to setup a valid saving location.'
                    title: 'Project configuration problem' ].
            (e isKindOf: BlocSerializationError) ifTrue: [
                (UIManager default
                    confirm: 'Error when saving the project: ' , e messageText asString , '
            Debug this error ?'
                    label: 'Error')
                    ifTrue: [ e debug ]
                    ifFalse: [ ^ self ] ] ]
]

{ #category : #accessing }
PyramidSavePlugin >> saveButton [

	^ saveButton
]

{ #category : #accessing }
PyramidSavePlugin >> saveModel [

	^ saveModel
]

{ #category : #accessing }
PyramidSavePlugin >> savingService [

	^ savingService
]
