"
A facade presenting something like HPI's soup, a collection from which all interesting domain objects are easily reachable.
"
Class {
	#name : #DbSoup,
	#superclass : #Object,
	#classVars : [
		'UniqueInstance'
	],
	#category : #'Dynabook-Core-Soup'
}

{ #category : #accessing }
DbSoup class >> detectUIDString36: aString [
	
	^ self uniqueInstance detectUIDString36: aString
]

{ #category : #accessing }
DbSoup class >> detectUIDString36: aString ifNone: noneBlock [
	
	^ self uniqueInstance detectUIDString36: aString ifNone: noneBlock
]

{ #category : #'as yet unclassified' }
DbSoup class >> uniqueInstance [
	^ UniqueInstance ifNil: [ UniqueInstance := self new ]
]

{ #category : #accessing }
DbSoup >> detectUID: aBlock [
	
	^ self
		detectUID: aBlock 
		ifNone: [ self error: 'UID not found!' ]
]

{ #category : #accessing }
DbSoup >> detectUID: aBlock ifNone: noneBlock [
	
	self sources do: [ :source |
		| result |
		result := source 
			detectUID: [ :uid | aBlock value: uid ]
			ifNone: [ nil ].
		result ifNotNil: [ ^ result ] ].
		
	^ noneBlock value
]

{ #category : #accessing }
DbSoup >> detectUIDString36: aString [
	
	^ self detectUID: [ :id | id asString36 = aString ]
]

{ #category : #accessing }
DbSoup >> detectUIDString36: aString ifNone: noneBlock [
	
	^ self detectUID: [ :id | id asString36 = aString ] ifNone: noneBlock
]

{ #category : #accessing }
DbSoup >> gtSpotterProcessorsFor: aSpotterStep [
	| spotterSources |
	spotterSources := self sources collect: [ :e | e source ] as: IdentitySet.
	^ spotterSources flatCollect: [ :source | source gtSpotterProcessorsFor: aSpotterStep ]
]

{ #category : #accessing }
DbSoup >> sources [

	^ { 
		DbObjectUIDReference new
			sourceClass: CwSoftwareCatalog;
			collectionGetter: #collection;
			yourself.
			
		DbObjectUIDReference new
			sourceClass: LlLibrary;
			collectionGetter: #works;
			yourself.
			
		DbObjectUIDReference new
			sourceClass: MpAddressBook;
			collectionGetter: #contacts;
			yourself.
			
		PpEventUIDReference new
			sourceClass: PpEventLog;
			yourself.
			
		DbObjectUIDReference new
			sourceClass: PpInventory;
			collectionGetter: #items;
			yourself.
		
		DbObjectUIDReference new
			sourceClass: RlResourceLibrary;
			collectionGetter: #resources;
			yourself.
			
		DbObjectUIDReference new
			sourceClass: LlLibrary;
			collectionGetter: #copies;
			yourself.
	}.
]
