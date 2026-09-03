## Student Details

**Name:** Kavya Raghavendran  
**Enrollment Number:** 2024bcs10324

---

## Task 1: Run Multi-Stage Dockerfile

A multi-stage Dockerfile was used to build and run a Node.js application.

### Docker Image Build

The Docker image was built using:

```bash
docker build -t multi-stage-app .
Run the Container

The application runs on port 3000 inside the container and was mapped to port 8080 on the host:

docker run -d -p 8080:3000 --name multi-stage-app multi-stage-app
Application Output

The application was accessed at:

http://localhost:8080

The application successfully displayed:

Hello World from Docker Multi-Stage Build!

Docker Container Verification

The running container was verified using:

docker ps

The output confirmed that the application was running and port 8080 was mapped to the container's port 3000.

Task 2: Documentation

This Markdown file contains the student details and screenshots demonstrating the successful deployment and execution of the Docker multi-stage application.

Task 3: Docker Application Deployment

The following applications were deployed using Docker:

Node.js
Python
Java

Each application was created with its own Dockerfile and successfully built and run using Docker.

Conclusion

The Docker multi-stage application was successfully built and deployed. The application was accessible through port 8080, and the running container was verified using docker ps.