Class {
	#name : #BaselineOfDynabook,
	#superclass : #BaselineOf,
	#category : #BaselineOfDynabook
}

{ #category : #configuration }
BaselineOfDynabook class >> dataFolder [
	^ FileLocator dynabookData / 'Dynabook'
]

{ #category : #baseline }
BaselineOfDynabook >> baseline: spec [
  <baseline>

	spec for: #'common' do: [
		spec
			baseline: 'ComputerWorld' with: [
				spec repository: 'github://seandenigris/Computer-World' ];
			baseline: 'SimplePersistence' with: [
				spec repository: 'github://seandenigris/Simple-Persistence' ];
			baseline: 'SmallWorld' with: [
				spec repository: 'github://seandenigris/SmallWorld' ];
			baseline: 'TheProjectProject' with: [
				spec repository: 'gitlab://seandenigris/The-Project-Project' ] ].
	
	spec for: #GToolkit do: [ ]
]

{ #category : #accessing }
BaselineOfDynabook >> customProjectAttributes [
	^ self isGTImage
			ifFalse: [ #() ]
			ifTrue: [ #(GToolkit) ]
]

{ #category : #testing }
BaselineOfDynabook >> isGTImage [
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'GToolkit-' ]
]
