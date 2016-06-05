var Analysis = React.createClass({
  getInitialState: function(){

    console.log(Object.keys(JSON.parse(this.props.people)))
    b = JSON.parse(this.props.people)
    a = Object.keys(JSON.parse(this.props.people))[0]
    console.log(b[a])
    return {chosenUser: b[a]};
  },
  chooseUser: function(user){
    console.log('2')
    console.log(this)
    // this.setState({
    //   chosenUser: user
    // })
  },
  showUserDetails: function(){
    console.log('3')
    var user = this.state.chosenUser
    console.log(user)
    var people = JSON.parse(this.props.people)[0]
    console.log(people)
    return (
      <section>
        <h3>{user.name} - {user.sentiment_score} {user.sentiment}</h3><br/>
        <a href="#">Analyze by email </a>
      </section>
    )
  },
  render: function(){
    console.log('4')
    var people = JSON.parse(this.props.people)
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
              <td><a href="#" onClick={this.chooseUser}>John 20%</a></td>
              <td><a href="#">Doe 80%</a></td>
            </tr>
            <tr>
              <td><a href="#">Jake 80%</a></td>
              <td><a href="#">Doe 40%</a></td>
            </tr>
            <tr>
              <td><a href="#">Chilly 10%</a></td>
              <td><a href="#">billy 90%</a></td>
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
