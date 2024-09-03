# Containerized Django CRUD App with PostgreSQL

This project is a CRUD application built with Django, using PostgreSQL as the database. The application is containerized using Docker and deployed on Google Kubernetes Engine (GKE). Below are the steps taken to set up and deploy the project.

## Steps


1. **Created CRUD App in Django**
   - Developed a Django application with CRUD functionality for managing `Fruit` objects.
   - Relevant code:
     ```python:crudapp/models.py
    class Fruit(models.Model):
        name = models.CharField(max_length=100)
        color = models.CharField(max_length=50)
        availability = models.BooleanField(default=True)

    def __str__(self):
        return self.name

    class Meta:
        app_label = "crudapp"
     ```

2. **Implemented PostgreSQL**
   - Configured PostgreSQL as the database for the Django application.

3. **Tested on Local**
   - Ran the application locally to ensure that the CRUD operations and database interactions work as expected.

4. **Created Docker Images**
   - Created Docker images for both the Django application and the PostgreSQL database.

5. **Created Separate Containers for Both Database and Server**
   - Defined Kubernetes deployments for both the Django application and the PostgreSQL database.

6. **Pushed to GKE**
   - Deployed the Docker containers to Google Kubernetes Engine (GKE).

7. **Applied Migrations**
   - Ran Django migrations to set up the database schema on the PostgreSQL instance.

8. **Tested on Public Load Balancer API**
   - Verified the application functionality through the public load balancer API provided by GKE.

## Usage

1. **Clone the Repository**
   ```sh
   git clone git@github.com:alokrpt/djangodb-crud.git
   cd djangodb-crud
   ```

2. **Build Docker Images**
   ```sh
   docker build -t <your-django-app-image> -f Dockerfile.django .
   docker build -t <your-postgres-image> -f Dockerfile.postgres .
   ```

3. **Deploy to GKE**
   ```sh
   kubectl apply -f k8s/postgres-deployment.yaml
   kubectl apply -f k8s/django-deployment.yaml
   ```

4. **Run Migrations**
   ```sh
   kubectl exec -it <django-pod-name> -- python manage.py migrate
   ```

5. **Access the Application**
   - Use the public IP provided by the GKE load balancer to access the application.

## License

This project is licensed under the MIT License.