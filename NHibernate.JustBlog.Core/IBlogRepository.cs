using NHibernate.JustBlog.Core.Models;
using System.Collections.Generic;

namespace NHibernate.JustBlog.Core
{
    public interface IBlogRepository
    {
        IList<Post> Posts(int pageNo, int pageSize);
        int TotalPosts();
    }
}
