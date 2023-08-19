Class {
	#name : #DbObjectUIDReference,
	#superclass : #OlObjectUIDReference,
	#instVars : [
		'collectionGetter',
		'sourceClassName',
		'sourceGetter'
	],
	#category : #'Dynabook-GToolkit'
}

{ #category : #accessing }
DbObjectUIDReference class >> leJsonV4Name [
	^ 'dbObjectUIDReference'
]

{ #category : #accessing }
DbObjectUIDReference >> = rhs [

	super = rhs ifFalse: [ ^ false ].
	
	"Most likely local state to vary because typically one collection per class"
	self sourceClassName = rhs sourceClassName ifFalse: [ ^ false ].
	
	self collectionGetter = rhs collectionGetter ifFalse: [ ^ false ].
	
	"Least likely to vary because Dynabook uses a standard singleton accessor"
	self sourceGetter = rhs sourceGetter ifFalse: [ ^ false ].
	
	^ true.
]

{ #category : #accessing }
DbObjectUIDReference >> collection [
	^ self source perform: self collectionGetter.
]

{ #category : #accessing }
DbObjectUIDReference >> collectionGetter [

	^ collectionGetter ifNil: [ self source dbCollectionAccessor ]
	
	"Implementation note: the reason for the inst var is that some sources have multiple collections of interest e.g. LlLibrary has works and copies, so dbCollectionAccessor would indicate the default collection, and you could set the inst var to access others"
]

{ #category : #accessing }
DbObjectUIDReference >> collectionGetter: aSymbol [

	self flag: '#asSymbol is workaround Lepiter materializing symbols as strings, pending answer on GT Discord'.
	collectionGetter := aSymbol asSymbol
]

{ #category : #accessing }
DbObjectUIDReference >> detectUID: anObject ifNone: noneBlock [
	"anObject - must understand olDetectUIDBlock. See implementors"

	^ self collection
		detect: (self wrappedUidDetector: anObject olDetectUIDBlock)
		ifNone: noneBlock
]

{ #category : #accessing }
DbObjectUIDReference >> displayStringOn: aStream [

	self sourceClassName ifNotNil: [ :clsName | 
		aStream nextPutAll: clsName ].
		
	self sourceGetter ifNotNil: [ :aSel | 
		aStream << ' > '.
		aStream nextPutAll: aSel ].
	
	self collectionGetter ifNotNil: [ :aSel | 
		aStream << ' > '.
		aStream nextPutAll: aSel ].
]

{ #category : #accessing }
DbObjectUIDReference >> hash [

	^ ((super hash bitXor: self collectionGetter hash) bitXor: self sourceClassName hash) bitXor: self sourceGetter hash
]

{ #category : #accessing }
DbObjectUIDReference >> object [

	^ self 
		detectUID: uid
		ifNone: [ nil ]
]

{ #category : #accessing }
DbObjectUIDReference >> printOn: aStream [

	self printFromDisplayStringOn: aStream
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

{ #category : #accessing }
DbObjectUIDReference >> wrappedUidDetector: aBlock [

	^ [ :e |
		| aUid |
		aUid := e uuid.
		aUid isNotNil and: [ aBlock value: aUid ] ]
]
