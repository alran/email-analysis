var UserShow = React.createClass({
  render: function(){
    user = JSON.parse(this.props.user)
    company = JSON.parse(this.props.company)
    analyses = JSON.parse(this.props.analyses)
    image = JSON.parse(this.props.image)
    return (
      <div id="content" className="clearfix">
      <section id="left">
        <div id="userStats" className="clearfix">
          <div className="pic">
            <a href="#"><img src={image} width="150" height="150" /></a>
          </div>
          <div className="data">
            <h1>{user.name}</h1>
            <h3>{user.category[0].toUpperCase() + user.category.slice(1)}, {company.name}</h3>
            <a href="/emails/{user.id}">Click Here to Analyze Emails</a>
          </div>
        </div>
      </section>
    </div>
    );
  }
});
