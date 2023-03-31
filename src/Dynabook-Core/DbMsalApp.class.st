Class {
	#name : #DbMsalApp,
	#superclass : #MsalApplication,
	#classVars : [
		'UniqueInstance'
	],
	#category : #'Dynabook-Core-MSAuthLibrary'
}

{ #category : #initialization }
DbMsalApp class >> initialize [
	
	SessionManager default 
		registerUserClassNamed: self name
]

{ #category : #resetting }
DbMsalApp class >> reset [

	self uniqueInstance reset
]

{ #category : #persistence }
DbMsalApp class >> restoreFrom: anObject [

	UniqueInstance := anObject
]

{ #category : #'startup/shutdown' }
DbMsalApp class >> shutDown: isImageQuitting [

	isImageQuitting ifTrue: [ self uniqueInstance logOut ]
]

{ #category : #persistence }
DbMsalApp class >> spData [

	^ UniqueInstance
]

{ #category : #'instance creation' }
DbMsalApp class >> uniqueInstance [

	^ UniqueInstance ifNil: [ UniqueInstance := self new ]
]

{ #category : #accessing }
DbMsalApp class >> uniqueInstance: anObject [

	UniqueInstance := anObject
]

{ #category : #accessing }
DbMsalApp >> scopes [
	^ { 'Notes.ReadWrite' }
]
