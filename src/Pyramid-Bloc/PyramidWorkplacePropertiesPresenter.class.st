"
Workplace properties

This plugin windows use the plugin-space-extension -> PyramidMainExtension
"
Class {
	#name : #PyramidWorkplacePropertiesPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'gridLabel',
		'windowTitle',
		'workplaceSize',
		'extentWindow',
		'visibilityButton',
		'visibilityLabel',
		'spacingLabel',
		'spacingText',
		'gridColorLabel',
		'gridColor'
	],
	#category : #'Pyramid-Bloc-plugin-workplace-properties'
}

{ #category : #'initialization - deprecated' }
PyramidWorkplacePropertiesPresenter >> defaultLayout [ 

	| defaultLayout workPlaceSizeLine gridLabelLayout visibilityLine spacingLine colorLine workPlaceTitleLine nothing |
	defaultLayout := SpBoxLayout newVertical spacing: 6; yourself.
	
	"Help to center component on the window"
	nothing := SpBoxLayout newVertical vAlignCenter; yourself.
	
	workPlaceTitleLine:= SpBoxLayout newHorizontal hAlignCenter; yourself.
	workPlaceTitleLine add: nothing width: 65.
	workPlaceTitleLine add: windowTitle width: 185.
	
	workPlaceSizeLine := SpBoxLayout newVertical.
	workPlaceSizeLine add: workplaceSize.
	
	gridLabelLayout := SpBoxLayout newHorizontal vAlignCenter hAlignCenter; yourself.
	gridLabelLayout add: gridLabel.
	
	visibilityLine := SpBoxLayout newHorizontal vAlignCenter; yourself.
	
	visibilityLine add: visibilityLabel.
	visibilityLine add: visibilityButton width: 15.
	visibilityLine add: nothing width: 137.
	
	spacingLine := SpBoxLayout newHorizontal vAlignCenter; yourself.
	
	spacingLine add: spacingLabel.
	spacingLine add: spacingText.
	spacingLine add: nothing width: 110.
	
	colorLine := SpBoxLayout newHorizontal vAlignCenter; yourself.
	colorLine add: gridColorLabel.
	colorLine add: gridColor.
	
	defaultLayout add: workPlaceTitleLine expand: false.
	defaultLayout add: workPlaceSizeLine expand: false.
	defaultLayout add: gridLabelLayout expand: false.
	defaultLayout add: visibilityLine expand: false.
	defaultLayout add: spacingLine expand: false.
	defaultLayout add: colorLine expand: false.
	
	^ defaultLayout
]

{ #category : #accessing }
PyramidWorkplacePropertiesPresenter >> extentWindow [
	^ extentWindow
]

{ #category : #accessing }
PyramidWorkplacePropertiesPresenter >> extentWindow: aPoint [
	extentWindow := aPoint
]

{ #category : #accessing }
PyramidWorkplacePropertiesPresenter >> gridColor [
	^ gridColor
]

{ #category : #accessing }
PyramidWorkplacePropertiesPresenter >> gridColorValue [
	"get the color choose by the user"
	^ self gridColor value
]

{ #category : #accessing }
PyramidWorkplacePropertiesPresenter >> gridColorValue: aColorValue [
	"set the color choose by the user"
	self gridColor value: aColorValue 
]

{ #category : #'initialization - deprecated' }
PyramidWorkplacePropertiesPresenter >> initializePresenter [ 
	
	windowTitle := SpLabelPresenter new 
							displayBold: [ true ];
							label: 'Workplace properties';
							yourself.
						
	workplaceSize := PyramidPointInputPresenter new.
	
	gridLabel := SpLabelPresenter new 
							displayBold: [ true ];
							label: 'Grid';
							centered;
							yourself.
	
	visibilityLabel := (SpLabelPresenter new label: 'Visibility :'; yourself).
	visibilityButton := SpCheckBoxPresenter new 
						help: 'Enable/disable the grid';
						yourself.
	
	spacingLabel := (SpLabelPresenter new label: 'Spacing :'; yourself).
	spacingText := "PyramidNumberInputPresenter"PyramidNumberFilterOnlyDigitsInputPresenter new.
						
	gridColorLabel := (SpLabelPresenter new label: 'Color :'; yourself).
	gridColor := PyramidColorInputSingleLineWithPickupButtonPresenter new.
	
	
]

{ #category : #accessing }
PyramidWorkplacePropertiesPresenter >> spacingText [
	^ spacingText
]

{ #category : #accessing }
PyramidWorkplacePropertiesPresenter >> spacingTextValue [
	"Spacing value"
	^ self spacingText value
]

{ #category : #'as yet unclassified' }
PyramidWorkplacePropertiesPresenter >> spacingTextValue: aValue [
	
	self spacingText value: aValue.
	self spacingText defaultValue: aValue
]

{ #category : #accessing }
PyramidWorkplacePropertiesPresenter >> visibilityButton [
	^ visibilityButton
]

{ #category : #enumerating }
PyramidWorkplacePropertiesPresenter >> whenColorValuesChangedDo: aBlock [

	^ gridColor whenValueChangedDo: aBlock
]

{ #category : #enumerating }
PyramidWorkplacePropertiesPresenter >> whenSpacingTextChangedDo: aBlock [
	
	spacingText whenValueChangedDo: aBlock
]

{ #category : #enumerating }
PyramidWorkplacePropertiesPresenter >> whenVisibilityChangedDo: aBlock [

	visibilityButton whenChangedDo: aBlock
]

{ #category : #enumerating }
PyramidWorkplacePropertiesPresenter >> whenWorkplaceValuesChangedDo: aBlock [

	workplaceSize whenValueChangedDo: aBlock
]

{ #category : #accessing }
PyramidWorkplacePropertiesPresenter >> workplaceSize [
	"window size component"
	^ workplaceSize
]

{ #category : #accessing }
PyramidWorkplacePropertiesPresenter >> workplaceSizeValue: aPoint [
	
	workplaceSize value: aPoint
]
