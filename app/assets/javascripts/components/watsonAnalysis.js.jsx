var Watson = React.createClass({
  emailSentiments: function(){
    if (this.props.analyses){
      return this.props.analyses.map(function(analysis){
        return (
          <p>{analysis}</p>
        )
      })
    }
  },
  render: function(){
    var receiver = this.props.receiver
    var sentiments = this.props.analyses
    return (
      <div>
      <h3 className="title">Your interactions with {receiver} </h3>
      <p>We analyzed {sentiments.length} emails you sent to {receiver}.</p>

      {this.emailSentiments()}

      </div>
    )
  }
});
