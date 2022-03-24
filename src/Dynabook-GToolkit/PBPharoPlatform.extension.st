Extension { #name : #PBPharoPlatform }

{ #category : #'*Dynabook-GToolkit' }
PBPharoPlatform >> copyApplicationTo: appFolder application: application [
	"Copy the PythonBridge runtime environment to the specified folder"
	| srcDir cpCommand proc srcFilename dstFilename error defaultPipfile projectPipfiles |

	srcDir := self runtimeSourceDirectoryFor: application.
	srcDir resolve = appFolder resolve ifTrue: [ ^ self ].

	"Copy the runtime directory"
	srcFilename := srcDir resolve fullName copyReplaceAll: '"' with: '\"'.
	dstFilename := appFolder resolve fullName copyReplaceAll: '"' with: '\"'.
	cpCommand := String streamContents: [ :stream |
		stream
			<< 'cp -a "';
			<< srcFilename;
			<< '" "';
			<< dstFilename;
			<< '"' ].
	proc := GtSubprocessWithInMemoryOutput new 
		shellCommand: cpCommand;
		runAndWait.
	proc isSuccess ifFalse:
		[ error := PBPythonProcessError new
			messageText: 'Unable to install PythonBridge runtime';
			application: application;
			process: proc.
		error signal ].
	
	self flag: 'From here to the end is a hack added by the Dynabook project'.
	defaultPipfile := (appFolder / 'Pipfile') ensureDelete ensureCreateFile asRlResource
		mergeIn: (FileLocator imageDirectory / 'gt-extra/feenkcom/PythonBridge/PythonBridgeRuntime/Pipfile') asRlResource;
		yourself.
		
	projectPipfiles := (FileLocator localDirectory / 'iceberg') allFiles select: [ :e | e basename = 'Pipfile' ]. 
	projectPipfiles do: [ :ppf | defaultPipfile mergeIn: ppf asRlResource ].

	defaultPipfile write.
]
