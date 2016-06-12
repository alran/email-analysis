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
    var url = "/analyses/watson/" + user.email
    return (
      <div className="analysis_overview">
        <h3>{user.name} - {user.sentiment_score} {'(' + user.sentiment + ')'}</h3><br/>
        <a className="button_message button_email" href={url}>Click for Deeper Email Analysis </a>
      </div>
    )
  },
  render: function(){
    var people = JSON.parse(this.props.people)
    var self = this
    var keys = Object.keys(people)
    var counter = 0
    var numRows = 5
    var peopleButtons1 = keys.slice(0,numRows).map(function(key){
      var user = people[key]
      counter = counter += 1
      return (<UserButton user={user} chooseUser={self.chooseUser} numRows={numRows} counter={counter} key={counter}></UserButton>)
    })
    var peopleButtons2 = keys.slice(numRows,numRows*2).map(function(key){
      var user = people[key]
      counter = counter += 1
      return (<UserButton user={user} chooseUser={self.chooseUser} numRows={numRows} counter={counter} key={counter}></UserButton>)
    })
    var peopleButtons3 = keys.slice(numRows*2,numRows*3).map(function(key){
      var user = people[key]
      counter = counter += 1
      return (<UserButton user={user} chooseUser={self.chooseUser} numRows={numRows} counter={counter} key={counter}></UserButton>)
    })
    var peopleButtons4 = keys.slice(numRows*3,numRows*4).map(function(key){
      var user = people[key]
      counter = counter += 1
      return (<UserButton user={user} chooseUser={self.chooseUser} numRows={numRows} counter={counter} key={counter}></UserButton>)
    })
    var today = new Date().toJSON().slice(0,10)
    return (
      <div className="wrapper_skinny">
      <div className="table-cover">
      <div class="table-title">
        <h3 className="title">Gmail Analysis <br /> {today} </h3>
      </div>
        <table className="table-fill">
        <thead>
        <tr>
        <th className="text-center" colSpan="2">Social Breakdown</th>
        </tr>
        </thead>
        <tbody className="table-hover">
          <tr>
            {peopleButtons1}
          </tr>
          <tr>
            {peopleButtons2}
          </tr>
          <tr>
            {peopleButtons3}
          </tr>
          <tr>
            {peopleButtons4}
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
        <td><a href="#" onClick={this.chooseUser}>{user.name} {user.sentiment_score}%</a></td>
      )
  }
})
