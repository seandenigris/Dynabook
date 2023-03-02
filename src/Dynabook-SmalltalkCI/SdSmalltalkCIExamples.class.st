Class {
	#name : #SdSmalltalkCIExamples,
	#superclass : #Object,
	#category : #'Dynabook-SmalltalkCI'
}

{ #category : #accessing }
SdSmalltalkCIExamples class >> architectureARM [
	<gtExample>
	
	^ self
		given: [ :fcn | 
			fcn 
				functionName: 'gtoolkit::architecture';
				stubIsARM: true ]
		whenCalledWithArguments: { }
		then: [ :fcn | 
			fcn output trimmed should equal: 'aarch64' ]
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> architectureIntel [
	<gtExample>
	
	^ self
		given: [ :fcn | 
			fcn 
				functionName: 'gtoolkit::architecture';
				stubIsARM: false ]
		whenCalledWithArguments: { }
		then: [ :fcn | 
			fcn output trimmed should equal: 'x86_64' ]
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> archiveFilenameLinuxARM [
	<gtExample>
	
	^ self
		given: [ :fcn | 
			fcn 
				functionName: 'gtoolkit::archive_url';
				stubRelease: 'v0.8.2574';
				stubPlatform: 'linux' isARM: true ]
		whenCalledWithArguments: { }
		then: [ :fcn | 
			fcn output trimmed should equal: 'https://github.com/feenkcom/gtoolkit/releases/download/v0.8.2574/GlamorousToolkit-Linux-aarch64-v0.8.2574.zip' ]
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> archiveFilenameLinuxIntel [
	<gtExample>
	
	^ self
		given: [ :fcn | 
			fcn 
				functionName: 'gtoolkit::archive_url';
				stubRelease: 'v0.8.2574';
				stubPlatform: 'linux' isARM: false ]
		whenCalledWithArguments: { }
		then: [ :fcn | 
			fcn output trimmed should equal: 'https://github.com/feenkcom/gtoolkit/releases/download/v0.8.2574/GlamorousToolkit-Linux-x86_64-v0.8.2574.zip' ]
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> archiveFilenameMacARM [
	<gtExample>
	
	^ self
		given: [ :fcn | 
			fcn 
				functionName: 'gtoolkit::archive_url';
				stubRelease: 'v0.8.2574';
				stubPlatform: 'mac' isARM: true ]
		whenCalledWithArguments: { }
		then: [ :fcn | 
			fcn output trimmed should equal: 'https://github.com/feenkcom/gtoolkit/releases/download/v0.8.2574/GlamorousToolkit-MacOS-aarch64-v0.8.2574.zip' ]
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> archiveFilenameMacIntel [
	<gtExample>
	
	^ self
		given: [ :fcn | 
			fcn 
				functionName: 'gtoolkit::archive_url';
				stubRelease: 'v0.8.2574';
				stubPlatform: 'mac' isARM: false ]
		whenCalledWithArguments: { }
		then: [ :fcn | 
			fcn output trimmed should equal: 'https://github.com/feenkcom/gtoolkit/releases/download/v0.8.2574/GlamorousToolkit-MacOS-x86_64-v0.8.2574.zip' ]
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> archiveFilenameWindowsARMUnsupported [
	<gtExample>
	
	^ self
		given: [ :fcn | 
			fcn 
				functionName: 'gtoolkit::archive_url';
				stubPlatform: 'windows' isARM: true ]
		whenCalledWithArguments: { }
		then: [ :fcn | 
			"should error" ]
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> archiveFilenameWindowsIntel [
	<gtExample>
	
	^ self
		given: [ :fcn | 
			fcn 
				functionName: 'gtoolkit::archive_url';
				stubRelease: 'v0.8.2574';
				stubPlatform: 'windows' isARM: false ]
		whenCalledWithArguments: { }
		then: [ :fcn | 
			fcn output trimmed should equal: 'https://github.com/feenkcom/gtoolkit/releases/download/v0.8.2574/GlamorousToolkit-Windows-x86_64-v0.8.2574.zip' ]
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> getReleaseVersion [
	<gtExample>
	
	^ self
		given: [ :fcn | fcn functionName: 'gtoolkit::latest_release_version' ]
		whenCalledWithArguments: { }
		then: [ :fcn | 
			fcn output trimmed should beginWith: 'v0.8.' ]
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> given: givenBlock in: file whenCalledWithArguments: aCollection then: thenBlock [

	| call |
	call := SdSmalltalkCICall new
		script: file;
		arguments: aCollection;
		yourself.
		
	givenBlock value: call.
	
	thenBlock value: call.
		
	^ call
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> given: givenBlock whenCalledWithArguments: aCollection then: thenBlock [
	self
		given: givenBlock
		in: self mainScript
		whenCalledWithArguments: aCollection
		then: thenBlock
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> gtoolkitLatestReleaseJSON [

	^ ZnClient new
		get: 'https://api.github.com/repos/feenkcom/gtoolkit/releases/latest';
		yourself
	
	"Adapted from https://fabianlee.org/2021/02/16/bash-determining-latest-github-release-tag-and-version/"
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> hardwarePlatform [
	<gtExample>
	
	^ self
		given: [ :fcn | fcn functionName: 'hardware_platform' ]
		whenCalledWithArguments: { }
		then: [ :fcn | 
			fcn output trimmed should equal: 'arm64' ]
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> mainScript [

	^ FileLocator dynabookData parent / 'Repositories'/'smalltalkCI'/'gtoolkit'/'run.sh'
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> vmPathLinux [
	<gtExample>
	
	^ self
		given: [ :fcn | 
			fcn 
				functionName: 'gtoolkit::vm_path';
				stubPlatform: 'linux' isARM: true ]
		whenCalledWithArguments: { }
		then: [ :fcn | 
			fcn output trimmed should equal: 'bin/GlamorousToolkit-cli' ]
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> vmPathMac [
	<gtExample>
	
	^ self
		given: [ :fcn | 
			fcn 
				functionName: 'gtoolkit::vm_path';
				stubPlatform: 'mac' isARM: true ]
		whenCalledWithArguments: { }
		then: [ :fcn | 
			fcn output trimmed should equal: 'GlamorousToolkit.app/Contents/MacOS/GlamorousToolkit-cli' ]
]

{ #category : #accessing }
SdSmalltalkCIExamples class >> vmPathWindows [
	<gtExample>
	
	^ self
		given: [ :fcn | 
			fcn 
				functionName: 'gtoolkit::vm_path';
				stubPlatform: 'windows' isARM: true ]
		whenCalledWithArguments: { }
		then: [ :fcn | 
			fcn output trimmed should equal: 'bin/GlamorousToolkit-cli.exe' ]
]
