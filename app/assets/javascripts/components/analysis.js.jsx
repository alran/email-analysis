var Analysis = React.createClass({
  getInitialState: function(){
    b = JSON.parse(this.props.people)
    a = Object.keys(JSON.parse(this.props.people))[0]
    return {chosenUser: b[a]};
  },
  chooseUser: function(user){
    this.setState({
      chosenUser: user
    })
  },
  showUserDetails: function(){
    var user = this.state.chosenUser
    var people = JSON.parse(this.props.people)
    return (
      <section>
        <h3>{user.name} - {user.sentiment_score} {'(' + user.sentiment + ')'}</h3><br/>
        <a href="#">Analyze by email </a>
      </section>
    )
  },
  render: function(){
    var people = JSON.parse(this.props.people)
    var self = this
    var keys = Object.keys(people)
    var counter = 0
    var peopleButtons = keys.map(function(key){
      var user = people[key]
      counter = counter += 1
      return (<UserButton user={user} chooseUser={self.chooseUser} key={counter}></UserButton>)
    })
    var today = new Date().toJSON().slice(0,10)
    return (
      <div>
      <h3 className="title">Gmail Analysis - {today} </h3>
      <div className="table-cover">
        <table className="table">
          <thead>
            <tr>
              <th>Social Breakdown</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              {peopleButtons}
            </tr>
          </tbody>
        </table>
        </div>
        <br/>
        <br/>
        {this.showUserDetails()}
      </div>
    );
  }


});

var UserButton = React.createClass({
  chooseUser: function(){
    this.props.chooseUser(this.props.user)
  },
  render: function(){
    var user = this.props.user
    return (
      <td><a href="#" onClick={this.chooseUser}>{user.name} {user.sentiment_score}</a></td>
    )
  }
})
