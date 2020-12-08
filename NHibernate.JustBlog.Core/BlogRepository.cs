using NHibernate.JustBlog.Core.Models;
using NHibernate.Linq;
using System.Collections.Generic;
using System.Linq;

namespace NHibernate.JustBlog.Core
{
    public class BlogRepository: IBlogRepository
    {
        private readonly ISession _session;

        public BlogRepository(ISession session)
        {
            _session = session;
        }

        public IList<Post> Posts(int pageNo, int pageSize)
        {
            var posts = _session.Query<Post>()
                .Where(p => p.Published)
                .OrderByDescending(p => p.PostedDate)
                .Skip(pageNo * pageSize)
                .Take(pageSize)
                .Fetch(p => p.Category)
                .ToList();
            var postIds = posts.Select(p => p.Id).ToList();
            return _session.Query<Post>()
                .Where(p => postIds.Contains(p.Id))
                .OrderByDescending(p => p.PostedDate)
                .FetchMany(p => p.Tags)
                .ToList();
        }

        public int TotalPosts()
        {
            return _session.Query<Post>().Count(p => p.Published);
        }
    }
}
