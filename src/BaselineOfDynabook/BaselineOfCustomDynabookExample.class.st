Class {
	#name : #BaselineOfCustomDynabookExample,
	#superclass : #BaselineOf,
	#category : #BaselineOfDynabook
}

{ #category : #accessing }
BaselineOfCustomDynabookExample class >> dataFolder [
	^ FileLocator dynabookData / 'Dynabook'
]

{ #category : #initialization }
BaselineOfCustomDynabookExample class >> pipEnvPostLoad [
	| pyBridgeFolder |
	pyBridgeFolder := FileLocator imageDirectory / 'PythonBridgeRuntime'.
	
	SuLn new
		original: '/opt/homebrew/lib/libxyz.dylib' asFileReference;
		link: pyBridgeFolder / 'libxyz.dylib';
		run.
		
	BaselineOfDynabook pipEnvPostLoad
]

{ #category : #setup }
BaselineOfCustomDynabookExample class >> setUp [

	| homebrewBinaryFolder homebrewInstalled msalAppIdFile |
	DbGtHomeUtilitiesSection dataDB: #MyDynabookDB asClass.
	
	PpInactiveStatus label: 'Never Doing'.
	PpInboxStatus label: 'Captured'.
	
	homebrewBinaryFolder := '/opt/homebrew/bin' asFileReference.
	homebrewInstalled := { SuFfmpeg. SuImageMagick. SuSocat. Tesseract }.
	homebrewInstalled do: [ :e | e binaryFolder: homebrewBinaryFolder ].
	
	#SuperuserDB asClass restoreLastBackup.
	#MyDynabookDB asClass restoreLastBackup.

	MsalOneNotePage handlers addAll: {
		PpNotePageMoveToPpProject
	}.
	
	PBPharoPipenvProcess pipenvPath: FileLocator home / '.pyenv/shims/pipenv'.
	
	BaselineOfDynabook lepiterReloadLogicalDBFromPropertiesFile: self dataFolder / 'logical-database.properties'.
		
	BlGlutinHostSpace zoomFactor: 1.2.
	
	Transcript clear "workaround for GT issue where long transcript can bog down system".
	
	"MSAL Setup"
	msalAppIdFile := self dataFolder / 'msal-app-id'.
	DbMsalApp id: msalAppIdFile contents.
]

{ #category : #baselines }
BaselineOfCustomDynabookExample >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			baseline: 'Dynabook' with: [
				spec repository: 'github://seandenigris/Dynabook' ];
			baseline: 'Fuel' with: [
				spec
					preLoadDoIt: #fuelPreLoad;
					repository: 'github://theseion/Fuel:5.2.1';
					loads: #Tests "Needed in GT, where tests are already loaded, to replace outdated version and avoid error. This is combined with a warning resolution in the Metacello load script. See https://github.com/theseion/Fuel/issues/257#issuecomment-981098972" ];
			baseline: 'MyAdditionalCoolComponent' with: [
				spec repository: 'github://me/MyAdditionalCoolComponent' ].
				
		spec
			package: 'MyDynabook' with: [ 
				spec requires: #('Fuel' 'MyAdditionalCoolComponent') ] ].
]

{ #category : #accessing }
BaselineOfCustomDynabookExample >> customProjectAttributes [

	^ self isGTImage
		ifTrue: [ #(GToolkit) ]
		ifFalse: [ #(notGToolkit) ].
]

{ #category : #accessing }
BaselineOfCustomDynabookExample >> fuelPreLoad [
	BaselineOfDynabook fuelPreLoad
]

{ #category : #testing }
BaselineOfCustomDynabookExample >> isGTImage [
	
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'Lepiter-' ].
	"Implementation note: used to check for GToolkit prefix, but P7 has a GToolkit-Examples package. Lepiter, OTOH, could only be loaded in a GT image"
]

{ #category : #loading }
BaselineOfCustomDynabookExample >> postLoad [

	self class setUp
]
