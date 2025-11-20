# Quiz 3 - Travel Dashboard (JSP/Servlet Application)

A beautiful travel management system built with Jakarta EE, JSP, and Servlets featuring **8 CRUD operations** for destinations and travel packages.

## Features

### CRUD Operations (8 Total)
- **Destinations**: Create, Read, Update, Delete (4 operations)
- **Travel Packages**: Create, Read, Update, Delete (4 operations)

### Technology Stack
- **Java 17**
- **Jakarta EE 10** (Jakarta Servlet API 6.0.0)
- **JSP (Jakarta Server Pages)**
- **JSTL (Jakarta Standard Tag Library)**
- **Maven** for build management

## Prerequisites

1. **Java 17** or higher installed
2. **Maven 3.6+** installed and added to PATH
3. **Tomcat 10.1+** or compatible Jakarta EE servlet container

## Setup Instructions

### 1. Verify Maven Installation

Open a new terminal/command prompt and verify Maven is accessible:

```bash
mvn -version
```

If Maven is not found:
- **Windows**: Add Maven's `bin` directory to your PATH environment variable
- Restart your terminal/IDE after adding to PATH
- Or use the full path to `mvn.cmd` (e.g., `C:\Program Files\Apache\maven\bin\mvn.cmd`)

### 2. Build the Project

Navigate to the project directory and build:

```bash
cd "E:\Kuliah\SMS 5\PWEB\Quiz 3"
mvn clean package
```

This will:
- Download dependencies
- Compile Java source files
- Package the application as a WAR file in `target/quiz3-travel-dashboard-1.0.0.war`

### 3. Deploy to Tomcat

#### Option A: Manual Deployment
1. Copy `target/quiz3-travel-dashboard-1.0.0.war` to Tomcat's `webapps` directory
2. Start Tomcat
3. Access: `http://localhost:8080/quiz3-travel-dashboard-1.0.0/`

#### Option B: Using Maven Tomcat Plugin (if configured)
```bash
mvn tomcat7:deploy
```

#### Option C: Using IDE (IntelliJ IDEA / Eclipse)
1. Configure Tomcat 10.1+ as a server
2. Add the project as an artifact
3. Run/Debug the application

### 4. Access the Application

Once deployed, access:
- **Dashboard**: `http://localhost:8080/quiz3-travel-dashboard-1.0.0/dashboard`
- **Destinations**: `http://localhost:8080/quiz3-travel-dashboard-1.0.0/destinations`
- **Packages**: `http://localhost:8080/quiz3-travel-dashboard-1.0.0/packages`

## Project Structure

```
Quiz 3/
├── pom.xml                          # Maven configuration
├── src/
│   └── main/
│       ├── java/
│       │   └── com/examtravel/
│       │       ├── model/           # Data models (Destination, TravelPackage)
│       │       ├── storage/         # In-memory data store
│       │       └── web/             # Servlets (Dashboard, Destination, TravelPackage)
│       └── webapp/
│           ├── index.jsp            # Dashboard page
│           ├── destinations.jsp      # Destination management
│           ├── packages.jsp         # Package management
│           ├── assets/
│           │   └── css/
│           │       └── styles.css   # Beautiful styling
│           └── WEB-INF/
│               └── web.xml          # Web application configuration
└── target/                          # Build output (generated)
```

## Usage

### Managing Destinations
1. Navigate to **Destinations** page
2. **Create**: Fill the form and click "Create destination"
3. **Read**: View all destinations in the table
4. **Update**: Click "Edit" on any destination, modify fields, click "Save changes"
5. **Delete**: Click "Delete" button (removes destination and associated packages)

### Managing Travel Packages
1. Navigate to **Packages** page
2. **Create**: Fill the form, select a destination, add highlights, click "Publish package"
3. **Read**: View all packages in the list
4. **Update**: Click "Edit Package", modify fields, click "Save changes"
5. **Delete**: Click "Delete Package" button

## Troubleshooting

### Maven not found
- Ensure Maven is installed and in your PATH
- Restart terminal/IDE after PATH changes
- Use full path to `mvn.cmd` if needed

### Build errors
- Ensure Java 17 is installed: `java -version`
- Check Maven can download dependencies (internet connection)
- Clean and rebuild: `mvn clean package`

### Deployment errors
- Ensure Tomcat 10.1+ is used (Jakarta EE 10 compatible)
- Check port 8080 is not in use
- Verify WAR file is in `webapps` directory

### JSP errors
- Ensure JSTL dependencies are included (already in pom.xml)
- Check servlet container supports Jakarta EE 10

## Notes

- Data is stored in-memory (resets on server restart)
- Sample data is seeded on first load
- All 8 CRUD operations are fully functional
- Beautiful, modern UI with gradient design

---

**Built for Quiz 3 - PWEB Course**


