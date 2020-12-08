create table [dbo].[Category]
(
	[Id] uniqueidentifier not null default newsequentialid() primary key,
	[Name] nvarchar(255) not null,
	[Description] nvarchar(255) null,
	[URL] nvarchar(255) null,
	[PostedDate] date null,
	[PostedAuthor] nvarchar(255) null,
	[EditedDate] date null default getdate(),
	[EditedAuthor] nvarchar(255) null,
)
