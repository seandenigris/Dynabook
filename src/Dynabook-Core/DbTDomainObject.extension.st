Extension { #name : #DbTDomainObject }

{ #category : #'*Dynabook-Core' }
DbTDomainObject >> dbUIDReference [
	^ DbObjectUIDReference new
		uid: self ensureUUID;
		yourself
]
