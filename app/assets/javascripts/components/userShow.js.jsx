var UserShow = React.createClass({
  render: function(){
    return (
      <div id="content" className="clearfix">
      <section id="left">
        <div id="userStats" className="clearfix">
          <div className="pic">
            <a href="#"><img src="img/user_avatar.jpg" width="150" height="150" /></a>
          </div>
          <div className="data">
            <h1>Johnny Appleseed</h1>
            <h3>San Francisco, CA</h3>
            <h4><a href="http://spyrestudios.com/">http://spyrestudios.com/</a></h4>
            <div className="socialMediaLinks">
              <a href="http://twitter.com/jakerocheleau" rel="me" target="_blank"><img src="img/twitter.png" alt="@jakerocheleau" /></a>
              <a href="http://gowalla.com/users/JakeRocheleau" rel="me" target="_blank"><img src="img/gowalla.png" /></a>
            </div>
            <div className="sep"></div>
            <ul className="numbers clearfix">
              <li>Reputation<strong>185</strong></li>
              <li>Checkins<strong>344</strong></li>
              <li className="nobrdr">Days Out<strong>127</strong></li>
            </ul>
          </div>
        </div>
      </section>

    </div>
    );
  }
});
