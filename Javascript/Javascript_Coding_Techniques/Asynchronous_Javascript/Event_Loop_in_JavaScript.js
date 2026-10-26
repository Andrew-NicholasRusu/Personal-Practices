/**
 * Event Loop in JavaScript:
 * The event loop is an important concept in JavaScript that enables asynchronous programming by handling tasks efficiently. 
 * Since JavaScript is single-threaded, it uses the event loop to manage the execution of multiple tasks without blocking the main thread.
 */

console.log("Start"); // Executes first

setTimeout(() => { // Shedules its callback but does nto execute it immediately
    console.log("setTimeout Callback");
}, 0);

Promise.resolve().then(() => { // Placed in the microtask queue and executes before the callback queue. 
    console.log("Promise Resolved"); // Appears before setTimeout Callback due to microtask priority
});

console.log("End");

/**
 * Common Issues Related to the Event Loop
 */

// 1. Blocking the Main Thread
while (true) { // An infinite while(true) loop continuously executes without termination, blocking the event loop.
    console.log('Blocking...') // As a result, no other tasks (UI updates, callbacks, timers) can run, causing the browser to freeze.
}

// 2. Delayed Execution of setTimeout
console.log("Start");
setTimeout(() => console.log("Inside setTimeout"), 1000);
for (let i = 0; i < 1e9; i++) {} // Long loop
console.log("End");

// 3. Priority of Microtasks Over Callbacks
setTimeout(() => console.log("setTimeout"), 0);
Promise.resolve().then(() => console.log("Promise"));
console.log("End");

// 4. Callback Hell
setTimeout(() => {
    console.log("Step 1");
    setTimeout(() => {
        console.log("Step 2");
        setTimeout(() => {
            console.log("Step 3");
        }, 1000);
    }, 1000);
}, 1000); // Too many nested callbacks make code unreadable.