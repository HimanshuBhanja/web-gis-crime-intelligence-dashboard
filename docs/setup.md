# Web GIS Crime Intelligence Dashboard — Setup Guide

## 1. Project Overview

This project is a Web GIS dashboard for visualizing crime intensity across Indian states and union territories.

The dashboard integrates:

- PostgreSQL
- PostGIS
- Python
- GeoServer
- QGIS
- OpenLayers
- WMS / WFS
- Normalized crime density (`cases_per_km2`)

The dashboard currently supports:

- Burglary
- Theft
- Robbery
- Dacoity
- Criminal Breach of Trust

for:

- 2001
- 2005
- 2010

---

## 2. System Requirements

Install the following software:

- PostgreSQL
- PostGIS
- GeoServer
- QGIS
- Python 3.x
- Java/JDK compatible with the installed GeoServer version
- Modern web browser
- Visual Studio Code (recommended for local development)

---

## 3. Repository Structure

```text
Web-GIS-Crime-Intelligence-Dashboard/
│
├── README.md
├── .gitignore
│
├── dashboard/
│   └── India_Crime_Intelligence_Dashboard_Normalized.html
│
├── data/
│   └── 10_Property_stolen_and_recovered.csv
│
├── geoserver/
│   └── styles/
│       ├── burglary_density.sld
│       ├── theft_density.sld
│       ├── robbery_density.sld
│       ├── dacoity_density.sld
│       └── criminal_breach_of_trust_density.sld
│
├── qgis/
│   └── all_layers.qgz
│
├── scripts/
│   └── import_csv.py
│
├── docs/
│   └── setup.md
│
└── standalone/
    └── README.md
```

---

## 4. Database Setup

Create a PostgreSQL database for the project.

Enable PostGIS:

```sql
CREATE EXTENSION postgis;
```

Import/process the required crime data using the project Python script and SQL workflow.

The normalized spatial layers used by the dashboard are:

```text
burglary_2001_norm
burglary_2005_norm
burglary_2010_norm

theft_2001_norm
theft_2005_norm
theft_2010_norm

robbery_2001_norm
robbery_2005_norm
robbery_2010_norm

dacoity_2001_norm
dacoity_2005_norm
dacoity_2010_norm

criminal_breach_of_trust_2001_norm
criminal_breach_of_trust_2005_norm
criminal_breach_of_trust_2010_norm
```

Each normalized layer contains the key attributes:

```text
state_name
total_cases
area_km2
cases_per_km2
geom
```

The spatial reference system used by the state boundary data is:

```text
EPSG:4326
```

---

## 5. Crime Density Normalization

Crime intensity is represented using:

```text
cases_per_km2
```

The calculation is based on:

```text
cases_per_km2 = total_cases / area_km2
```

Crime-specific classification ranges are used so that each crime type has a consistent scale across 2001, 2005 and 2010.

### Burglary

```text
No Cases       = 0
Very Low       = >0 – 0.0083
Low            = >0.0083 – 0.0204
Moderate       = >0.0204 – 0.0452
High           = >0.0452 – 0.1372
Very High      = >0.1372
```

### Theft

```text
No Cases       = 0
Very Low       = >0 – 0.0159
Low            = >0.0159 – 0.0635
Moderate       = >0.0635 – 0.1347
High           = >0.1347 – 0.3901
Very High      = >0.3901
```

### Robbery

```text
No Cases       = 0
Very Low       = >0 – 0.0008
Low            = >0.0008 – 0.0049
Moderate       = >0.0049 – 0.0084
High           = >0.0084 – 0.0140
Very High      = >0.0140
```

### Dacoity

```text
No Cases       = 0
Very Low       = >0 – 0.0001
Low            = >0.0001 – 0.0009
Moderate       = >0.0009 – 0.0025
High           = >0.0025 – 0.0068
Very High      = >0.0068
```

### Criminal Breach of Trust

```text
No Cases       = 0
Very Low       = >0 – 0.0008
Low            = >0.0008 – 0.0019
Moderate       = >0.0019 – 0.0067
High           = >0.0067 – 0.0163
Very High      = >0.0163
```

---

## 6. GeoServer Setup

Start GeoServer and open:

```text
http://localhost:8080/geoserver
```

Create/configure the crime workspace and connect it to the PostgreSQL/PostGIS database.

Publish the 15 normalized layers listed in Section 4.

The corresponding styles are available in:

```text
geoserver/styles/
```

Apply:

```text
burglary_density.sld
    → burglary_2001_norm
    → burglary_2005_norm
    → burglary_2010_norm

theft_density.sld
    → theft_2001_norm
    → theft_2005_norm
    → theft_2010_norm

robbery_density.sld
    → robbery_2001_norm
    → robbery_2005_norm
    → robbery_2010_norm

dacoity_density.sld
    → dacoity_2001_norm
    → dacoity_2005_norm
    → dacoity_2010_norm

criminal_breach_of_trust_density.sld
    → criminal_breach_of_trust_2001_norm
    → criminal_breach_of_trust_2005_norm
    → criminal_breach_of_trust_2010_norm
```

The styles use a common visual progression:

```text
No Cases → Very Low → Low → Moderate → High → Very High
```

with the highest-risk class represented by red.

---

## 7. Start GeoServer

The exact GeoServer installation path can differ between systems.

If GeoServer is installed as a Windows service, start the GeoServer service.

If using the GeoServer binary distribution, run the appropriate startup script from the GeoServer `bin` directory.

After starting GeoServer, verify:

```text
http://localhost:8080/geoserver
```

opens successfully.

---

## 8. QGIS Project

The QGIS project is provided at:

```text
qgis/all_layers.qgz
```

Open it using QGIS.

The project can be used to inspect the spatial layers, boundaries, and GIS configuration used during development.

---



---

## 8A. Windows Local Startup Commands

If GeoServer is installed using the Windows binary distribution and the Java installation is located at the path below, use the following commands to start GeoServer:

```cmd
set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.11.10-hotspot"
cd /d "C:\Program Files\GeoServer\bin"
startup.bat
```

Keep the GeoServer command window running while using the dashboard.

After GeoServer starts, verify that it is available at:

```text
http://localhost:8080/geoserver
```

### Local Chrome Development Mode

For local development, if browser cross-origin restrictions prevent the dashboard from communicating with the local GeoServer instance, Chrome can be launched with web security disabled using a separate browser profile.

Recommended project-specific command:

```cmd
start chrome --disable-web-security --user-data-dir="C:\temp\crime_dashboard"
```

An alternative generic temporary profile command is:

```cmd
start chrome --disable-web-security --user-data-dir="C:/temp"
```

### Important

The `--disable-web-security` Chrome option is **only for local development/testing**.

It should **not** be used as a production deployment method or for normal web browsing.

Using a separate `--user-data-dir` is recommended so that the development Chrome session does not interfere with your normal Chrome profile.

After launching the development Chrome session, open the locally served dashboard, for example:

```text
http://127.0.0.1:5501/India_Crime_Intelligence_Dashboard_Normalized.html
```

The exact port may differ depending on the local development server.


## 9. Running the Dashboard

Start GeoServer before running the dashboard.

The main dashboard is:

```text
dashboard/India_Crime_Intelligence_Dashboard_Normalized.html
```

For local development, it is recommended to serve the dashboard using VS Code Live Server or another local HTTP server instead of relying on direct `file://` access.

Example using VS Code:

1. Open the repository in Visual Studio Code.
2. Open the `dashboard` folder.
3. Open `India_Crime_Intelligence_Dashboard_Normalized.html`.
4. Start Live Server.
5. Open the generated local URL in the browser.

The dashboard communicates with the local GeoServer instance.

---

## 10. GeoServer and Dashboard Connection

The normal WebGIS architecture is:

```text
Crime Data
    ↓
Python / Data Processing
    ↓
PostgreSQL + PostGIS
    ↓
Normalized Crime Density Layers
    ↓
GeoServer
    ↓
WMS / WFS
    ↓
OpenLayers
    ↓
Web GIS Crime Intelligence Dashboard
```

The dashboard uses GeoServer for spatial visualization and feature information.

---

## 11. Running the Python Import Script

The project Python script is located at:

```text
scripts/import_csv.py
```

Before running it, verify:

- Python is installed.
- Required Python packages are installed.
- PostgreSQL is running.
- Database connection parameters are correctly configured.

Run from the project root:

```cmd
python scripts/import_csv.py
```

If the script was designed to be run from a different working directory, follow the connection/path configuration defined inside the script.

Do not commit passwords, database credentials, or other secrets to GitHub.

---

## 12. Local Development Notes

For local development, the expected services are:

```text
PostgreSQL
    ↓
PostGIS
    ↓
GeoServer :8080
    ↓
Dashboard local server
```

GeoServer should normally be available at:

```text
http://localhost:8080/geoserver
```

If the dashboard is served from another local port, browser CORS configuration may be required for GeoServer WMS/WFS access.

Do not use `--disable-web-security` as a production deployment method. It is only a local development workaround.

---

## 13. Standalone Dashboard

A separate standalone dashboard has been generated with the normalized GeoJSON data embedded directly into the HTML.

Because the standalone HTML is very large, it is intentionally excluded from the GitHub repository.

The standalone version is hosted separately on Google Drive.

Download link:

```text
GOOGLE_DRIVE_LINK
```

Replace `GOOGLE_DRIVE_LINK` with the final Google Drive sharing link.

The standalone version is intended for users who want to open the dashboard without installing PostgreSQL, PostGIS, or GeoServer.

---

## 14. GitHub Repository Guidelines

The repository should contain:

- Source dashboard
- QGIS project
- Python processing script
- GeoServer SLD styles
- Required source/project data
- Documentation

The following should generally not be committed:

```text
standalone/*.html
*.geojson
.vscode/
__pycache__/
*.pyc
*.log
temporary files
database credentials
passwords
```

Large generated files should be hosted separately when necessary.

---

## 15. Project Status

The Web GIS workflow currently includes:

- 36 states and union territories
- 5 crime categories
- 3 selected years
- 15 normalized spatial layers
- PostGIS spatial processing
- GeoServer publication
- Crime-density SLD styling
- OpenLayers dashboard
- Cases-per-km² visualization
- Risk classification
- State-level feature information
- Standalone portable dashboard

---

## 16. Author

**Web GIS Crime Intelligence Dashboard**

Technology stack:

```text
PostgreSQL
PostGIS
GeoServer
QGIS
Python
OpenLayers
HTML
CSS
JavaScript
WMS
WFS
```
