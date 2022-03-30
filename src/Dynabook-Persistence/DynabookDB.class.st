Class {
	#name : #DynabookDB,
	#superclass : #SpFileDatabase,
	#category : 'Dynabook-Persistence'
}

{ #category : #accessing }
DynabookDB class >> backupDirectoryParent [
	
	^ FileLocator dynabookData / 'Dynabook'
]

{ #category : #'loading/saving' }
DynabookDB class >> schema [

	| result |
	result := OrderedCollection new.
	result
		add: BabySignLanguageDB;
		add: BroadcastifyDB;
		add: ComputerWorldDB.
	(Smalltalk globals hasClassNamed: #DynaChefDB)
		ifTrue: [ result add: #DynaChefDB asClass ].
	^ result
		add: FlashcardsStDB;
		add: IdeasDB;
		add: LivingLibraryDB;
		add: SmallWorldDB;
		add: TheProjectProjectDB;
		add: UkuleleDB;
		add: VirtualStashDB;
		yourself
]
