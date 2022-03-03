Extension { #name : #MATPropertyOwner }

{ #category : #'*Dynabook-GToolkit' }
MATPropertyOwner >> ensureLepiterPage [

	self lepiterPageID ifNil: [ 
		| result |
		result := LeDatabasesRegistry defaultPrimaryDatabase addPage: self newLepiterPage.
		self lepiterPageID: result uid.
		^ result ].

	LeDatabasesRegistry defaultPrimaryDatabase pageWithID: self lepiterPageID ifPresent: [ :s | ^ s ] ifAbsent: [ ].
	
	"Should never get here during normal use, but useful for e.g. testing"
	LeDatabase allSubInstances do: [ :db |
		db pageWithID: self lepiterPageID ifPresent: [  :s | ^ s ] ifAbsent: [ ]  ].
		
	^ nil
]

{ #category : #'*Dynabook-GToolkit' }
MATPropertyOwner >> lepiterPageID [
	^ self propertyAt: #lepiterPageID ifAbsent: [ ^ nil ]
]

{ #category : #'*Dynabook-GToolkit' }
MATPropertyOwner >> lepiterPageID: aUID [
	^ self propertyAt: #lepiterPageID put: aUID
]

{ #category : #'*Dynabook-GToolkit' }
MATPropertyOwner >> newLepiterPage [
	^ LePage dbObject: self
]
