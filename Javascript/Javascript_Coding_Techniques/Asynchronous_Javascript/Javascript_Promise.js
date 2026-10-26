/**
 * JavaScript Promise:
 * JavaScript Promises make handling asynchronous operations like API calls, file loading, or time delays easier. 
 * Think of a Promise as a placeholder for a value that will be available in the future. It can be in one of three states:
    1. Pending: The task is in the initial state.
    2. Fulfilled: The task was completed successfully, and the result is available.
    3. Rejected: The task failed, and an error is provided.
 */

    let checkEven = new Promise((resolve, reject) => {
        let number = 4;
        if (number % 2 === 0) resolve ("The number is even!");
        else reject("The number is odd!");
    });
    checkEven
        .then((message) => console.log(message)) // On success
        .catch((error) => console.error(error)); // On failure

// Let's see advanced promise methods and patterns for effective async handling.
    // 1. Promise.all() Method

    Promise.add([
        Promise.resolve("Task 1 completed"),
        Promise.resolve("Task 2 completed"),
        Promise.reject("Task 3 failed")
    ])
        .then ((results) => console.log(results))
        .catch((error) => console.error(error));

    // 2. Promise.allSettled() Method
    Promise.allSettled([
        Promise.resolve("Task 1 completed"),
        Promise.reject("Task 2 failed"),
        Promise.resolve("Task 3 completed")
    ])
        .then((results) => console.log(results));
    
    // 3. Promise.race() Method
    Promise.race([
        new Promise((resolve) =>
            setTimeout(() => 
                resolve("Task 1 finished"), 1000)),
        new Promise((resolve) =>
            setTimeout(() =>
                resolve("Task 2 finished"), 500)),        
    ]).then((result) => 
        console.log(result));

    // 4. Promise.any() Method
    Promise.any([
        Promise.reject("Task 1 failed"),
        Promise.resolve("Task 2 completed"),
        Promise.resolve("Task 3 completed")
    ])
        .then((result) => console.log(result))
        .catch((error) => console.error(error));
    
    // 5. Promise.resolve() Method
    Promise.resolve("Immediate success")
        .then((value) => console.log(value));
    
    // 6. Promise.reject() Method
    Promise.reject("Immediate failure")
        .catch((error) => console.error(error));

    // 7. Promise.finally() Method
    Promise.resolve("Task completed")
        .then((result) => console.log(result))
        .catch((error) => console.error(error))
        .finally(() => console.log("Cleanup completed"));

    // 8. Chaining with Promise.prototype.then() Method
    Promise.resolve(5)
        .then((value) => value * 2) // Multiplies by 2
        .then((value) => value + 3) // Adds 3
        .then((finalValue) => console.log(finalValue)); // Logs: 13
    
    // 9. Sequential Execution with Array.prototype.reduce()
    let tasks = [1, 2, 3];
    tasks.reduce((prevPromise, current) => {
        return prevPromise.then(() => {
            return new Promise((resolve) => {
            console.log('Processing task ${current}');
            setTimeout(resolve, 500); // Simulate async task
        });
    });
}, Promise.resolve());

    // 10. Dynamic Promise Creation
    function asyncTask (taskName) {
        return new Promise((resolve) => {
            setTimeout(() => 
            resolve('${taskName} completed'), 1000);
        });
    }
    asyncTask("Download File").then((result) => 
        console.log(result));

    // 11. Timeout Handling with Promise.race() Method
    let fetchData = new Promise((resolve) => 
        setTimeout(() => 
            resolve("Data loaded"), 3000));
    let timeout = new Promise((_, reject) => 
        setTimeout(() =>
            reject("Timeout!"), 2000));
    Promise.race([fetchData, timeout])
        .then((result) =>
            console.log(result))
        .catch((error) =>
            console.error(error));

    // 12. Handling Multiple Failures with Promise.allSettled() Method
    Promise.allSettled([
        Promise.resolve("Task 1 done"),
        Promise.reject("Task 2 failed"),
        Promise.resolve("Task 3 done")
    ])
        .then((results) => console.log(results));

    // 13. Combining Promise with Parallel and Sequential Execution
    Promise.all([
        new Promise((resolve) => 
            setTimeout(() => 
                resolve("Task A done"), 1000)),
        new Promise((resolve) =>
            setTimeout(() =>
                resolve("Task B done"), 500))
    ])
        .then(([resultA, resultB]) => {
            console.log(resultA, resultB);
            return new Promise((resolve) =>
                setTimeout(() => resolve("Final Task done"), 700));
        })
        .then((finalResult) =>
            console.log(finalResult));

    // 14. Wrapping Callbacks into Promises
function loadData(callback) {
    setTimeout(() => 
        callback("Data loaded"), 1000);
}
function promisifiedLoadData() {
    return new Promise((resolve) => {
        loadData((result) => 
            resolve(result));
    });
}
promisifiedLoadData().then((data) =>
    console.log(data)); 