Class {
	#name : #DynabookDB,
	#superclass : #SpFileDatabase,
	#category : #'Dynabook-Persistence'
}

{ #category : #accessing }
DynabookDB class >> backupDirectoryParent [
	
	^ FileLocator dynabookData / 'Dynabook'
]

{ #category : #accessing }
DynabookDB class >> metadata [

	^ { 
		#gitCommit -> self package peIceRepository workingCopy referenceCommit id
	} asDictionary
]

{ #category : #'loading/saving' }
DynabookDB class >> schema [

	^ {
		BabySignLanguageDB.
		BroadcastifyDB.
		ComputerWorldDB.
		DbMsalApp.
		FlashcardsStDB.
		IdeasDB.
		LivingLibraryDB.
		SmallWorldDB.
		TheProjectProjectDB.
		UkuleleDB.
		VirtualStashDB.
	}
]
