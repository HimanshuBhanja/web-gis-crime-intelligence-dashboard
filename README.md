# Web GIS Crime Intelligence Dashboard

An interactive Web GIS dashboard for visualizing and comparing crime intensity across Indian states and union territories using normalized crime density (`cases_per_km2`).

## Standalone Dashboard

**Download and open the complete standalone dashboard directly in your browser:**

👉 **[Download Standalone Dashboard (Google Drive)](https://drive.google.com/file/d/1VgLT-19lNXuajLz4wjCYd_gd8CI7__9X/view?usp=drive_link)**

> The standalone version contains the normalized crime GeoJSON data embedded directly into the HTML. Due to its large file size, it is hosted on Google Drive instead of GitHub.

---

## Project Overview

An interactive Web GIS dashboard for visualizing and comparing crime intensity across Indian states and union territories using normalized crime density (`cases_per_km2`).

## Project Overview

The project integrates **PostgreSQL/PostGIS, Python, GeoServer, QGIS, WMS/WFS, and OpenLayers** into an end-to-end spatial crime intelligence workflow.

Crime categories:
- Burglary
- Theft
- Robbery
- Dacoity
- Criminal Breach of Trust

Years:
- 2001
- 2005
- 2010

Crime intensity is normalized using:

```text
cases_per_km2 = total_cases / area_km2
```

This allows comparison between states/UTs with different geographical areas.

## Key Features

- Interactive India state/UT Web GIS map
- OpenLayers-based visualization
- GeoServer WMS/WFS integration
- Synchronized year maps
- State-level feature information
- Total cases, area and cases/km²
- Top-risk state visualization
- Crime-specific normalized classification
- Five crime categories across three selected years
- Portable standalone dashboard

## Technology Stack

| Technology | Purpose |
|---|---|
| Python | Data processing and import workflow |
| PostgreSQL | Relational database |
| PostGIS | Spatial database and analysis |
| GeoServer | Geospatial web services |
| QGIS | GIS visualization and project management |
| OpenLayers | Web map visualization |
| HTML/CSS/JavaScript | Dashboard interface and logic |
| WMS/WFS | Geospatial web services |

## System Architecture

```text
Crime Data
    ↓
Python Data Processing
    ↓
PostgreSQL + PostGIS
    ↓
Normalized Crime Density
    ↓
GeoServer
    ↓
WMS / WFS
    ↓
OpenLayers
    ↓
Web GIS Crime Intelligence Dashboard
```

## Normalized Spatial Layers

The dashboard uses 15 normalized layers:

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

Main attributes:

```text
state_name
total_cases
area_km2
cases_per_km2
geom
```

State boundary data uses:

```text
EPSG:4326
```

## Crime Density Classification

Each crime type uses its own normalized density thresholds.

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

## Repository Structure

```text
Web-GIS-Crime-Intelligence-Dashboard/
│
├── README.md
├── .gitignore
│
├── dashboard/
│   └── India_Crime_Intelligence_Dashboard.html
│
├── data/
│   └── 10_Property_stolen_and_recovered.csv
│
├── docs/
│   └── setup.md
│
├── geoserver/
│   └── styles/
│       ├── burglary_density.sld
│       ├── criminal_breach_of_trust_density.sld
│       ├── dacoity_density.sld
│       ├── robbery_density.sld
│       └── theft_density.sld
│
├── qgis/
│   └── all_layers.qgz
│
├── scripts/
│   └── import_csv.py
│
└── standalone/
    └── README.md
```

## Running Locally

### Start GeoServer

```cmd
set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.11.10-hotspot"
cd /d "C:\Program Files\GeoServer\bin"
startup.bat
```

Verify:

```text
http://localhost:8080/geoserver
```

### Start the Dashboard

Serve the dashboard using VS Code Live Server or another local HTTP server.

```text
dashboard/India_Crime_Intelligence_Dashboard.html
```

### Local Chrome Development Mode

If browser cross-origin restrictions prevent the dashboard from accessing the local GeoServer instance:

```cmd
start chrome --disable-web-security --user-data-dir="C:\temp\crime_dashboard"
```

Alternative:

```cmd
start chrome --disable-web-security --user-data-dir="C:/temp"
```

**Important:** `--disable-web-security` is only a local development/testing workaround and should not be used for production deployment or normal browsing.

Detailed instructions are available in `docs/setup.md`.

## Standalone Dashboard

A separate standalone dashboard contains the normalized GeoJSON data embedded directly into the HTML.

Because the standalone HTML is larger than GitHub's individual-file size limit, it is hosted separately on Google Drive.

The download link is provided in:

```text
standalone/README.md
```

## Data Workflow

```text
Crime Dataset
      ↓
Data Cleaning / Processing
      ↓
PostgreSQL
      ↓
PostGIS Spatial Processing
      ↓
cases_per_km2
      ↓
Normalized Spatial Layers
      ↓
GeoServer
      ↓
WMS / WFS
      ↓
OpenLayers
      ↓
Interactive Web GIS Dashboard
```

## QGIS Project

The QGIS project is available at:

```text
qgis/all_layers.qgz
```

## GeoServer Styles

The five crime-specific styles are available under:

```text
geoserver/styles/
```

```text
burglary_density.sld
theft_density.sld
robbery_density.sld
dacoity_density.sld
criminal_breach_of_trust_density.sld
```

## Project Objectives

1. Integrate crime statistics with spatial boundaries.
2. Store and process spatial crime data using PostGIS.
3. Normalize crime counts by geographical area.
4. Publish spatial layers through GeoServer.
5. Develop an interactive Web GIS dashboard.
6. Compare crime intensity across states and UTs.
7. Provide a portable standalone visualization for demonstration and sharing.

## Notes

- The GitHub repository contains the project source and configuration files.
- The large standalone HTML is intentionally excluded from GitHub.
- Generated GeoJSON files are not required in the main repository.
- Database passwords, credentials, and other secrets should never be committed.
- Local GeoServer paths may need adjustment depending on the installation.

## License

Add the appropriate license before public release if this project is intended to be distributed or reused.

## Author

**Web GIS Crime Intelligence Dashboard**

`GIS` · `WebGIS` · `PostGIS` · `PostgreSQL` · `GeoServer` · `QGIS` · `OpenLayers` · `Spatial Analysis`
