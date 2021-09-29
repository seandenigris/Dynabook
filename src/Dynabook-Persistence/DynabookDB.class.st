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

	| result |
	result := OrderedCollection with: ComputerWorldDB.
	(Smalltalk globals hasClassNamed: #DynaChefDB)
		ifTrue: [ result add: #DynaChefDB asClass ].
	^ result
		add: IdeasDB;
		add: SmallWorldDB;
		add: TheProjectProjectDB;
		add: UkuleleDB;
		add: VirtualStashDB;
		yourself
]
