using System;
using System.Collections.Generic;
using FluentNHibernate.Mapping;

namespace NHibernate.JustBlog.Core.Models
{
    public class Tag
    {
        public virtual Guid Id { get; set; }
        public virtual string Name { get; set; }
        public virtual Uri Url { get; set; }
        public virtual IList<Post> Posts { get; set; }
        public virtual DateTime? PostedDate { get; set; }
        public virtual string PostedAuthor { get; set; }
        public virtual DateTime? EditedDate { get; set; }
        public virtual string EditedAuthor { get; set; }
    }

    public class TagMap : ClassMap<Tag>
    {
        public TagMap()
        {
            Id(x => x.Id);
            Map(x => x.Name).Length(50).Not.Nullable();
            Map(x => x.Url).Length(250).Nullable();
            Map(x => x.PostedDate).Nullable();
            Map(x => x.PostedAuthor).Length(100).Nullable();
            Map(x => x.EditedDate).Nullable();
            Map(x => x.EditedAuthor).Length(100).Nullable();
            HasManyToMany(x => x.Posts).Cascade.All().Inverse().Table("PostTagMap");
        }
    }
}
