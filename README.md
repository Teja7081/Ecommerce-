# Ecommerce Website

A simple e-commerce website built with Java Servlets and JSP, using in-memory storage for cart and products.

## Features

- Product listing
- Add to cart
- View cart
- Simple checkout

## Project Structure

- `src/main/java/com/example/ecommerce/` - Servlets and model classes
- `src/main/webapp/` - JSP pages, CSS, images
- `pom.xml` - Maven configuration
- `src/main/webapp/WEB-INF/web.xml` - Servlet mappings

## Build

```bash
mvn clean package
```

This creates `target/ecommerce.war`

## Deployment in Jenkins

1. Install Jenkins with Maven and Tomcat plugins.
2. Create a new Jenkins job.
3. Configure SCM to pull from Git repository.
4. Add build step: Execute shell `mvn clean package`
5. Add post-build action: Deploy war/ear to a container, specify the WAR file `target/ecommerce.war` and Tomcat URL.
6. Save and build the job.

Ensure Tomcat is running and configured in Jenkins.

## Usage

- Access the app at `http://localhost:8080/ecommerce/`
- Browse products, add to cart, checkout.

## Images

Place product images in `src/main/webapp/images/` as laptop.jpg, phone.jpg, tablet.jpg.