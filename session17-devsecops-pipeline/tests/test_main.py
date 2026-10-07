import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

import pytest
from app.main import app

@pytest.fixture
def client():
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client

def test_home_endpoint(client):
    response = client.get("/")
    assert response.status_code == 200
    json_data = response.get_json()
    assert json_data["status"] == "healthy"
    assert "Kavya Raghavendran" in json_data["student"]
    assert json_data["roll_number"] == "24bcs10324"

def test_health_check(client):
    response = client.get("/healthz")
    assert response.status_code == 200
    assert response.get_json()["status"] == "UP"

def test_data_post_endpoint(client):
    response = client.post("/api/v1/data", json={"input": "test payload"})
    assert response.status_code == 201
    assert response.get_json()["received"] == "test payload"
