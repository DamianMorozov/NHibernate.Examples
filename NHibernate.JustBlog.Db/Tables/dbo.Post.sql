create table [dbo].[Post]
(
	[Id] uniqueidentifier not null default newsequentialid() primary key,
	[Title] nvarchar(255) not null,
	[ShortDescription] nvarchar(255) null,
	[Description] nvarchar(255) null,
	[MetaData] nvarchar(255) null,
	[URL] nvarchar(255) null,
	[Published] bit not null default 0,
	[CategoryId] uniqueidentifier null,
	[PostedDate] date null,
	[PostedAuthor] nvarchar(255) null,
	[EditedDate] date null default getdate(),
	[EditedAuthor] nvarchar(255) null, 
    constraint [FK_Post_CategoryId] foreign key ([CategoryId]) references [dbo].[Category]([Id]),
)
