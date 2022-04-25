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

{ #category : #'as yet unclassified' }
DbSoup class >> uniqueInstance [
	^ UniqueInstance ifNil: [ UniqueInstance := self new ]
]

{ #category : #accessing }
DbSoup >> detectUID: aBlock [
	
	self sources do: [ :source |
		| result |
		result := source 
			detectUID: [ :uid | aBlock value: uid ]
			ifNone: [ nil ].
		result ifNotNil: [ ^ result ] ].
		
	self error: 'UID not found!'
]

{ #category : #accessing }
DbSoup >> detectUIDString36: aString [
	
	^ self detectUID: [ :id | id asString36 = aString ]
]

{ #category : #accessing }
DbSoup >> sources [

	^ { 
		PpEventUIDReference new
			sourceClass: PpEventLog;
			yourself.
		
		DbObjectUIDReference new
			sourceClass: LlLibrary;
			collectionGetter: #works;
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
