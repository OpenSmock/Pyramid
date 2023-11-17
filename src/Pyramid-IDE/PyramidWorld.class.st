Class {
	#name : #PyramidWorld,
	#superclass : #Object,
	#category : #'Pyramid-IDE-Menus'
}

{ #category : #actions }
PyramidWorld class >> displayLoadedPlugins [

	| presenter stream |
	presenter := SpTextPresenter new.
	stream := ReadWriteStream on: String new.
	
	"Create loaded plugin list"
	PyramidPluginManager uniqueInstance ifNotNil:[ :e |
		
		"Statistics"
		stream 
			nextPutAll: (e pluginClasses size) asString; 
			nextPutAll: ' loaded plugin(s).'; 
			cr; cr.
		
		"Details"
		e pluginClasses do:[ :p |
			stream nextPutAll: '-' ; nextPutAll: p name; cr.	
		].
	
	] ifNil:[stream nextPutAll: 'No loaded plugins.'].
	
	presenter text: stream contents.
	presenter open.
	presenter withWindowDo: [ :w | w title: 'Pyramid loaded plugins' ].
]

{ #category : #menu }
PyramidWorld class >> menuBrowseSourcesOn: aBuilder [

	<worldMenu>
	(aBuilder item: #New)
		parent: #PyramidDev;
		order: 2.0;
		action: [ self startBrowseSources ];
		icon: (self iconNamed: #nautilus);
		help: 'Open Pyramid sources packages in a browser';
		label: 'Browse sources'
]

{ #category : #menu }
PyramidWorld class >> menuGithubOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Github)
		parent: #PyramidDev;
		order: 3.0;
		label: 'Github';
		help: 'Open Pyramid Github page';
		icon: (self iconNamed: #github);
		action: [ WebBrowser openOn: 'https://github.com/OpenSmock/Pyramid' ]
]

{ #category : #menu }
PyramidWorld class >> menuLoadedPluginsOn: aBuilder [

	<worldMenu>
	(aBuilder item: #New)
		parent: #PyramidDev;
		order: 1.0;
		action: [ self displayLoadedPlugins ];
		icon: (self iconNamed: #box);
		help: 'Display all installed plugins';
		label: 'Loaded plugins'
]

{ #category : #menu }
PyramidWorld class >> menuNewOn: aBuilder [

	<worldMenu>
	(aBuilder item: #New)
		parent: #PyramidUser;
		order: 1.0;
		action: [ self startNewDesign ];
		icon: (self iconNamed: #page);
		help: 'Create a new User-Interface project !';
		label: 'New project'
]

{ #category : #'menu - root' }
PyramidWorld class >> menuPyramidOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Pyramid)
		parent: #Tools;
		label: 'Pyramid';
		help: 'A UI editor';
		order: 777;
		
	with:[
			(aBuilder group: #PyramidUser)
				order: 1;
				withSeparatorAfter.	
			(aBuilder group: #PyramidDev)
				order: 2.
		]
]

{ #category : #menu }
PyramidWorld class >> menuRefreshPluginOn: aBuilder [

	<worldMenu>
	(aBuilder item: #New)
		parent: #PyramidDev;
		order: 1.1;
		action: [ self startRefreshPlugins ];
		icon: (self iconNamed: #refresh);
		help: 'Reload all Pyramid plugins, use this for example to change installed plugin list';
		label: 'Reload plugins'
]

{ #category : #menu }
PyramidWorld class >> menuReportABugOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Github)
		parent: #PyramidDev;
		order: 4.0;
		label: 'Report a Bug';
		icon: (self iconNamed: #smallDebug);
		help: 'Will open the github page to report an issue';
		action: [ WebBrowser openOn: 'https://github.com/OpenSmock/Pyramid/issues/new' ]
]

{ #category : #menu }
PyramidWorld class >> menuSettingsOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Settings)
		parent: #PyramidUser;
		order: 2.0;
		label: 'Settings';
		help: 'Open Pyramid system settings';
		icon: (self iconNamed: #glamorousPreferences);
		action: [ self openPyramidSettings ]
]

{ #category : #actions }
PyramidWorld class >> openPyramidSettings [

	| browser |
	browser := SettingBrowser new.
	browser changeSearchedText: 'Pyramid'.
	browser open.
	browser expandAll
]

{ #category : #actions }
PyramidWorld class >> startBrowseSources [

	Smalltalk tools browser open packageView filterField setText: 'Pyramid'
]

{ #category : #actions }
PyramidWorld class >> startNewDesign [

	PyramidEditor open
]

{ #category : #actions }
PyramidWorld class >> startRefreshPlugins [

	PyramidPluginManager reset
]

{ #category : #'see class side' }
PyramidWorld >> seeClassSide [ 
]
