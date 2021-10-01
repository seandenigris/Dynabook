Class {
	#name : 'BaselineOfDynabook',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfDynabook'
}

{ #category : 'configuration' }
BaselineOfDynabook class >> dataFolder [
	^ FileLocator dynabookData / 'Dynabook'
]

{ #category : 'baseline' }
BaselineOfDynabook >> baseline: spec [
  <baseline>

	spec for: #'common' do: [
		spec
			baseline: 'ComputerWorld' with: [
				spec repository: 'github://seandenigris/Computer-World' ];
			baseline: 'DynaChef' with: [
				spec repository: 'github://seandenigris/DynaChef' ];
			baseline: 'Ideas' with: [
 				spec repository: 'github://seandenigris/ideas' ];
			baseline: 'Mushrooms' with: [
				spec repository: 'github://seandenigris/Mushrooms' ];
			baseline: 'SimplePersistence' with: [
				spec repository: 'github://seandenigris/Simple-Persistence' ];
			baseline: 'SmallWorld' with: [
				spec repository: 'github://seandenigris/SmallWorld' ];
			baseline: 'TheProjectProject' with: [
				spec repository: 'github://seandenigris/The-Project-Project' ];
			baseline: 'Ukulele' with: [
				spec repository: 'github://seandenigris/Ukulele-Pharo' ];
			baseline: 'VirtualStash' with: [
				spec repository: 'github://seandenigris/Virtual-Stash' ].
		spec package: 'Dynabook-Persistence' with: [ spec requires: #('SimplePersistence') ] ].
	
	spec for: #GToolkit do: [
		spec postLoadDoIt: #gtPostLoad.
		spec package: 'Dynabook-GToolkit' ]
]

{ #category : 'accessing' }
BaselineOfDynabook >> customProjectAttributes [
	^ self isGTImage
			ifFalse: [ #(notGToolkit) ]
			ifTrue: [ #(GToolkit) ]
]

{ #category : 'accessing' }
BaselineOfDynabook >> gtPostLoad [

	"We've incorporated the relevant parts into our home section"
	(GtHome>>#virtualStashSection) removeFromSystem
]

{ #category : 'testing' }
BaselineOfDynabook >> isGTImage [
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'GToolkit-' ]
]
