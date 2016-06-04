var Homepage = React.createClass({
  userSignOut: function(event) {
    event.preventDefault();
    $.ajax({
      url: '/users/sign_out',
      method: 'delete'
    }).done(function(response){
      window.location.href = '/'
    });
  },
  render: function(){
    if (this.props.loggedIn == 'false'){
      return (
        <header className='bring-to-front'>
          <div className="wrapper_wide">
            <a href="#" id="logo">Nucleus</a>
            <nav>
            <h1 className="slogan">Sign up now to see an analysis of your emails.</h1>
              <ul>
                <li><a className='google-button' href="/users/auth/google_oauth2">Google +</a></li>
              </ul>
            </nav>
          </div>
        </header>
      );
    } else {
      var home = '/users/' + this.props.currentUser
      return (
        <header className='bring-to-front'>
          <div className="wrapper_wide">
            <a href="#" id="logo">Nucleus</a>
            <nav>
            <h1 className="slogan">Improve your relationships today</h1>
              <ul>
                <li><a className='google-button' href={home}>Home</a></li>
                <li><a className='google-button' href="users/sign_out" onClick={this.userSignOut}>Logout</a></li>
              </ul>
            </nav>
          </div>
        </header>
      );
    }
  }
});
