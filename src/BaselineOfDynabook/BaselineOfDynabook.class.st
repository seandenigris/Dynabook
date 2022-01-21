"
Alan Kay's Dynabook [2] dream is often explored from the perspective of creating such a system. But what would/could a Dynabook look like after actually being lived in for a long period. What sorts of tools and services would appear? How would they interact?

You can start by exploring my core components (start with the class comments of the BaslineOfXyzs):
```smalltalk
BaselineOfDynabook coreBaselines
```

##What is a Dynabook?
Buckle your seatbelt. Here's an excerpt from my longer blog post [""Programmers: You Probably Don’t Know What a Computer Is""](http://seandenigris.com/blog/?p=1092), about Smalltalk, the environment powering this system:

You may not realize it, but you have opened a portal to some of the greatest minds in the history of our industry. In the beginning, for many of our heroes — Doug Engelbart, Alan Kay, Seymour Papert — computing was about the possibility of evolving the general level of human thought for the benefit of mankind. Effective critical thinking is vital to modern life e.g. the proper functioning of democratic governments. Yet traditional media have been ineffective at improving our thought on a large scale. Today, we’re mostly glorified “caveman with briefcases”, reacting to the same human universals as our distant ancestors — Fantasies, Stories, Superstition, Religion/Magic, Vendetta.

So what does this have to do with computing?!

I’m glad you asked :) In 1972, Alan Kay envisioned a “dynamic medium for creative thought” which he called a Dynabook [1]. It was an answer to the problem described above — a computer to support and guide minds to the level required to overcome our uglier instincts, and replace them with our highest ideas, like Equal Rights, Democracy, Slow Deep Thinking, Legal System over Vendetta, Theory of Harmony — ideas which do not take seed on their own, but must be actively nurtured.

So what does this have to do with programming?!

I’m glad you asked that, too :) Smalltalk is interim[2] Dynabook software! You have in your hands, not a programming language, but a live, dynamic, turtles-all-the-way-down environment designed to provide “support for the creative spirit in everyone”.

More practically, Smalltalk is a programming tool that allows productivity unimaginable in most systems. And, if you put in enough time and effort to actually think in it, it will help you program better in any language you use. But, I think it would be a great waste if you left Smalltalk “a better programmer”, when the questions before you are:

- What really matters?
- How can computers fulfill on that?
- How can I, as a programmer, contribute to that?

From PARC's 1977 paper [1]:
The Learning Research Group... is concerned with all aspects of the communication and manipulation of knowledge. We design, build, and use dynamic media which can be used by human beings of all ages. Several years ago, we crystallized our dreams into a design idea for a personal dynamic medium the size of a notebook (the Dynabook) which could be owned by everyone and could have the power to handle virtually all of its owner's information-related needs. Towards this goal we have designed and built a communications system: the Smalltalk language, implemented on small computers we refer to as ""interim Dynabooks."" We are exploring the use of this system as a programming and problem solving tool; as an interactive memory for the storage and manipulation of data; as a text editor; and as a medium for expression through drawing, painting, animating pictures, and composing and generating music.

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

{ #category : #accessing }
BaselineOfDynabook class >> readme [

	| componentList template project |
	
	template := '{basicReadme}

# Components	
The following projects are my core components:
{componentList}'.

	componentList := String streamContents: [ :str |
		self coreProjects 
			do: [ :p | 
				str << '- [' << p name << '](' << p repository url asString << ')'.
				p description ifNotEmpty: [ :d | str << ' - ' << d ] ]
			separatedBy: [ str lf ] ].
			
	project := SmallProjectRegistry uniqueInstance detectForBaseline: self.
			
	^ template format: {
		#basicReadme -> project repository readme.
		#componentList -> componentList } asDictionary.
]

{ #category : #baseline }
BaselineOfDynabook >> baseline: spec [
  <baseline>

	spec for: #'common' do: [
		spec
			baseline: 'BabySignLanguage' with: [
				spec repository: 'github://seandenigris/Baby-Sign-Language' ];
			baseline: 'ComputerWorld' with: [
				spec repository: 'github://seandenigris/Computer-World' ];
			baseline: 'DynaChef' with: [
				spec repository: 'github://seandenigris/DynaChef' ];
			baseline: 'FlashcardsSt' with: [
				spec repository: 'github://seandenigris/Flashcards' ];
			baseline: 'Ideas' with: [
 				spec repository: 'github://seandenigris/ideas' ];
			baseline: 'Nature' with: [
				spec repository: 'github://seandenigris/Nature' ];
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
		spec 
			postLoadDoIt: #gtPostLoad;
			package: 'Dynabook-GToolkit' ]
]

{ #category : #accessing }
BaselineOfDynabook >> customProjectAttributes [
	^ self isGTImage
			ifFalse: [ #(notGToolkit) ]
			ifTrue: [ #(GToolkit) ]
]

{ #category : #accessing }
BaselineOfDynabook >> gtPostLoad [
	QuLeTransciptPageType 
		modelReferenceForClass: PpEvent 
			builder: [ 
				DbObjectUIDReference new
					sourceClass: PpEventLog;
					collectionGetter: #events;
					yourself ];
		modelReferenceForClass: LlAuthoredWork 
			builder: [ 
				DbObjectUIDReference new
					sourceClass: LlLibrary;
					collectionGetter: #works;
					yourself ].
			
	QuLeSources providers: { 
		QuLeSourceProvider new
			model: PpEventLog uniqueInstance;
			sourceCollectionGetter: #events;
			yourself.
		QuLeSourceProvider new
			model: LlLibrary uniqueInstance;
			sourceCollectionGetter: #works;
			yourself
	}.
]

{ #category : #testing }
BaselineOfDynabook >> isGTImage [
	
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'Lepiter-' ].
	"Implementation note: used to check for GToolkit prefix, but P7 has a GToolkit-Examples package. Lepiter, OTOH, could only be loaded in a GT image"
]
