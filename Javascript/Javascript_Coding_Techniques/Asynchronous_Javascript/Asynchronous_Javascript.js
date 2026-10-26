/**
 * Asynchronous JavaScript is a programming approach that enables the non-blocking execution of tasks, allowing concurrent operations, 
 * improved responsiveness, and efficient handling of time-consuming operations in web applications, 
 * JavaScript is a single-threaded and synchronous language. The code is executed in order one at a time, But Javascript may appear to 
 * be asynchronous in some situations.
 */


function myFunction(callback) {
    setTimeout(() => {
        const data = { name: "Aman", age: 21 };
        callback(data);
    }, 3000);
}

myFunction((data) => {
    console.log("Data:", data);
});

// Approach 2: Using Promises
    // Promises are objects representing the eventual completion (or failure) of an asynchronous operation, providing better handling 
    // of asynchronous code with .then() and .catch().

function myData() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            const data = { name: "Rohit", age: 23};
            resolve(data);
        }, 2000);
    });
}

myData()
    .then((data) => {
        console.log("Data:", data);
    })
    .catch((error) => {
        console.error("Error:", error);
    });

// OUTPUT: Data: { name: "Rohit", age: 23 };


/**
 * JavaScript Callbacks:
 * A callback function is a function that is passed as an argument to another function and executed later.
    - A function can accept another function as a parameter.
    - Callbacks allow one function to call another at a later time.
    - A callback function can execute after another function has finished.
 */

function greet(name, callback) {
    console.log("Hello, " + name);
    callback();
}

function sayBye() {
    console.log("Goodbye!");
}

greet("Nicky", sayBye);

// Working_of_Callbacks in JavaScript
    // JavaScript executes code line by line (synchronously), but sometimes we need to delay 
    // execution or wait for a task to complete before running the next function. Callbacks help achieve 
    // this by passing a function that is executed later.

console.log("Start");
setTimeout(function() {
    console.log("Inside setTimeout");
}, 2000);
console.log("End");

// Callbacks in Functions Handling Operations
    // When a function needs to execute different behaviors based on input, callbacks make the function flexible.

function calc(a, b, callback) {
    return callback(a, b);
}

function add(x, y) {
    return x * y;
}

console.log(calc(5, 3, add));
console.log(calc(5, 3, mul));

// Callbacks in Event Listeners
    // JavaScript is event-driven, and callbacks handle user interactions like clicks and key presses.
document.getElementById("myButton").addEventListener("click", function() {
    console.log("Button clicked!");
});

// Callbacks in API Calls (Fetching Data)
    // Callbacks are useful when retrieving data from APIs.
function fetch(callback) {
    fetch ("https://jsonplaceholder.typicode.com/todos/1")
    .then(response => response.json())
    .then(data => callback(data))
    .catch(error => console.error("Error:", error));
}

function handle(data) {
    console.log("Fetched Data:", data);
}

fetch(handle);

/**
 * Alternatives to Callabacks
 */

// 1. Promises
    // Promises provide a better way to handle asynchronous tasks without deep nesting.

function step1() {
    return new Promise(resolve => {
        setTimeout(() => {
            console.log("Step 1 completed");
            resolve();
        }, 1000);
    });
}

function step2() {
    return new Promise(resolve => {
        setTimeout(() => {
            console.log("Step 2 completed");
            resolve();
        }, 1000);
    });
}

function step3() {
    return new Promise(resolve => {
        setTimeout(() => {
            console.log("Step 3 completed");
            resolve();
        }, 1000);
    });
}

step1()
    .then(step2)
    .then(step3)
    .then(() => console.log("All steps completed!"));

// 2. Async/Await 
    // async/await provides an even cleaner way to handle asynchronous code.

async function processSteps() {
    await step1();
    await step2();
    await step3();
    console.log("All steps conpleted");
}

processSteps();