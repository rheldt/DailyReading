CREATE TABLE [BibleTranslations] (
	[BibleTranslationID] int PRIMARY KEY IDENTITY(1,1),
	[Name] nvarchar(100),
	[Abbreviation] nvarchar(100)
)
GO

CREATE TABLE [BibleBooks] (
	[BibleBookID] int PRIMARY KEY IDENTITY(1,1),
	[Name] nvarchar(100),
	[Abbreviation] nvarchar(50),
	[IsNewTestament] bit
)
GO

CREATE TABLE [BibleSections] (
	[BibleSectionID] int PRIMARY KEY IDENTITY(1,1),
	[Name] nvarchar(100),
	[OrderNumber] int
)
GO

CREATE TABLE [BibleSectionBibleBooks] (
	[BibleSectionBibleBookID] int PRIMARY KEY IDENTITY(1,1),
	[BibleSectionID] int,
	[BibleBookID] int
)
GO

CREATE TABLE [BibleVerses] (
	[BibleVerseID] int PRIMARY KEY IDENTITY(1,1),
	[BibleTranslationID] int,
	[BibleBookID] int,
	[Chapter] int,
	[Verse] int,
	[Text] nvarchar(MAX)
)
GO

CREATE TABLE [PlanFullBibleYear] (
	[ReadingID] int PRIMARY KEY IDENTITY(1,1),
	[Month] int,
	[Day] int,
	[Reading] nvarchar(50)
)
GO

CREATE TABLE [PlanNewTestamentYear] (
	[ReadingID] int PRIMARY KEY IDENTITY(1,1),
	[Week] int,
	[DayOfWeek] varchar(10),
	[Reading] nvarchar(50),
)
GO

CREATE TABLE [Subscribers] (
	[SubscriberID] int PRIMARY KEY IDENTITY(1,1),
	[FirstName] nvarchar(50),
	[LastName] nvarchar(50),
	[Email] nvarchar(100),
	[BibleTranslationID] int,
	[ReadingPlan] int,
	[DateSubscribed] datetime 
)
GO

ALTER TABLE [BibleSectionBibleBooks] ADD FOREIGN KEY ([BibleSectionID]) REFERENCES [BibleSections] ([BibleSectionID])
GO

ALTER TABLE [BibleSectionBibleBooks] ADD FOREIGN KEY ([BibleBookID]) REFERENCES [BibleBooks] ([BibleBookID])
GO

ALTER TABLE [BibleVerses] ADD FOREIGN KEY ([BibleTranslationID]) REFERENCES [BibleTranslations] ([BibleTranslationID])
GO

ALTER TABLE [BibleVerses] ADD FOREIGN KEY ([BibleBookID]) REFERENCES [BibleBooks] ([BibleBookID])
GO

ALTER TABLE [Subscribers] ADD FOREIGN KEY ([BibleTranslationID]) REFERENCES [BibleTranslations] ([BibleTranslationID])
GO