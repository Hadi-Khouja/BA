# Policy Test App
Die App ist eine Testanwendung für die Nutzung von Open Policy Agent zur Verwaltung von Zugriffsrechten für ein Dokumentenmanagementsystem.

### Voraussetzungen 
* [Docker](https://docs.docker.com/get-docker/) muss auf dem System installiert sein.

### Ausführungsanweisung
Öffnen Sie das Verzeichnis im Terminal und geben Sie folgenden Befehl ein:
```
docker-compose up
```
Anschließend im Browser zu http://localhost:8000 navigieren.

## Projektaufbau
* Unter Verzeichnis `policy` befinden sich die Rego-Dateien
* Unter Verzeichnis `bundles` befinden sich die Rego-Skripte im `tar.gz` Format
* Unter Verzeichnis `sql` befinden sich die Statements zum Erstellen und befüllen der Datenbank
* Unter Verzeichnis `nginx` befindet sich die `nginx.conf` Datei, die die Konfiguration der Policy API Server enthält
* Unter Verzeichnis `policy-app` befindet sich der Angular Workspace sowie alle nötigen Dateien für die Erstellung des Frontends
* Unter Verzeichnis `Examples` befinden sich die Beispieldateien aus der Grundlagenkapitel. Diese Dateien spielen keine Rolle für das Projekt
