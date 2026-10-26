from flask import Flask, request, jsonify

app = Flask(__name__) 

# In-memory dataset
students = [
    {"id": 1, "name": "Ali", "course": "IoT"},
    {"id": 2, "name": "Sara", "course": "Python"}
]

@app.get("/students")
def get_students():
    # Return student list as JSON payload
    return jsonify({"students": students}), 200 

@app.post("/students")
def add_student():
    data = request.get_json() # Extract JSON payload from request body

    # Input validation
    if not data or "name" not in data or "course" not in data:
        return jsonify({"error": "Please send JSON with name and course"}), 400

    new_student = {
        "id": len(students) + 1,
        "name": data["name"],
        "course": data["course"]
    }
    students.append(new_student)

    return jsonify({"message": "Student added", "student": new_student}), 201

if __name__ == "__main__":
    # Listen on all external network interfaces
    app.run(host="0.0.0.0", port=5000)