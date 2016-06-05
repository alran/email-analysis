var UserShow = React.createClass({
  render: function(){
    user = JSON.parse(this.props.user)
    company = JSON.parse(this.props.company)
    analyses = JSON.parse(this.props.analyses)
    image = JSON.parse(this.props.image)
    var analysisLinks = analyses.map(function(analysis){
      var link = '/analyses/' + analysis.id
      return (
        <li><a href={link}>{analysis.created_at}</a></li>
      )
    })
    return (
    <div className="profile">
      <div className="wrapper_skinny">
        <ul className="clearfix">
          <li className="clearfix">
            <div className="image_thumbnail">
              <a href="#"><img src={image} width="150" height="150" /></a>
            </div>
            <div className="user_overview">
              <h2>{user.name}</h2>
              <p className="description" >{user.category[0].toUpperCase() + user.category.slice(1)}, {company.name}</p>
              <a className="button_message button_email" href="/emails/get_emails">Analyze Emails</a>
            </div>
          </li>
        </ul>
        <ul>
          {analysisLinks}
        </ul>
      </div>
    </div>
    );
  }
});
