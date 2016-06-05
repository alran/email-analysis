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
    <div className="wrapper_skinny slogan">
      <div className="center">
      <a href="#" className="logo">Empath</a>
      </div>
      <h1 className="h1">Sign up now to see an analysis of your emails.</h1>
      <div className="button_wrapper">
        <a className='button button_highlight' href="/users/auth/google_oauth2">Google +</a>
      </div>
    </div>
      );
    } else {
      var home = '/users/' + this.props.currentUser
      return (
        <div className="wrapper_skinny slogan">
          <div className="center">
          <a href="#" className="logo">Empath</a>
          </div>
          <h1 className="h1">Improve your relationships today.</h1>
          <div className="button_wrapper">
            <a className='button button_highlight' href="/users/auth/google_oauth2">Google +</a>
          </div>
          <ul>
            <li><a href={home}>Home</a></li>
            <li><a href="users/sign_out" onClick={this.userSignOut}>Logout</a></li>
          </ul>
        </div>
      );
    }
  }
});
