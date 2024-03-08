Class {
	#name : #PyramidContainsValidSelectorInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter'
	],
	#category : #'Pyramid-Toplo-Tests-cases-plugin-theme-management'
}

{ #category : #accessing }
PyramidContainsValidSelectorInterpreterTest >> initialize [

	super initialize.
	interpreter := PyramidContainsValidSelectorInterpreter new.
]

{ #category : #accessing }
PyramidContainsValidSelectorInterpreterTest >> interpreter [

	^ interpreter
]

{ #category : #tests }
PyramidContainsValidSelectorInterpreterTest >> testVisitActionSelector [

	| selector element |
	selector := [ :e | true ] asActionSelector.
	element := ToElement new.
	self interpreter check: selector on: element.
	self assert: self interpreter result.

	selector := [ :e | false ] asActionSelector.
	element := ToElement new.
	self interpreter check: selector on: element.
	self deny: self interpreter result
]

{ #category : #tests }
PyramidContainsValidSelectorInterpreterTest >> testVisitAndSelector [
	"
	left ok + right ok -> true
	left ko + right ok -> false
	left ok + right ko -> false
	left ko + right ko -> false
	"

	| selector element |
	selector := ToButton asTypeSelector && #hello asStampSelector.

	element := ToButton new.
	self interpreter check: selector on: element.
	self assert: self interpreter result.

	element := ToElement new.
	self interpreter check: selector on: element.
	self deny: self interpreter result.
	
	selector := #hello asStampSelector && #world asStampSelector.
	element := ToElement new.
	self interpreter check: selector on: element.
	self assert: self interpreter result.
]

{ #category : #tests }
PyramidContainsValidSelectorInterpreterTest >> testVisitChildSelector [
	"
	child ok + parent ok -> true
	child ok + parent ko -> false
	child ko + parent ok -> false
	"

	| selector parent child |
	selector := ToButton asTypeSelector withChild:
		            ToButton asTypeSelector.

	"child ok + parent ok -> true"
	parent := ToButton new.
	child := ToButton new.
	parent addChild: child.
	self interpreter check: selector on: parent.
	self assert: self interpreter result.

	"child ok + parent ko -> false"
	parent := ToElement new.
	child := ToButton new.
	parent addChild: child.
	self interpreter check: selector on: parent.
	self deny: self interpreter result.

	"child ko + parent ok -> false"
	parent := ToButton new.
	child := ToElement new.
	parent addChild: child.
	self interpreter check: selector on: parent.
	self deny: self interpreter result
]

{ #category : #tests }
PyramidContainsValidSelectorInterpreterTest >> testVisitIdSelector [
	"
	id ok -> true
	id ko -> false
	"

	| selector element |
	selector := #hello asIdSelector.

	element := ToElement new id: #hello; yourself.
	self interpreter check: selector on: element.
	self assert: self interpreter result.

element := ToElement new.
	self interpreter check: selector on: element.
	self deny: self interpreter result.
]

{ #category : #tests }
PyramidContainsValidSelectorInterpreterTest >> testVisitNotSelector [

	| selector element |
	"action"
	selector := [ :e | true ] asActionSelector not.
	element := ToElement new.
	self interpreter check: selector on: element.
	self deny: self interpreter result.
	selector := [ :e | false ] asActionSelector not.
	element := ToElement new.
	self interpreter check: selector on: element.
	self assert: self interpreter result.

	"type"
	selector := ToButton asTypeSelector not.
	element := ToButton new.
	self interpreter check: selector on: element.
	self deny: self interpreter result.
	element := ToElement new.
	self interpreter check: selector on: element.
	self assert: self interpreter result.

	"stamp"
	selector := #hello asStampSelector not.
	element := ToElement new
		           addStamp: #hello;
		           yourself.
	self interpreter check: selector on: element.
	self assert: self interpreter result.
	element := ToElement new.
	self interpreter check: selector on: element.
	self assert: self interpreter result.

	"id"
	selector := #hello asIdSelector not.
	element := ToElement new
		           id: #hello;
		           yourself.
	self interpreter check: selector on: element.
	self deny: self interpreter result.
	element := ToElement new.
	self interpreter check: selector on: element.
	self assert: self interpreter result.
	
	"universal"
	selector := ToUniversalSelector new not.
	element := ToElement new.
	self interpreter check: selector on: element.
	self deny: self interpreter result.
	selector := ToUniversalSelector new not not.
	self interpreter check: selector on: element.
	self assert: self interpreter result.
]

{ #category : #tests }
PyramidContainsValidSelectorInterpreterTest >> testVisitOrSelector [
	"
	left ok + right ok -> true
	left ko + right ok -> true
	left ok + right ko -> true
	left ko + right ko -> false
	"

	| selector element |
	selector := ToButton asTypeSelector || ToLabel asTypeSelector.

	element := ToButton new.
	self interpreter check: selector on: element.
	self assert: self interpreter result.

	element := ToLabel new.
	self interpreter check: selector on: element.
	self assert: self interpreter result.

	element := ToElement new.
	self interpreter check: selector on: element.
	self deny: self interpreter result.

	selector := ToButton asTypeSelector || #hello asStampSelector.
	element := ToButton new.
	self interpreter check: selector on: element.
	self assert: self interpreter result.
	
	selector := #hello asStampSelector || #world asStampSelector.
	element := ToElement new.
	self interpreter check: selector on: element.
	self assert: self interpreter result
]

{ #category : #tests }
PyramidContainsValidSelectorInterpreterTest >> testVisitParentSelector [
	"
	child ok + parent ok -> true
	child ok + parent ko -> false
	child kk + parent ok -> false
	"

	| selector parent child |
	selector := ToButton asTypeSelector withParent:
		            ToButton asTypeSelector.

	"child ok + parent ok -> true"
	parent := ToButton new.
	child := ToButton new.
	parent addChild: child.
	self interpreter check: selector on: child.
	self assert: self interpreter result.

	"child ok + parent ko -> false"
	parent := ToElement new.
	child := ToButton new.
	parent addChild: child.
	self interpreter check: selector on: child.
	self deny: self interpreter result.

	"child ko + parent ok -> false"
	parent := ToButton new.
	child := ToElement new.
	parent addChild: child.
	self interpreter check: selector on: child.
	self deny: self interpreter result.

	"child ok + parent ok -> true"
	selector := ToButton asTypeSelector withParent:
		            #hello asStampSelector.
	parent := ToElement new addStamp: #hello.
	child := ToButton new.
	parent addChild: child.
	self interpreter check: selector on: child.
	self assert: self interpreter result.
	
	"child ok + parent ko -> false"
	selector := ToButton asTypeSelector withParent:
		            #hello asStampSelector.
	parent := ToElement new.
	child := ToButton new.
	parent addChild: child.
	self interpreter check: selector on: child.
	self deny: self interpreter result
]

{ #category : #tests }
PyramidContainsValidSelectorInterpreterTest >> testVisitSiblingSelector [
	"
	child ok + sibling1 ok + sibling2 ok -> true
	child ok + sibling1 ok + sibling2 ko -> true
	child ok + sibling1 ko + sibling2 ko -> false
	child ko + sibling1 ok + sibling2 ok -> false
	"

	| selector parent child sibling1 sibling2 |
	selector := ToButton asTypeSelector withSibling:
		            ToButton asTypeSelector.

	"child ok + sibling1 ok + sibling2 ok -> true"
	parent := ToElement new.
	child := ToButton new.
	sibling1 := ToButton new.
	sibling2 := ToButton new.
	parent addChild: child.
	parent addChild: sibling1.
	parent addChild: sibling2.

	self interpreter check: selector on: child.
	self assert: self interpreter result.

	"child ok + sibling1 ok + sibling2 ko -> true"
	parent := ToElement new.
	child := ToButton new.
	sibling1 := ToButton new.
	sibling2 := ToElement new.
	parent addChild: child.
	parent addChild: sibling1.
	parent addChild: sibling2.

	self interpreter check: selector on: child.
	self assert: self interpreter result.

	"child ok + sibling1 ko + sibling2 ko -> false"
	parent := ToElement new.
	child := ToButton new.
	sibling1 := ToElement new.
	sibling2 := ToElement new.
	parent addChild: child.
	parent addChild: sibling1.
	parent addChild: sibling2.

	self interpreter check: selector on: child.
	self deny: self interpreter result.

	"child ko + sibling1 ok + sibling2 ok -> false"
	parent := ToElement new.
	child := ToElement new.
	sibling1 := ToButton new.
	sibling2 := ToButton new.
	parent addChild: child.
	parent addChild: sibling1.
	parent addChild: sibling2.

	self interpreter check: selector on: child.
	self deny: self interpreter result
]

{ #category : #tests }
PyramidContainsValidSelectorInterpreterTest >> testVisitStyleStampSelector [
"Test is true because stamps is authorized"
	| element |
	element := ToElement new.
	self interpreter check: #hello asStampSelector on: element.
	self assert: self interpreter result.
	element addStamp: #hello.
	self interpreter check: #hello asStampSelector on: element.
	self assert: self interpreter result
]

{ #category : #tests }
PyramidContainsValidSelectorInterpreterTest >> testVisitTypeSelector [
	"
	Return true if type is ok.
	Return false if type is ko.
	"

	| element |
	element := ToElement new.
	self interpreter check: ToButton asTypeSelector on: element.
	self deny: self interpreter result.
	element := ToButton new.
	self interpreter check: ToButton asTypeSelector on: element.
	self assert: self interpreter result
]

{ #category : #tests }
PyramidContainsValidSelectorInterpreterTest >> testVisitUniversalSelector [
	"Test is true universal is authorized"

	| element |
	element := ToElement new.
	self interpreter check: ToUniversalSelector new on: element.
	self assert: self interpreter result
]
