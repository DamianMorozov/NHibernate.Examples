using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;

namespace NHibernate.JustBlog.Core.Models
{
    public class Category
    {
        public virtual Guid Id { get; set; }
        public virtual string Name { get; set; }
        public virtual string Description { get; set; }
        public virtual Uri Url { get; set; }
        public virtual IList<Post> Posts { get; set; }
        public virtual DateTime? PostedDate { get; set; }
        public virtual string PostedAuthor { get; set; }
        public virtual DateTime? EditedDate { get; set; }
        public virtual string EditedAuthor { get; set; }
    }

    public class CategoryMap : ClassMap<Category>
    {
        public CategoryMap()
        {
            Id(x => x.Id);
            Map(x => x.Name).Length(50).Not.Nullable();
            Map(x => x.Description).Length(250).Not.Nullable();
            Map(x => x.Url).Length(250).Not.Nullable();
            Map(x => x.PostedDate).Nullable();
            Map(x => x.PostedAuthor).Length(100).Nullable();
            Map(x => x.EditedDate).Nullable();
            Map(x => x.EditedAuthor).Length(100).Nullable();
            HasMany(x => x.Posts).Inverse().Cascade.All().KeyColumn("CategoryId");
        }
    }
}
