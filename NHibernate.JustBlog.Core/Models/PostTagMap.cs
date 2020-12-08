using System;
using System.Collections.Generic;

namespace NHibernate.JustBlog.Core.Models
{
    public class PostTagMap
    {
        public virtual Guid Id { get; set; }
        public virtual string Name { get; set; }
        public virtual string Description { get; set; }
        public virtual Uri Url { get; set; }
        public virtual IList<Post> Posts { get; set; }
    }
}
