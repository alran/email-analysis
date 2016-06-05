var UserShow = React.createClass({
  render: function(){
    // user = JSON.parse(this.props.user)
    // company = JSON.parse(this.props.company)
    // analyses = JSON.parse(this.props.analyses)
    // image = JSON.parse(this.props.image)
    // image = "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwig7aitnJDNAhXJrD4KHeAzCjwQjRwIBw&url=https%3A%2F%2Ftwitter.com%2Fgoogle&psig=AFQjCNFert6NinZiJJo6ww0q0c3JAIG9Og&ust=1465193253328300"
    return (
    //   <div id="content" className="clearfix">
    //   <section id="left">
    //     <div id="userStats" className="clearfix">
    //       <div className="pic">
    //       {/*{image}*/}
    //         <a href="#"><img src="https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwig7aitnJDNAhXJrD4KHeAzCjwQjRwIBw&url=https%3A%2F%2Ftwitter.com%2Fgoogle&psig=AFQjCNFert6NinZiJJo6ww0q0c3JAIG9Og&ust=1465193253328300" width="150" height="150" /></a>
    //       </div>
    //       <div className="data">
    //       {/*{user.name}*/}
    //         <h1>Brian Bier</h1>
    //         {/*{user.category[0].toUpperCase() + user.category.slice(1)},{company.name}*/}
    //         <h3> Taconic Investment</h3>
    //         <a href="/emails/get_emails">Click Here to Analyze Emails</a>
    //       </div>
    //     </div>
    //   </section>
    // </div>
    <div className="profile">
      <div className="wrapper_skinny">
        <ul className="clearfix">
          <li className="clearfix">
            <div className="episode_thumbnail">
              <a href="#"><img src="https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwig7aitnJDNAhXJrD4KHeAzCjwQjRwIBw&url=https%3A%2F%2Ftwitter.com%2Fgoogle&psig=AFQjCNFert6NinZiJJo6ww0q0c3JAIG9Og&ust=1465193253328300" width="150" height="150" /></a>
            </div>
            <div className="episode_overview">
              <h2>Taconic Investment</h2>
              <p className="description">Project Coordinator</p>
            </div>
          </li>
        </ul>
      </div>
    </div>
    );
  }
});
