/*
 Pre-Deployment Script Template                            
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.    
 Use SQLCMD syntax to include a file in the pre-deployment script.            
 Example:      :r .\myfile.sql                                
 Use SQLCMD syntax to reference a variable in the pre-deployment script.        
 Example:      :setvar TableName MyTable                            
               SELECT * FROM [$(TableName)]                    
--------------------------------------------------------------------------------------
*/
-- Drop foreign keys
if exists (select * from [JustBlog].[sys].[objects] where [name] = 'FK_PostTagMap_PostId' and [type] = 'F') begin
    alter table [dbo].[PostTagMap] drop constraint [FK_PostTagMap_PostId]
end
if exists (select * from [JustBlog].[sys].[objects] where [name] = 'FK_PostTagMap_TagId' and [type] = 'F') begin
    alter table [dbo].[PostTagMap] drop constraint [FK_PostTagMap_TagId]
end
if exists (select * from [JustBlog].[sys].[objects] where [name] = 'FK_Post_CategoryId' and [type] = 'F') begin
    alter table [dbo].[Post] drop constraint [FK_Post_CategoryId]
end
-- Drop tables
if exists (select 1 from [JustBlog].[sys].[tables] where [name] = 'PostTagMap') begin
    drop table [dbo].[PostTagMap]
end
if exists (select 1 from [JustBlog].[sys].[tables] where [name] = 'Post') begin
    drop table [dbo].[Post]
end
if exists (select 1 from [JustBlog].[sys].[tables] where [name] = 'Tag') begin
    drop table [dbo].[Tag]
end
if exists (select 1 from [JustBlog].[sys].[tables] where [name] = 'Category') begin
    drop table [dbo].[Category]
end
