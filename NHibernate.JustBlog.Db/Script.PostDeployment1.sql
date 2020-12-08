/*
Post-Deployment Script Template                            
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.        
 Use SQLCMD syntax to include a file in the post-deployment script.            
 Example:      :r .\myfile.sql                                
 Use SQLCMD syntax to reference a variable in the post-deployment script.        
 Example:      :setvar TableName MyTable                            
               SELECT * FROM [$(TableName)]                    
--------------------------------------------------------------------------------------
*/
if exists (select 1 from [JustBlog].[sys].[tables] where [name] = 'Post') begin
    delete from [dbo].[Post]
end
if exists (select 1 from [JustBlog].[sys].[tables] where [name] = 'Tag') begin
    delete from [dbo].[Tag]
end
if exists (select 1 from [JustBlog].[sys].[tables] where [name] = 'Category') begin
    delete from [dbo].[Category]
end

if exists (select 1 from [JustBlog].[sys].[tables] where [name] = 'Tag') begin
    insert into [dbo].[Tag] ([Name],[URL],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Tag 1','http://test.com/tag1',getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
    insert into [dbo].[Tag] ([Name],[URL],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Tag 2','http://test.com/tag2',getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
    insert into [dbo].[Tag] ([Name],[URL],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Tag 3','http://test.com/tag3',getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
    insert into [dbo].[Tag] ([Name],[URL],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Tag 4','http://test.com/tag4',getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
    insert into [dbo].[Tag] ([Name],[URL],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Tag 5','http://test.com/tag5',getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
end
if exists (select 1 from [JustBlog].[sys].[tables] where [name] = 'Category') begin
    insert into [dbo].[Category] ([Name],[Description],[URL],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Category 1','Description','http://test.com/category1',
        getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
    insert into [dbo].[Category] ([Name],[Description],[URL],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Category 2','Description','http://test.com/category2',
        getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
    insert into [dbo].[Category] ([Name],[Description],[URL],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Category 3','Description','http://test.com/category3',
        getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
    insert into [dbo].[Category] ([Name],[Description],[URL],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Category 4','Description','http://test.com/category4',
        getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
    insert into [dbo].[Category] ([Name],[Description],[URL],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Category 5','Description','http://test.com/category5',
        getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
end
if exists (select 1 from [JustBlog].[sys].[tables] where [name] = 'Post') begin
    declare @categoryId uniqueidentifier
    set @categoryId = (select [Id] from [dbo].[Category] where [dbo].[Category].[Name] = 'Category 1')
    insert into [dbo].[Post] ([Title],[ShortDescription],[Description],[MetaData],[URL],[CategoryId],[Published],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Title 1','Short description','Description','Meta data','http://test.com/title1',@categoryId,1,
        getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
    insert into [dbo].[Post] ([Title],[ShortDescription],[Description],[MetaData],[URL],[CategoryId],[Published],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Title 2','Short description','Description','Meta data','http://test.com/title2',@categoryId,1,
        getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
    set @categoryId = (select [Id] from [dbo].[Category] where [dbo].[Category].[Name] = 'Category 2')
    insert into [dbo].[Post] ([Title],[ShortDescription],[Description],[MetaData],[URL],[CategoryId],[Published],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Title 3','Short description','Description','Meta data','http://test.com/title3',@categoryId,1,
        getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
    insert into [dbo].[Post] ([Title],[ShortDescription],[Description],[MetaData],[URL],[CategoryId],[Published],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Title 4','Short description','Description','Meta data','http://test.com/title4',@categoryId,1,
        getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
    insert into [dbo].[Post] ([Title],[ShortDescription],[Description],[MetaData],[URL],[CategoryId],[Published],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Title 5','Short description','Description','Meta data','http://test.com/title5',null,1,
        getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
    insert into [dbo].[Post] ([Title],[ShortDescription],[Description],[MetaData],[URL],[CategoryId],[Published],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Title 6','Short description','Description','Meta data','http://test.com/title6',null,0,
        getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
    insert into [dbo].[Post] ([Title],[ShortDescription],[Description],[MetaData],[URL],[CategoryId],[Published],[PostedDate],[PostedAuthor],[EditedAuthor])
        values ('Title 7','Short description','Description','Meta data','http://test.com/title7',null,0,
        getdate(),'Firstname Lastname Surname','Firstname Lastname Surname')
end
if exists (select 1 from [JustBlog].[sys].[tables] where [name] = 'PostTagMap') begin
    declare @postId uniqueidentifier
    set @postId = (select [Id] from [dbo].[Post] where [dbo].[Post].[Title] = 'Title 1')
    declare @tagId uniqueidentifier
    set @tagId = (select [Id] from [dbo].[Tag] where [dbo].[Tag].[Name] = 'Tag 1')
    insert into [dbo].[PostTagMap] ([PostId],[TagId]) values (@postId,@tagId)
    set @tagId = (select [Id] from [dbo].[Tag] where [dbo].[Tag].[Name] = 'Tag 2')
    insert into [dbo].[PostTagMap] ([PostId],[TagId]) values (@postId,@tagId)
    set @postId = (select [Id] from [dbo].[Post] where [dbo].[Post].[Title] = 'Title 2')
    insert into [dbo].[PostTagMap] ([PostId],[TagId]) values (@postId,@tagId)
    set @tagId = (select [Id] from [dbo].[Tag] where [dbo].[Tag].[Name] = 'Tag 3')
    insert into [dbo].[PostTagMap] ([PostId],[TagId]) values (@postId,@tagId)
end
