var Watson = React.createClass({
  render: function(){
    return (
      <div>
      <h3 className="title">Email Analysis for Alyssa and Brian </h3>
      <div className="table-cover">
        <table className="table">
          <thead>
            <tr>
              <th>Date</th>
              <th>Emotion</th>
              <th>Behavior</th>
              <th>Tone</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><a href="#">5/3/30</a></td>
              <td><a href="#">Sad</a></td>
              <td><a href="#">Behavior</a></td>
              <td><a href="#">Aggressive</a></td>
            </tr>
            <tr>
            <td><a href="#">5/3/30</a></td>
            <td><a href="#">Sad</a></td>
            <td><a href="#">Behavior</a></td>
            <td><a href="#">Aggressive</a></td>
            </tr>
            <tr>
            <td><a href="#">5/3/30</a></td>
            <td><a href="#">Sad</a></td>
            <td><a href="#">Behavior</a></td>
            <td><a href="#">Aggressive</a></td>
            </tr>
          </tbody>
        </table>
        </div>
        <br/>
        <br/>
        <section>
          <a href="#">Alyssa 80%</a><br/>
          <a href="#">Analyze by email </a>
        </section>

      </div>
    )
  }
});
