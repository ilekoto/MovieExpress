using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Singular.Web;

namespace MEWeb.Movies
{
  public partial class Movie : MEPageBase<MovieVM>
  {
  }
  public class MovieVM : MEStatelessViewModel<MovieVM>
  {
        public MELib.Movies.MovieList UserMoviesList { get; set; }
        public MELib.Movies.Movie UserMovie { get; set; }

    public MovieVM()
    {

    }
    protected override void Setup()
    {
      base.Setup();
            UserMoviesList = MELib.Movies.MovieList.GetMovieList();
            UserMovie = UserMoviesList.FirstOrDefault();




    }
  }
}

