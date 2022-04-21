"
A facade presenting something like HPI's soup, a collection from which all interesting domain objects are easily reachable.
"
Class {
	#name : #DbSoup,
	#superclass : #Object,
	#classVars : [
		'UniqueInstance'
	],
	#category : #'Dynabook-Core'
}

{ #category : #'as yet unclassified' }
DbSoup class >> detectUID: aBlock [
	
	^ self uniqueInstance detectUID: aBlock
]

{ #category : #'as yet unclassified' }
DbSoup class >> uniqueInstance [
	^ UniqueInstance ifNil: [ UniqueInstance := self new ]
]

{ #category : #'as yet unclassified' }
DbSoup >> detectUID: aBlock [
	| sources |
	sources := { 
		PpEventUIDReference new
			sourceClass: PpEventLog;
			yourself.
		
		DbObjectUIDReference new
			sourceClass: LlLibrary;
			collectionGetter: #works;
			yourself }.
			
	sources do: [ :source |
		| result |
		result := source 
			detectUID: [ :uid | aBlock value: uid ]
			ifNone: [ nil ].
		result ifNotNil: [ ^ result ] ].
		
	self error: 'UID not found!'
]
