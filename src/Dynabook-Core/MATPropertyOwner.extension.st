Extension { #name : #MATPropertyOwner }

{ #category : #'*Dynabook-Core' }
MATPropertyOwner >> dbUIDReference [
	^ DbObjectUIDReference new
		uid: self ensureUUID;
		yourself
]
