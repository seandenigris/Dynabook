Class {
	#name : #DbLeObjectPageType,
	#superclass : #LePageType,
	#instVars : [
		'subjectModelReference'
	],
	#classVars : [
		'ModelReferenceBuilder',
		'ModelReferenceBuilderMap'
	],
	#category : #'Dynabook-GToolkit'
}

{ #category : #examples }
DbLeObjectPageType class >> exampleEmptyPage [
	<gtExample>
	
	| page model transcript |
	transcript := QuTranscript new.
	model := Object new.
	model stub ensureUUID willReturn: 1.
	model stub uuid willReturn: 1.
	model stub participants willReturn: #('Jack' 'Jill').
	model stub transcript willReturn: transcript.
	self modelReferenceBuilderMap at: Object put: [MADummyObjectUIDReferenceForTesting new
		object: model;
		uid: model uuid;
		yourself ].
	[ 
		page := LePage quTranscriptOwner: model.
	] ensure: [ self modelReferenceBuilderMap removeKey: Object ].
	LeDatabase new addPage: page.
	^ page
]

{ #category : #initialization }
DbLeObjectPageType class >> initialize [

	LeDatabasesRegistry defaultPrimaryDatabase updatePageTypes
]

{ #category : #accessing }
DbLeObjectPageType class >> leJsonV4AttributeMapping [

	^ super leJsonV4AttributeMapping
		add: (#subjectModelReference -> #subjectModelReference);
		yourself
]

{ #category : #accessing }
DbLeObjectPageType class >> leJsonV4Name [

	^ 'dbObjectPage'
]

{ #category : #accessing }
DbLeObjectPageType class >> modelReferenceBuilderMap [

	^ ModelReferenceBuilderMap ifNil: [ ModelReferenceBuilderMap := Dictionary new ]
]

{ #category : #accessing }
DbLeObjectPageType class >> modelReferenceBuilderMap: anObject [

	^ ModelReferenceBuilderMap := anObject
]

{ #category : #accessing }
DbLeObjectPageType class >> modelReferenceForClass: aClass [
	^ self modelReferenceBuilderMap 
		at: aClass
		ifAbsent: [ 
			aClass superclass
				ifNotNil: [ :supr | self modelReferenceForClass: supr ]
				ifNil: [ self error: 'no builder for ', aClass name ] ]
]

{ #category : #accessing }
DbLeObjectPageType class >> modelReferenceForClass: aClass builder: aValuable [
	^ self modelReferenceBuilderMap at: aClass put: aValuable
]

{ #category : #'instance creation' }
DbLeObjectPageType class >> subjectModel: anObject page: aLePage [
	| referenceBuilder reference |
	referenceBuilder := self modelReferenceForClass: anObject class.
	reference := referenceBuilder value
		uid: anObject ensureUUID;
		yourself.
	^ self new
		subjectModelReference: reference;
		page: aLePage;
		yourself.
]

{ #category : #comparing }
DbLeObjectPageType >> = anObject [
	"Answer whether the receiver and anObject represent the same page type."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ self subjectModelID = anObject subjectModelID
]

{ #category : #accessing }
DbLeObjectPageType >> databaseKey [
	"Answer the attribute used to index a page of the receiver's type in the database."

	^ self subjectModelID
]

{ #category : #comparing }
DbLeObjectPageType >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self subjectModelID hash
]

{ #category : #'api - testing' }
DbLeObjectPageType >> isDbObjectPageType [
	^ true
]

{ #category : #accessing }
DbLeObjectPageType >> pageElementClass [
	^ super pageElementClass
]

{ #category : #printing }
DbLeObjectPageType >> printOn: aStream [

	aStream
		<< 'DbObject Page: ';
		<< (self subjectModel ifNotNil: #printString ifNil: [ '<none>' ])
]

{ #category : #accessing }
DbLeObjectPageType >> subjectModel [
	self subjectModelReference ifNil: [ ^ nil ].
	^ self subjectModelReference object
]

{ #category : #accessing }
DbLeObjectPageType >> subjectModelID [

	^ self subjectModelReference ifNotNil: [ :ref | ref uid ]
]

{ #category : #accessing }
DbLeObjectPageType >> subjectModelReference [

	^ subjectModelReference
]

{ #category : #accessing }
DbLeObjectPageType >> subjectModelReference: anMAObjectUIDReference [

	subjectModelReference := anMAObjectUIDReference
]

{ #category : #accessing }
DbLeObjectPageType >> title [

	^ self subjectModel 
		ifNotNil: [ :sub | sub lepiterPageTitle ]
		ifNil: [ 'DbObject Page' ]
]
