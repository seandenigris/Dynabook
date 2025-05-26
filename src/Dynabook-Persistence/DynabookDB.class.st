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
DynabookDB class >> dataVersion [

	^ 2
]

{ #category : #accessing }
DynabookDB class >> metadata [

	^ super metadata
		at: #gitCommit put: self package peIceRepository workingCopy referenceCommit id;
		yourself
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
		JokesDB.
		LivingLibraryDB.
		SmallWorldDB.
		TheProjectProjectDB.
		UkuleleDB.
		VirtualStashDB.
	}
]

{ #category : #migrations }
DynabookDB class >> version2Migration [
	<dataMigration>

	| copyMaterials |
	copyMaterials := [ :inst |
		inst supportMaterials: (inst instVarNamed: #supportMaterials) ].

	^ SpDataMigration new
		dataVersion: 2;
		preMaterialize: [ 
			PpEvent addInstVarNamed: #supportMaterials.
			PpValue addInstVarNamed: #supportMaterials ];
		postMaterialize: [
			PpEvent allSubInstances do: copyMaterials.
			PpValue allSubInstances do: copyMaterials.
			PpEvent removeInstVarNamed: #supportMaterials.
			PpValue removeInstVarNamed: #supportMaterials ]
]
