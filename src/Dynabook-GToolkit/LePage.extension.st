Extension { #name : #LePage }

{ #category : #'*Dynabook-GToolkit' }
LePage class >> dbObject: anObject [
	| result type |
	result := self new.
	type := DbLeObjectPageType subjectModel: anObject page: result.
	^ result
		type: type;
		yourself
]
