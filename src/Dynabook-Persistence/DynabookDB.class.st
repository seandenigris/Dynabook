Class {
	#name : 'DynabookDB',
	#superclass : 'SpFileDatabase',
	#category : 'Dynabook-Persistence'
}

{ #category : 'accessing' }
DynabookDB class >> backupDirectoryParent [
	
	^ FileLocator dynabookData / 'Dynabook'
]

{ #category : 'loading/saving' }
DynabookDB class >> schema [

	^ { 
		ComputerWorldDB.
		IdeasDB.
		SmallWorldDB.
		TheProjectProjectDB.
		VirtualStashDB
	}.
]
