Extension { #name : #MsalOneNotePage }

{ #category : #'*Dynabook-Core' }
MsalOneNotePage >> dbImportMeeting [
	| event |
	event := self asPpEvent
		import;
		yourself.
		
	"How to do this via MS Graph?
	self moveToSectionNamed: 'Meeting Notes (Dynabook)'."
	
	^ event
]
