Extension { #name : #PBPharoPlatform }

{ #category : #'*Dynabook-GToolkit' }
PBPharoPlatform >> copyApplicationTo: appFolder application: application [
	"Copy the PythonBridge runtime environment to the specified folder"

	| srcDir defaultPipfile projectPipfiles |
	srcDir := self runtimeSourceDirectoryFor: application.
	srcDir resolve = appFolder resolve ifTrue: [ ^ self ].

	srcDir resolve copyAllTo: appFolder resolve.
	
	self flag: 'From here to the end is a hack added by the Dynabook project'.
	defaultPipfile := (appFolder / 'Pipfile') ensureDelete ensureCreateFile asRlResource
		mergeIn: (FileLocator imageDirectory / 'gt-extra/feenkcom/PythonBridge/PythonBridgeRuntime/Pipfile') asRlResource;
		yourself.
		
	projectPipfiles := (FileLocator localDirectory / 'iceberg') allFiles select: [ :e | e basename = 'Pipfile' ]. 
	projectPipfiles do: [ :ppf | defaultPipfile mergeIn: ppf asRlResource ].

	defaultPipfile write.
]
