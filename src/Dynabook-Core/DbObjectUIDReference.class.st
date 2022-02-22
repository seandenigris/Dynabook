Class {
	#name : #DbObjectUIDReference,
	#superclass : #MAObjectUIDReference,
	#instVars : [
		'collectionGetter',
		'sourceClassName',
		'sourceGetter'
	],
	#category : #'Dynabook-Core'
}

{ #category : #accessing }
DbObjectUIDReference class >> leJsonV4Name [
	^ 'dbObjectUIDReference'
]

{ #category : #accessing }
DbObjectUIDReference >> collectionGetter [

	^ collectionGetter
]

{ #category : #accessing }
DbObjectUIDReference >> collectionGetter: aSymbol [

	self flag: '#asSymbol is workaround Lepiter materializing symbols as strings, pending answer on GT Discord'.
	collectionGetter := aSymbol asSymbol
]

{ #category : #accessing }
DbObjectUIDReference >> object [

	| objCollection |
	objCollection := self source perform: self collectionGetter.
	^ objCollection detect: [ :e | e uuid = uid ] ifNone: [ nil ]
]

{ #category : #accessing }
DbObjectUIDReference >> source [

	^ self sourceClass perform: self sourceGetter
]

{ #category : #accessing }
DbObjectUIDReference >> sourceClass [

	^ sourceClassName asClass
]

{ #category : #accessing }
DbObjectUIDReference >> sourceClass: aClass [
	sourceClassName := aClass name
]

{ #category : #accessing }
DbObjectUIDReference >> sourceClassName [

	^ sourceClassName
]

{ #category : #accessing }
DbObjectUIDReference >> sourceClassName: aSymbol [
	sourceClassName := aSymbol
]

{ #category : #accessing }
DbObjectUIDReference >> sourceGetter [

	^ sourceGetter ifNil: [ #uniqueInstance ]
]

{ #category : #accessing }
DbObjectUIDReference >> sourceGetter: anObject [

	self flag: '#asSymbol is workaround Lepiter materializing symbols as strings, pending answer on GT Discord'.
	sourceGetter := anObject asSymbol
]
