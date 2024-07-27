"
Alan Kay's Dynabook [2] dream is often explored from the perspective of creating such a system. But what would/could a Dynabook look like after actually being lived in for a long period. What sorts of tools and services would appear? How would they interact?

You can start by exploring my core components (start with the class comments of the BaslineOfXyzs):
```smalltalk
BaselineOfDynabook coreBaselines
```
## What is a Dynabook?
Buckle your seatbelt. Here's an excerpt from my longer blog post [""Programmers: You Probably Don’t Know What a Computer Is""](http://seandenigris.com/blog/?p=1092), about Smalltalk, the environment powering this system:

You may not realize it, but you have opened a portal to some of the greatest minds in the history of our industry. In the beginning, for many of our heroes — Doug Engelbart, Alan Kay, Seymour Papert — computing was about the possibility of evolving the general level of human thought for the benefit of mankind. Effective critical thinking is vital to modern life e.g. the proper functioning of democratic governments. Yet traditional media have been ineffective at improving our thought on a large scale. Today, we’re mostly glorified “caveman with briefcases”, reacting to the same human universals as our distant ancestors — Fantasies, Stories, Superstition, Religion/Magic, Vendetta.

So what does this have to do with computing?!

I’m glad you asked :) In 1972, Alan Kay envisioned a “dynamic medium for creative thought” which he called a Dynabook [1]. It was an answer to the problem described above — a computer to support and guide minds to the level required to overcome our uglier instincts, and replace them with our highest ideas, like Equal Rights, Democracy, Slow Deep Thinking, Legal System over Vendetta, Theory of Harmony — ideas which do not take seed on their own, but must be actively nurtured.

So what does this have to do with programming?!

I’m glad you asked that, too :) Smalltalk is interim [2] Dynabook software! You have in your hands, not a programming language, but a live, dynamic, turtles-all-the-way-down environment designed to provide “support for the creative spirit in everyone”.

More practically, Smalltalk is a programming tool that allows productivity unimaginable in most systems. And, if you put in enough time and effort to actually think in it, it will help you program better in any language you use. But, I think it would be a great waste if you left Smalltalk “a better programmer”, when the questions before you are:

- What really matters?
- How can computers fulfill on that?
- How can I, as a programmer, contribute to that?

From PARC's 1977 paper [1]:
The Learning Research Group... is concerned with all aspects of the communication and manipulation of knowledge. We design, build, and use dynamic media which can be used by human beings of all ages. Several years ago, we crystallized our dreams into a design idea for a personal dynamic medium the size of a notebook (the Dynabook) which could be owned by everyone and could have the power to handle virtually all of its owner's information-related needs. Towards this goal we have designed and built a communications system: the Smalltalk language, implemented on small computers we refer to as ""interim Dynabooks."" We are exploring the use of this system as a programming and problem solving tool; as an interactive memory for the storage and manipulation of data; as a text editor; and as a medium for expression through drawing, painting, animating pictures, and composing and generating music.
# Components
The following projects are the core components:

- [FIT Protocol](https://github.com/seandenigris/FIT-Protocol-4-GToolkit) - Read, analyze and visualize Garmin's Flexible and Interoperable Data Transfer (FIT) protocol](https://developer.garmin.com/fit/overview/). Runs on [the amazing GToolkit platform](https://gtoolkit.com)
- [Bookmark Magic](https://github.com/SeanDeNigris/Bookmark-Magic) - URL bookmarking in a live, dynamic world.
- [Ukulele](https://github.com/seandenigris/Ukulele-Pharo) - TLDR: A companion in learning and playing, in a live system of supporting objects e.g. media library, bookmarking, contact management (e.g. for teachers and peers). Currently manages things related to playing e.g. songs, lessons, tabs.
- [The Project Project](https://github.com/SeanDeNigris/The-Project-Project) - Project Management unleashed from an ""application"" stovepipe, running on GToolkit (Smalltalk)
- [Tracking Numbers](https://github.com/seandenigris/Tracking-ST) - Tracking numbers, unleashed from an application stovepipe, on GToolkit (Smalltalk)
- [Flashcards St](https://github.com/seandenigris/Flashcards-St) - Unleash flashcards from simple text on ""front"" and ""back"". Any object can be `material` for multiple cards (or card types)
- [Ideas](https://github.com/SeanDeNigris/ideas) - KMS mind-map interface powered by @feenkcom's #GToolkit. Features `concepts` (like dictionary terms), `compound concepts` - concepts made up of other concepts, `ideas` (like dictionary definitions) connect concepts in an interesting/value-added way
- [Superuser](https://github.com/seandenigris/Superuser) - An attemple to make Unix commands more sane.
- [Nature](https://github.com/seandenigris/Nature) - A naturalist's companion, focused on identifying and logging plant and mushrooms.
- [Broadcastify](https://github.com/seandenigris/Broadcastify-Alive) - [Broadcastify](https://www.broadcastify.com) OO client model for Glamorous Toolkit
- [Small World](https://github.com/seandenigris/SmallWorld) - Project catalog akin to Squeak Map. The idea is that, with one click, you can load your favorite projects in the best way for that particular image (dialect, version, etc.) in that context (development, deployment, etc.). Right now I've just been using it myself for a few years.
- [Computer World](https://github.com/seandenigris/Computer-World) - Bring to life computing objects like applications, servers, etc.
- [My People](https://github.com/SeanDeNigris/My-People) - Address Book service, minus the usual application stovepipe, running on GT (Smalltalk)
- [Quote Me](https://github.com/SeanDeNigris/Quote-Me) - Quotation DB freed from an ""application"" stovepipe, in GToolkit (Smalltalk)
- [Resources Live](https://github.com/seandenigris/Resources-Live) - Free users to communicate with *objects* instead of managing *files*. Files conflate *what* a thing is with *where* it is. We take care of the boring location part for you. So you can ""play an mp3"" instead of ""opening an mp3 file in a player app"". Nicer, no?
- [Baby Sign Language](https://github.com/SeanDeNigris/Baby-Sign-Language)
- [Virtual Stash](https://github.com/SeanDeNigris/Virtual-Stash) - Picture GnuCash, minus the application stovepipe, running on GToolkit (Smalltalk)
- [Living Library](https://github.com/SeanDeNigris/Living-Library) - A reimagination of what a library can be once freed from a being a physical building housing (only) physical items
# Icon Attribution
Our GTooklit Home Section uses the following icons from [Noun Project](https://thenounproject.com/browse/icons/term/inventory/):
- Financial Advice Book by Juicy Fish
- Database by Larea
- Library Book by Kmg Design
- Project by WEBTECHOPS LLP
- File by Gilang Kampus
- Bridge by Wan Ikhsan
- inventory by Eucalyp
- Computer Network by Vectors Market
## References
1. [""Personal Dynamic Media""](https://www.computer.org/csdl/magazine/co/1977/03/01646405/13rRUxZRbs8)
2. [Smalltalk: Design Principles Behind Smalltalk](http://www.cs.virginia.edu/~evans/cs655/readings/smalltalk.html)
"
Class {
	#name : #BaselineOfDynabook,
	#superclass : #BaselineOf,
	#category : #BaselineOfDynabook
}

{ #category : #accessing }
BaselineOfDynabook class >> componentSectionString [

	| componentList template |
	
	template := '# Components	
The following projects are the core components:
{componentList}'.

	componentList := String streamContents: [ :str |
		self coreProjects 
			do: [ :p | 
				str << '- [' << p name << '](' << p repository url asString << ')'.
				p description ifNotEmpty: [ :d | str << ' - ' << d ] ]
			separatedBy: [ str lf ] ].
			
	^ template format: {
		#componentList -> componentList } asDictionary.
]

{ #category : #accessing }
BaselineOfDynabook class >> coreBaselines [
	| classesForVersion projects |
	classesForVersion := [ :v |
	v projects 
		select: [ :e | Smalltalk hasClassNamed: e className ]
		thenCollect: [ :e | e className asClass ] ].
	projects := Set new.
	self project version 
		withDeep: [ :each | each projects collect: #version ]
		relationDo: [ :a :b | 
	projects 
		addAll: (classesForVersion value: a);
		addAll: (classesForVersion value: b) ].
	^ projects select: #isDynabook
]

{ #category : #accessing }
BaselineOfDynabook class >> coreProjects [
	^ self coreBaselines collect: [ :bl | SmallProjectRegistry uniqueInstance detectForBaseline: bl ]
]

{ #category : #configuration }
BaselineOfDynabook class >> dataFolder [
	^ FileLocator dynabookData / 'Dynabook'
]

{ #category : #utilites }
BaselineOfDynabook class >> fuelPreLoad [
	"Needed for Fuel 5.1.0 to load cleanly (at least on GT)"

	| fuelPackages |
	fuelPackages := RPackage organizer packages
			select: [ :e | e name beginsWith: 'Fuel-' ].
	fuelPackages do: #removeFromSystem
]

{ #category : #utilites }
BaselineOfDynabook class >> lepiterReloadLogicalDBFromPropertiesFile: aFileReference [

	| props |
	props := LeLogicalDatabaseProperties 
		forPropertiesFile: aFileReference
		ifAbsentUse: [].
		
	LeDatabasesRegistry defaultLogicalDatabase
		properties: props;
		reload.
]

{ #category : #utilites }
BaselineOfDynabook class >> pipEnvPostLoad [
	
	PBApplication cwInstallAllModules.
	LlPlaywright install.
]

{ #category : #baseline }
BaselineOfDynabook >> baseline: spec [
  <baseline>

	spec for: #'common' do: [
		spec
			baseline: 'BabySignLanguage' with: [
				spec repository: 'github://seandenigris/Baby-Sign-Language' ];
			baseline: 'Broadcastify' with: [
				spec repository: 'github://seandenigris/Broadcastify-Alive' ];
			baseline: 'ClickUp' with: [
				spec repository: 'github://seandenigris/ClickUp-St' ];
			baseline: 'ComputerWorld' with: [
				spec repository: 'github://seandenigris/Computer-World' ];
			baseline: 'DynabookFoundation' with: [
				spec repository: 'github://seandenigris/Dynabook-Foundation' ];
			baseline: 'FITProtocol' with: [
				spec repository: 'github://seandenigris/FITProtocol4GToolkit' ];
			baseline: 'FlashcardsSt' with: [
				spec repository: 'github://seandenigris/Flashcards' ];
			baseline: 'Ideas' with: [
 				spec repository: 'github://seandenigris/ideas' ];
			baseline: 'LivingLibrary' with: [
				spec repository: 'github://seandenigris/Living-Library' ];
			baseline: 'MSAL' with: [
				spec repository: 'github://seandenigris/MSAL-Smalltalk' ];
			baseline: 'MyPeople' with: [
				spec repository: 'github://SeanDeNigris/My-People' ];
			baseline: 'Nature' with: [
				spec repository: 'github://seandenigris/Nature' ];
			baseline: 'PharoEnhancements' with: [
				spec repository: 'github://seandenigris/Pharo-Enhancements' ];
			baseline: 'ResourcesLive' with: [
				spec repository: 'github://seandenigris/Resources-Live' ];
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
		spec
			postLoadDoIt: #postLoad;
			package: 'Dynabook-Core' with: [ spec requires: #('ComputerWorld' 'DynabookFoundation' 'LivingLibrary' 'MSAL' 'MyPeople' 'TheProjectProject' 'ResourcesLive') ];
			package: 'Dynabook-Persistence' with: [ spec requires: #('Dynabook-Core' 'SimplePersistence') ] ].
	
	spec for: #GToolkit do: [ 
		spec
			baseline: 'ObjectiveLepiter' with: [
				spec repository: 'github://seandenigris/Objective-Lepiter' ].
		spec 
			postLoadDoIt: #gtPostLoad;
			package: 'Dynabook-GToolkit' with: [ spec requires: #(ObjectiveLepiter PharoEnhancements) ] ]
]

{ #category : #accessing }
BaselineOfDynabook >> customProjectAttributes [
	^ self isGTImage
			ifFalse: [ #(notGToolkit) ]
			ifTrue: [ #(GToolkit) ]
]

{ #category : #accessing }
BaselineOfDynabook >> gtPostLoad [
	
	self postLoad.
	
	self olReferenceBuilderMap keysAndValuesDo: [ :aClass :aBlock |
		OlObjectPageType 
			modelReferenceForClass: aClass 
			builder: aBlock ].
					
	QuLeSources providers: { 

		DbObjectUIDReference new
			sourceClass: LlLibrary;
			yourself.
			
		DbObjectUIDReference new
			sourceClass: LlWorkplace;
			yourself.
			
		PpEventUIDReference new
			sourceClass: PpEventLog;
			yourself.
			
		QuSnippetSource new.
	} asOrderedCollection.
]

{ #category : #testing }
BaselineOfDynabook >> isGTImage [
	
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'Lepiter-' ].
	"Implementation note: used to check for GToolkit prefix, but P7 has a GToolkit-Examples package. Lepiter, OTOH, could only be loaded in a GT image"
]

{ #category : #accessing }
BaselineOfDynabook >> olReferenceBuilderMap [
	
		^ Dictionary new
			at: CwSoftware put: [ 
				DbObjectUIDReference new
					sourceClass: CwSoftwareCatalog;
					yourself ];
			at: LlAuthoredWork put: [ 
				DbObjectUIDReference new
					sourceClass: LlLibrary;
					yourself ];
			at: LlLibraryItem put: [ 
				DbObjectUIDReference new
					sourceClass: LlLibrary;
					collectionGetter: #copies;
					yourself ];
			at: LlWorkplaceComment put: [ 
				DbObjectUIDReference new
					sourceClass: LlWorkplace;
					yourself ];
			at: MpRelatableEntity put: [ 
				DbObjectUIDReference new
					sourceClass: MpAddressBook;
					yourself ];
			at: PpEvent put: [ 
				PpEventUIDReference new
					sourceClass: PpEventLog;
					yourself ];
			at: PpInventoryItem put: [ 
				DbObjectUIDReference new
					sourceClass: PpInventory;
					yourself ];
			at: PpLocation put: [ 
				DbObjectUIDReference new
					sourceClass: PpLocationList;
					yourself ];
			at: PpValue put: [ 
				DbObjectUIDReference new
					sourceClass: PpProjectList;
					yourself ];
			at: RlResource put: [ 
				DbObjectUIDReference new
					sourceClass: RlResourceLibrary;
					yourself ];
			at: SmallProject put: [ 
				DbObjectUIDReference new
					sourceClass: SmallProjectRegistry;
					yourself ];
			at: VsPrice put: [ 
				DbObjectUIDReference new
					sourceClass: VsPriceList;
					yourself ];
			yourself
]

{ #category : #accessing }
BaselineOfDynabook >> postLoad [
	
	self olReferenceBuilderMap do: [ :aBlock |
		DbSoup uniqueInstance sources add: aBlock value ].
]
