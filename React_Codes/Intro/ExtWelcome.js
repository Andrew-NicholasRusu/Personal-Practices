class ExtWelcome extends React.Component { 
render() { 
return <h1>Hello {this.props.name}</h1>; 
    } 
} 
ReactDOM.render(<ExtWelcome name="John Doe"/>, document.getElementById('root'));