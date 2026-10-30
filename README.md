# 🚀 Reto Automatización de APIs con Karate Framework

Framework profesional de pruebas automatizadas de APIs desarrollado desde cero, aplicando estándares corporativos de automatización, Clean Code e Integración Continua (CI/CD).

## 🛠️ Tecnologías y Herramientas Utilizadas
- **Lenguaje:** Java (JDK 21)
- **Framework de Testing:** Karate (JUnit 5)
- **Gestor de Dependencias:** Maven
- **Control de Versiones:** Git & GitHub
- **CI/CD:** Azure DevOps Pipelines
- **API de Pruebas:** Swagger Petstore (Flujo CRUD Completo)

---

## 📂 Estructura del Proyecto

La arquitectura sigue el estándar de la industria, separando estrictamente el código ejecutable de Java, los archivos de configuración y los recursos de pruebas:

```text
📁 src
 └── 📁 test
      ├── 📁 java
      │    └── ☕ TestRunner.java               <-- Runner centralizado para la ejecución de pruebas
      │  
      └── 📁 resources
           ├── 📄 karate-config.js              <-- Configuración global (Variables de entorno y URL base)
           │
           └── 📁 json                          <-- Payloads externos independientes (Clean Code)
                └── 📄 new-pet.json             <-- Cuerpo JSON para la creación de recursos
           │
           └── 📁 features                      <-- Archivos Gherkin (.feature)
                └── 📄 petstore-crud.feature    <-- Flujo secuencial completo (POST, GET, PUT, DELETE, 404)
```

---

## 🧪 Cobertura del Flujo de Pruebas (CRUD + Pruebas Negativas)

El framework valida un ciclo transaccional completo utilizando la API de Swagger Petstore:
1. **`POST /pet`:** Creación de una nueva mascota utilizando un payload externo en JSON, capturando y validando datos dinámicos.
2. **`GET /pet/{id}`:** Consulta del recurso creado para verificar la integridad de los datos.
3. **`PUT /pet`:** Actualización del estado de la mascota en el sistema.
4. **`DELETE /pet/{id}`:** Eliminación lógica/física del recurso.
5. **Prueba Negativa (`404 Not Found`):** Validación de que al intentar consultar un recurso previamente eliminado, la API responde con el código de error esperado.

---

## ⚙️ Ejecución Local

Para ejecutar las pruebas de forma local utilizando Maven, asegúrate de tener Java instalado y ejecuta el siguiente comando en la terminal desde la raíz del proyecto:

```bash
mvn clean test
```

Los reportes detallados en formato HTML se generan automáticamente tras la ejecución en la ruta:
`target/karate-reports/karate-summary.html`

---

## 🔄 Integración Continua (CI/CD)

El repositorio cuenta con un pipeline configurado en **Azure DevOps** que se encarga de:
- Ejecutar la compilación y las pruebas limpias mediante Maven (`mvn clean test`).
- Publicar los resultados de las pruebas en formato JUnit XML.
- Generar artefactos descargables con los reportes HTML de Karate tras cada ejecución del build.