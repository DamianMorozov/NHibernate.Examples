create table [dbo].[PostTagMap]
(
	[Id] uniqueidentifier not null default newsequentialid() primary key,
	[PostId] uniqueidentifier null,
	[TagId] uniqueidentifier null,
    constraint [FK_PostTagMap_PostId] foreign key ([PostId]) references [dbo].[Post]([Id]),
    constraint [FK_PostTagMap_TagId] foreign key ([TagId]) references [dbo].[Tag]([Id]),
)
