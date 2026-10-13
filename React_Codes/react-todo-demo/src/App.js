import "./App.css";

function App() {
  return (
    <div className="container mt-5">
      <div className="card">
        <div className="card-header">
          <h1>Your Todo's</h1>
        </div>

        <div className="card-body">
          <p>This is a simple React + Bootstrap demo.</p>

          <button className="btn btn-primary mb-3">Add Todo</button>

          <table className="table table-hover">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Description</th>
                <th scope="col">Assigned</th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>Feed dog</td>
                <td>Eric</td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>Get a haircut</td>
                <td>Eric</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

export default App;
