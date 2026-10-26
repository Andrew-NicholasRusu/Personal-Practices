/**
 * HTML DOM (Document Object Model):
    - The HTML DOM (Document Object Model) is a structured representation of a web page that allows developers to access, modify, and control its content and structure 
        using JavaScript. It powers most dynamic website interactions, enabling features like real-time updates, form validation, and interactive user interfaces.
 */

// We use HTML element id to find the DOM HTML element

<html>
    <body>
        <h2></h2>
        <p id = "intro">
            A Computer Science portal for geeks.
        </p>
        <p>
            This example illustrates the <b>getElementById</b> method.
        </p>
        <p id = "demo"></p>
        <script>
            const element = document.getElementById("intro");
            document.getElementById("demo").innerHTML = 
            "The introduction is: " + element.innerHTML;
        </script>
    </body>
</html>