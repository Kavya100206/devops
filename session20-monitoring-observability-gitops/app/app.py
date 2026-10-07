from flask import Flask, jsonify, request, Response
from prometheus_client import Counter, Histogram, Gauge, generate_latest, CONTENT_TYPE_LATEST
import time
import os
import psutil

app = Flask(__name__)

# Prometheus Metrics Definitions
REQUEST_COUNT = Counter('app_http_requests_total', 'Total HTTP Requests', ['method', 'endpoint', 'status'])
REQUEST_LATENCY = Histogram('app_http_request_duration_seconds', 'HTTP Request Latency in seconds', ['endpoint'])
SYSTEM_CPU_USAGE = Gauge('app_cpu_utilization_percent', 'Current process CPU utilization percentage')
SYSTEM_MEMORY_USAGE = Gauge('app_memory_utilization_bytes', 'Current process Memory utilization in bytes')

@app.before_request
def start_timer():
    request._start_time = time.time()

@app.after_request
def record_metrics(response):
    if request.path != "/metrics":
        latency = time.time() - getattr(request, "_start_time", time.time())
        REQUEST_COUNT.labels(method=request.method, endpoint=request.path, status=response.status_code).inc()
        REQUEST_LATENCY.labels(endpoint=request.path).observe(latency)
    return response

@app.route("/", methods=["GET"])
def index():
    return jsonify({
        "service": "Observability & GitOps Demo Service",
        "student": "Kavya Raghavendran",
        "roll_number": "24bcs10324",
        "metrics_endpoint": "/metrics",
        "health_endpoint": "/healthz",
        "environment": os.getenv("APP_ENV", "production")
    })

@app.route("/healthz", methods=["GET"])
def health():
    return jsonify({
        "status": "HEALTHY",
        "timestamp": time.time(),
        "checks": {
            "memory": "OK",
            "cpu": "OK",
            "storage": "OK"
        }
    }), 200

@app.route("/workload/cpu", methods=["GET"])
def cpu_workload():
    # Simulate CPU intensive task
    start = time.time()
    count = 0
    for i in range(1000000):
        count += i * i
    duration = time.time() - start
    return jsonify({"message": "CPU workload completed", "duration_seconds": duration}), 200

@app.route("/metrics", methods=["GET"])
def metrics():
    # Update live resource gauges
    SYSTEM_CPU_USAGE.set(psutil.cpu_percent())
    SYSTEM_MEMORY_USAGE.set(psutil.Process().memory_info().rss)
    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)

if __name__ == "__main__":
    host = os.getenv("HOST", "0.0.0.0")
    port = int(os.getenv("PORT", "5000"))
    app.run(host=host, port=port, debug=False)
