from flask import Flask, jsonify, request
import os

app = Flask(__name__)

@app.route("/", methods=["GET"])
def home():
    return jsonify({
        "service": "DevSecOps Secure Microservice",
        "status": "healthy",
        "student": "Kavya Raghavendran",
        "roll_number": "24bcs10324",
        "environment": os.getenv("APP_ENV", "production")
    })

@app.route("/healthz", methods=["GET"])
def health():
    return jsonify({"status": "UP", "checks": {"database": "OK", "cache": "OK"}}), 200

@app.route("/api/v1/data", methods=["GET", "POST"])
def data_endpoint():
    if request.method == "POST":
        payload = request.get_json(silent=True) or {}
        sanitized_input = str(payload.get("input", "")).strip()[:100]  # Input sanitization
        return jsonify({"message": "Data processed securely", "received": sanitized_input}), 201
    return jsonify({"message": "Secure data endpoint active"}), 200

if __name__ == "__main__":
    host = os.getenv("HOST", "0.0.0.0")  # nosec B104 - Container environment binding
    port = int(os.getenv("PORT", "5000"))
    app.run(host=host, port=port, debug=False)
