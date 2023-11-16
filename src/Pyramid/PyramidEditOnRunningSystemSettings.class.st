Class {
	#name : #PyramidEditOnRunningSystemSettings,
	#superclass : #Object,
	#category : #'Pyramid-plugin-edit-on-running'
}

{ #category : #dialog }
PyramidEditOnRunningSystemSettings class >> canEditDialog: aBuilder [

	^ self theme newRowIn: self for: {
		"Default shortcut is F12 because it is usually use to enter dev mode in webbrowsers"
		self theme buttonLabelForText: 'with shortcut: F12' translated.
	}
]

{ #category : #accessing }
PyramidEditOnRunningSystemSettings class >> editOnRunning [

	^ PyramidPluginEditOnRunning editOnRunning 
]

{ #category : #accessing }
PyramidEditOnRunningSystemSettings class >> editOnRunning: aBoolean [

	PyramidPluginEditOnRunning editOnRunning: aBoolean
]

{ #category : #settings }
PyramidEditOnRunningSystemSettings class >> editOnRunningSettingOn: aBuilder [
	<systemsettings>

	(aBuilder setting: #editOnRunning)
		parent: #pyramid;
		label: '(Not working) Can edit opened BlSpaces';
		target: self;
		dialog: [self canEditDialog: aBuilder];
		description: 'Setup availability to edit opened BlSpace in a Pyramid window. 
Press the required shortcut key(s) on a focused BlSpace window to edit it in Pyramid.'
]

{ #category : #dialog }
PyramidEditOnRunningSystemSettings class >> theme [

	^ Smalltalk ui theme
]

{ #category : #'see class side' }
PyramidEditOnRunningSystemSettings >> seeClassSide [ 
]
