<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOS Word 2026 - Master Training Panel</title>
    <style>
        :root {
            --bg-gradient: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            --card-bg: rgba(255, 255, 255, 0.03);
            --card-border: rgba(255, 255, 255, 0.08);
            --text-primary: #f8fafc;
            --text-secondary: #94a3b8;
            --word-blue: #2b579a;
            --word-blue-glow: #3b82f6;
            --accent-disabled: #475569;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: var(--bg-gradient);
            min-height: 100vh;
            color: var(--text-primary);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        header {
            text-align: center;
            margin-bottom: 3rem;
            max-width: 800px;
        }

        header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            letter-spacing: -0.05em;
            margin-bottom: 0.5rem;
            background: linear-gradient(to right, #ffffff, #93c5fd);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        header p {
            color: var(--text-secondary);
            font-size: 1.1rem;
        }

        /* Contenedor Grid: 4 columnas x 2 filas */
        .grid-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-template-rows: repeat(2, 1fr);
            gap: 1.5rem;
            width: 100%;
            max-width: 1200px;
        }

        /* Estilos base de las Tarjetas */
        .exam-card {
            background: var(--card-bg);
            border: 1px solid var(--card-border);
            border-radius: 16px;
            padding: 2rem;
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            text-decoration: none;
        }

        /* Tarjeta Habilitada (Quiz 1) */
        .exam-card.active {
            cursor: pointer;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.2);
        }

        .exam-card.active::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, var(--word-blue), var(--word-blue-glow));
        }

        .exam-card.active:hover {
            transform: translateY(-8px);
            border-color: rgba(59, 130, 246, 0.4);
            box-shadow: 0 10px 30px rgba(43, 87, 154, 0.25);
            background: rgba(255, 255, 255, 0.05);
        }

        /* Tarjetas Deshabilitadas */
        .exam-card.disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .exam-card.disabled::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: var(--accent-disabled);
        }

        /* Elementos internos de las tarjetas */
        .badge {
            align-self: flex-start;
            font-size: 0.75rem;
            text-transform: uppercase;
            font-weight: 700;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            margin-bottom: 1.5rem;
            letter-spacing: 0.05em;
        }

        .active .badge {
            background: rgba(43, 87, 154, 0.2);
            color: #60a5fa;
            border: 1px solid rgba(59, 130, 246, 0.3);
        }

        .disabled .badge {
            background: rgba(71, 85, 105, 0.2);
            color: var(--text-secondary);
            border: 1px solid rgba(71, 85, 105, 0.3);
        }

        .exam-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 0.75rem;
            color: var(--text-primary);
        }

        .exam-description {
            font-size: 0.9rem;
            color: var(--text-secondary);
            line-height: 1.5;
            margin-bottom: 1.5rem;
        }

        .action-text {
            font-size: 0.85rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: auto;
        }

        .active .action-text {
            color: #3b82f6;
        }

        .disabled .action-text {
            color: var(--accent-disabled);
        }

        /* Responsividad básica para pantallas medianas/pequeñas */
        @media (max-width: 1024px) {
            .grid-container {
                grid-template-columns: repeat(2, 1fr);
                grid-template-rows: auto;
            }
        }

        @media (max-width: 640px) {
            .grid-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <header>
        <h1>MOS Word World Championship 2026</h1>
        <p>Panel de Entrenamiento Avanzado para el Representante Nacional</p>
    </header>

    <div class="grid-container">
        
        <a href="quiz1.html" class="exam-card active">
            <div>
                <span class="badge">Disponible</span>
                <h2 class="exam-title">Examen Práctico 1</h2>
                <p class="exam-description">Domina la gestión avanzada de documentos. Evaluación intensiva sobre las pestañas <strong>Insertar, Diseño y Disposición</strong>.</p>
            </div>
            <div class="action-text">
                Iniciar Simulación &rarr;
            </div>
        </a>

        <div class="exam-card disabled">
            <div>
                <span class="badge">Bloqueado</span>
                <h2 class="exam-title">Examen Práctico 2</h2>
                <p class="exam-description">Referencias complejas, tablas de contenido, notas al pie y administración de fuentes bibliográficas (Normas APA/MLA).</p>
            </div>
            <div class="action-text">
                No disponible temporalmente
            </div>
        </div>

        <div class="exam-card disabled">
            <div>
                <span class="badge">Bloqueado</span>
                <h2 class="exam-title">Examen Práctico 3</h2>
                <p class="exam-description">Combinación de correspondencia avanzada, automatización de campos y preparación de documentos maestros.</p>
            </div>
            <div class="action-text">
                No disponible temporalmente
            </div>
        </div>

        <div class="exam-card disabled">
            <div>
                <span class="badge">Bloqueado</span>
                <h2 class="exam-title">Examen Práctico 4</h2>
                <p class="exam-description">Revisión avanzada, control de cambios, protección estricta de documentos y restricciones de edición.</p>
            </div>
            <div class="action-text">
                No disponible temporalmente
            </div>
        </div>

        <div class="exam-card disabled">
            <div>
                <span class="badge">Bloqueado</span>
                <h2 class="exam-title">Expert Challenge A</h2>
                <p class="exam-description">Macros VBA aplicadas a Word, creación y administración de bloques de creación (*Building Blocks*) personalizados.</p>
            </div>
            <div class="action-text">
                No disponible temporalmente
            </div>
        </div>

        <div class="exam-card disabled">
            <div>
                <span class="badge">Bloqueado</span>
                <h2 class="exam-title">Expert Challenge B</h2>
                <p class="exam-description">Configuración de plantillas corporativas avanzadas, XML personalizado y control de contenido de formularios.</p>
            </div>
            <div class="action-text">
                No disponible temporalmente
            </div>
        </div>

        <div class="exam-card disabled">
            <div>
                <span class="badge">Bloqueado</span>
                <h2 class="exam-title">Maratón de Tiempo</h2>
                <p class="exam-description">Simulación de velocidad competitiva. 50 proyectos rápidos bajo el formato y presión exacta del examen mundial.</p>
            </div>
            <div class="action-text">
                No disponible temporalmente
            </div>
        </div>

        <div class="exam-card disabled">
            <div>
                <span class="badge">Bloqueado</span>
                <h2 class="exam-title">Simulacro Final 2026</h2>
                <p class="exam-description">Proyecto integrador definitivo con criterios de evaluación basados rigurosamente en la rúbrica internacional de Certiport.</p>
            </div>
            <div class="action-text">
                No disponible temporalmente
            </div>
        </div>

    </div>

</body>
</html>