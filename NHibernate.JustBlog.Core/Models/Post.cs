using System;
using System.Collections.Generic;
using FluentNHibernate.Mapping;

namespace NHibernate.JustBlog.Core.Models
{
    public class Post
    {
        public virtual Guid Id { get; set; }
        public virtual string Title { get; set; }
        public virtual string ShortDescription { get; set; }
        public virtual string Description { get; set; }
        public virtual string MetaData { get; set; }
        public virtual Uri Url { get; set; }
        public virtual Category Category { get; set; }
        public virtual bool Published { get; set; }
        public virtual IList<Tag> Tags { get; set; }
        public virtual DateTime? PostedDate { get; set; }
        public virtual string PostedAuthor { get; set; }
        public virtual DateTime? EditedDate { get; set; }
        public virtual string EditedAuthor { get; set; }
    }

    public class PostMap : ClassMap<Post>
    {
        public PostMap()
        {
            Id(x => x.Id);
            Map(x => x.Title).Length(500).Not.Nullable();
            Map(x => x.ShortDescription).Length(5000).Nullable();
            Map(x => x.Description).Length(5000).Nullable();
            Map(x => x.MetaData).Length(5000).Nullable();
            Map(x => x.Url).Length(250).Nullable();
            Map(x => x.Published).Not.Nullable();
            Map(x => x.PostedDate).Nullable();
            Map(x => x.PostedAuthor).Length(100).Nullable();
            Map(x => x.EditedDate).Nullable();
            Map(x => x.EditedAuthor).Length(100).Nullable();
            References(x => x.Category).Column("CategoryId").Nullable();
            HasManyToMany(x => x.Tags).Table("PostTagMap");
        }
    }
}
