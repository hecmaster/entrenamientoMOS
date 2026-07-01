<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🏆 Quiz Interactivo MOS: Insertar, Diseño y Disposición</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        .quiz-container {
            max-width: 850px;
            margin: 0 auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        h1 {
            color: #005088;
            text-align: center;
            border-bottom: 3px solid #11caa0;
            padding-bottom: 10px;
        }
        .instructor-note {
            background-color: #e3f2fd;
            border-left: 5px solid #2196f3;
            padding: 15px;
            margin-bottom: 25px;
            border-radius: 4px;
            font-style: italic;
        }
        .question-card {
            background: #fafafa;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 25px;
        }
        .question-text {
            font-size: 18px;
            font-weight: bold;
            color: #005088;
            margin-bottom: 15px;
        }
        .options-container {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .option-btn {
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 6px;
            padding: 12px 15px;
            font-size: 16px;
            text-align: left;
            cursor: pointer;
            transition: all 0.2s ease;
        }
        .option-btn:hover:not([disabled]) {
            background-color: #f0f7ff;
            border-color: #005088;
        }
        .option-btn[disabled] {
            cursor: not-allowed;
        }
        .correct {
            background-color: #d4edda !important;
            border-color: #c3e6cb !important;
            color: #155724;
            font-weight: bold;
        }
        .incorrect {
            background-color: #f8d7da !important;
            border-color: #f5c6cb !important;
            color: #721c24;
        }
        .feedback-box {
            margin-top: 15px;
            padding: 12px;
            border-radius: 6px;
            font-size: 15px;
            display: none;
            line-height: 1.4;
        }
        .feedback-correct {
            background-color: #e2f0d9;
            border-left: 5px solid #385723;
            color: #385723;
        }
        .feedback-incorrect {
            background-color: #fff2cc;
            border-left: 5px solid #b25900;
            color: #b25900;
        }
        #result-panel {
            text-align: center;
            padding: 30px;
            background: #005088;
            color: white;
            border-radius: 12px;
            margin-top: 30px;
            display: none;
        }
        .submit-trigger {
            display: block;
            width: 100%;
            background: #11caa0;
            color: white;
            border: none;
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 20px;
        }
        .submit-trigger:hover {
            background: #0ea885;
        }
    </style>
</head>
<body>

<div class="quiz-container">
    <h1>🏆 EXAMEN DE SIMULACIÓN INTERACTIVO: NIVEL MUNDIAL</h1>
    <div class="instructor-note">
        <strong>Pestañas Evaluadas:</strong> Insertar, Diseño y Disposición (Word 2019). <br>
        <strong>Instrucciones:</strong> Selecciona una respuesta para cada pregunta. Al hacer clic, la plataforma validará tu selección de inmediato con su respectiva retroalimentación técnica. Al final, presiona el botón para calcular tu puntaje oficial.
    </div>

    <div id="quiz-questions"></div>

    <button class="submit-trigger" onclick="calculateFinalScore()">Finalizar Examen y Ver Resultado Mundial</button>

    <div id="result-panel">
        <h2>📊 RESULTADO DE EVALUACIÓN OFICIAL</h2>
        <p id="score-text" style="font-size: 24px; font-weight: bold;"></p>
        <p id="performance-feedback" style="font-size: 18px;"></p>
    </div>
</div>

<script>
const quizData = [
    {
        q: "1. Necesitas configurar el documento para que la orientación horizontal se aplique exclusivamente a partir de la página 3 en adelante. ¿Qué debes hacer antes de cambiar la orientación?",
        options: ["Insertar un salto de página simple en la página 2.", "Insertar un salto de sección (Página siguiente) al final de la página 2.", "Cambiar los márgenes a estrechos en todo el documento.", "Aplicar un conjunto de estilos diferentes en la página 3."],
        correct: 1,
        fbCorrect: "¡Excelente! Los saltos de sección dividen el documento en bloques independientes, permitiendo orientaciones geométricas distintas.",
        fbIncorrect: "Incorrecto. Un salto de página simple no separa las propiedades físicas del papel. Es estrictamente obligatorio un Salto de Sección (Página siguiente)."
    },
    {
        q: "2. Si deseas cambiar simultáneamente la combinación de fuentes, la paleta de colores y el interlineado predeterminado de todo tu documento con un solo clic, ¿qué herramienta de la pestaña Diseño debes utilizar?",
        options: ["Temas", "Marca de agua", "Efectos de texto", "Estilos de tabla"],
        correct: 0,
        fbCorrect: "¡Perfecto! Un 'Tema' en Word unifica las fuentes, los colores y los efectos estéticos de forma global.",
        fbIncorrect: "Incorrecto. Los Estilos de tabla solo afectan estructuras cuadriculadas. La herramienta global que cambia fuentes y colores corporativos al unísono es 'Temas'."
    },
    {
        q: "3. Al insertar un objeto SmartArt, necesitas modificar el orden de los cuadros enviando un elemento un nivel arriba en la jerarquía. ¿Qué comando de las herramientas dinámicas de SmartArt realiza esto velozmente?",
        options: ["Agregar forma", "Promover", "Disminuir nivel", "Derecha a izquierda"],
        correct: 1,
        fbCorrect: "¡Correcto! 'Promover' sube el nivel jerárquico del elemento seleccionado (útil en organigramas).",
        fbIncorrect: "Incorrecto. 'Disminuir nivel' baja el rango del elemento. El comando adecuado para subir de nivel es 'Promover'."
    },
    {
        q: "4. En la pestaña Disposición, dentro del grupo Configurar página, ¿cuál es la función de la herramienta 'Guiones'?",
        options: ["Insertar líneas horizontales divisorias entre párrafos.", "Cortar automáticamente las palabras al final de una línea para evitar espacios vacíos en texto justificado.", "Generar viñetas personalizadas con forma de guion.", "Separar las columnas de texto mediante líneas verticales."],
        correct: 1,
        fbCorrect: "¡Exacto! La herramienta 'Guiones' optimiza el flujo de lectura y previene la formación de ríos blancos en textos justificados.",
        fbIncorrect: "Incorrecto. La herramienta 'Guiones' sirve para activar la separación silábica automática cuando una palabra no cabe completa al final de la línea."
    },
    {
        q: "5. ¿Qué comando de la pestaña Insertar te permite añadir un campo de metadato automatizado en el texto, como el 'Nombre del autor' o el 'Título del documento', extraído de las propiedades del archivo?",
        options: ["WordArt", "Objeto flotante", "Partes rápidas > Propiedad del documento", "Hipervínculo"],
        correct: 2,
        fbCorrect: "¡Excepcional! Las 'Partes rápidas' o elementos rápidos son cruciales en el nivel Expert para automatizar campos de metadatos.",
        fbIncorrect: "Incorrecto. WordArt genera solo texto artístico estático. Para meter metadatos dinámicos vinculados a las propiedades de Word, debes usar 'Partes rápidas > Propiedad del documento'."
    },
    {
        q: "6. Si deseas aplicar una Marca de Agua personalizada que contenga un logotipo corporativo con un nivel de transparencia sutil, ¿cuál es la ruta correcta?",
        options: ["Insertar > Imagen > Detrás del texto.", "Diseño > Marca de agua > Marca de agua personalizada > Marca de agua de imagen.", "Disposición > Fondo de página > Imagen de marca.", "Diseño > Color de página > Efectos de relleno."],
        correct: 1,
        fbCorrect: "¡Muy bien! Las marcas de agua nativas (texto o imágenes) se configuran estrictamente desde el menú de la pestaña Diseño.",
        fbIncorrect: "Incorrecto. Insertar una imagen normal detrás del texto no la convierte en marca de agua formal de plantilla. La ruta exacta es: Diseño > Marca de agua > Marca de agua personalizada."
    },
    {
        q: "7. Estás configurando una sección de texto en 3 columnas en la pestaña Disposición y requieres que aparezca una línea vertical divisoria entre ellas. ¿Dónde se activa esta opción?",
        options: ["En el menú Bordes de página de la pestaña Diseño.", "Haciendo clic en Disposición > Columnas > Más columnas y marcando 'Línea entre columnas'.", "Insertando formas de líneas manuales desde la pestaña Insertar.", "Activando las líneas de cuadrícula en el panel de organizar."],
        correct: 1,
        fbCorrect: "¡Excelente! El cuadro de diálogo extendido 'Más columnas' oculta esta propiedad que Certiport evalúa con frecuencia.",
        fbIncorrect: "Incorrecto. Dibujar líneas manuales arruinaría la automatización del flujo del texto. Se activa abriendo Disposición > Columnas > Más columnas y marcando 'Línea entre columnas'."
    },
    {
        q: "8. ¿Qué tipo de salto debes utilizar si deseas cambiar los márgenes perimetrales de un solo párrafo específico sin alterar los márgenes del resto de la misma página?",
        options: ["Salto de página", "Salto de sección (Página siguiente)", "Salto de sección (Continuo)", "Salto de ajuste de texto"],
        correct: 2,
        fbCorrect: "¡Exacto! El salto de sección 'Continuo' crea una separación de propiedades de formato dentro de la misma hoja.",
        fbIncorrect: "Incorrecto. El salto 'Página siguiente' enviaría el texto a otra hoja. Para fragmentar propiedades de diseño en la misma hoja necesitas un Salto de Sección (Continuo)."
    },
    {
        q: "9. Necesitas insertar un gráfico de líneas para representar estadísticas y quieres que los datos se sigan editando a través de una pequeña hoja de cálculo integrada de Excel. ¿Qué herramienta usas?",
        options: ["Insertar > SmartArt > Líneas", "Insertar > Gráfico", "Insertar > Objeto > Modelo OLE", "Diseño > Formato del documento"],
        correct: 1,
        fbCorrect: "¡Así es! Insertar > Gráfico abre la biblioteca compartida con Microsoft Excel de forma nativa.",
        fbIncorrect: "Incorrecto. SmartArt no procesa matrices analíticas o numéricas de datos de Excel. La opción correcta es Insertar > Gráfico."
    },
    {
        q: "10. ¿Cuál es el comportamiento por defecto de la opción 'Espaciado Después' del grupo Párrafo en la pestaña Disposición?",
        options: ["Añade una cantidad fija de puntos (pto) de espacio en blanco debajo del párrafo actual cada vez que presionas Enter.", "Incrementa la separación horizontal entre las letras.", "Crea una sangría en la última línea del párrafo.", "Fuerza un salto de página automatizado."],
        correct: 0,
        fbCorrect: "¡Correcto! El espaciado posterior sustituye la mala práctica de presionar la tecla Enter dos veces para separar párrafos.",
        fbIncorrect: "Incorrecto. El espaciado posterior maneja la distancia vertical en puntos (pto) inmediatamente abajo del párrafo seleccionado."
    },
    {
        q: "11. En la pestaña Insertar, ¿para qué sirve la herramienta 'Vincular al anterior' dentro del modo de edición de Encabezados y Pies de página?",
        options: ["Para copiar el texto del cuerpo del documento en el encabezado.", "Para romper la relación de contenido entre la sección actual y la sección previa, permitiendo usar encabezados únicos.", "Para fusionar dos documentos de Word diferentes.", "Para repetir la portada en la segunda página."],
        correct: 1,
        fbCorrect: "¡Es correcto! Desmarcar 'Vincular al anterior' es la clave técnica absoluta para que los encabezados de diferentes secciones no se repliquen.",
        fbIncorrect: "Incorrecto. Por defecto, todas las secciones están vinculadas. Tienes que desactivar 'Vincular al anterior' para cortar esa relación y usar textos independientes."
    },
    {
        q: "12. Si necesitas agregar un borde decorativo que encuadre completamente los márgenes de todas las hojas del documento, ¿en qué grupo de la pestaña Diseño encuentras esta opción?",
        options: ["Formato del documento", "Temas corporativos", "Fondo de página > Bordes de página", "Configurar página"],
        correct: 2,
        fbCorrect: "¡Impecable! Los bordes decorativos de arte o líneas de página se alojan en el grupo Fondo de Página en Diseño.",
        fbIncorrect: "Incorrecto. El comando se encuentra al extremo derecho de la pestaña Diseño, bajo la herramienta Fondo de página > Bordes de página."
    },
    {
        q: "13. ¿Qué herramienta de la pestaña Disposición te permite ver una lista estructurada de todos los objetos flotantes (imágenes, formas, gráficos) insertados en la página para cambiar su orden de apilamiento o renombrarlos?",
        options: ["Posición", "Ajustar texto", "Panel de selección", "Alinear"],
        correct: 2,
        fbCorrect: "¡Brillante! El Panel de selección es indispensable para gestionar capas de objetos complejos que se enciman.",
        fbIncorrect: "Incorrecto. 'Ajustar texto' define cómo interactúa el párrafo con la imagen. El mapa de objetos se gestiona desde el Panel de Selección."
    },
    {
        q: "14. Al insertar una tabla de datos mediante la pestaña Insertar, ¿cuál es el comando correcto si requieres que las filas de la tabla alternen de color (una clara, una oscura) automáticamente?",
        options: ["Cambiar los colores manualmente en la pestaña Inicio.", "Activar la casilla 'Filas con bandas' en las Herramientas de tabla > Diseño de tabla.", "Aplicar un sombreado degradado al fondo de la página.", "Modificar el Espaciado de párrafo."],
        correct: 1,
        fbCorrect: "¡Exacto! Las 'Filas con bandas' mejoran la lectura de datos tabulares extensos de manera automatizada.",
        fbIncorrect: "Incorrecto. El formateo manual toma demasiado tiempo. Debes ir a las opciones de estilo de tabla y marcar 'Filas con bandas'."
    },
    {
        q: "15. ¿Qué comando de la pestaña Insertar te permite agregar una ecuación matemática compleja predefinida (como la fórmula cuadrática o el área del círculo) con un solo clic?",
        options: ["Símbolo", "Ecuación", "Objeto integrado", "SmartArt numérico"],
        correct: 1,
        fbCorrect: "¡Correcto! El botón 'Ecuación' inserta bloques de estructuras matemáticas avanzadas editables.",
        fbIncorrect: "Incorrecto. Símbolo añade caracteres o glifos individuales aislados. Las expresiones matemáticas complejas se insertan mediante 'Ecuación'."
    },
    {
        q: "16. Deseas que un documento tenga una paleta de colores específica (por ejemplo, tonos grises o azulados) sin alterar las fuentes tipográficas. ¿Qué botón de la pestaña Diseño ejecuta esto?",
        options: ["Fuentes", "Efectos", "Colores", "Temas"],
        correct: 2,
        fbCorrect: "¡Perfecto! El menú desplegable 'Colores' cambia únicamente la paleta de tintas del tema activo sin perturbar la tipografía elegida.",
        fbIncorrect: "Incorrecto. 'Temas' alteraría tanto colores como fuentes a la vez. Para cambiar exclusivamente las tonalidades de color, debes hacer clic en 'Colores'."
    },
    {
        q: "17. En la pestaña Disposición, ¿cuál es el tamaño de sangría predeterminado que se le aplica a un párrafo completo cuando presionas el comando 'Aumentar sangría'?",
        options: ["1 cm", "1.27 cm (0.5 pulgadas)", "2.54 cm", "0.5 cm"],
        correct: 1,
        fbCorrect: "¡Excelente! Word trabaja con la medida estándar de media pulgada (1.27 cm) para tabulaciones y sangrías directas.",
        fbIncorrect: "Incorrecto. Word obedece al estándar de diseño de 1.27 cm (equivalente exacto a 0.5 pulgadas) al aumentar sangrías básicas."
    },
    {
        q: "18. Deseas insertar un video en línea dentro de tu documento de Word de modo que se pueda reproducir directamente desde la página del archivo. ¿En qué grupo de la pestaña Insertar se aloja esta función?",
        options: ["Ilustraciones", "Multimedia", "Vínculos", "Texto"],
        correct: 1,
        fbCorrect: "¡Muy bien! El comando 'Vídeo en línea' pertenece al grupo especializado de Multimedia.",
        fbIncorrect: "Incorrecto. No está en Ilustraciones. La función nativa se encuentra localizada en el grupo específico denominado 'Multimedia'."
    },
    {
        q: "19. Si deseas establecer el diseño, los colores y las fuentes de tu documento actual como la plantilla base predeterminada para todos los nuevos documentos en blanco que crees en el futuro, ¿qué botón de la pestaña Diseño debes usar?",
        options: ["Establecer como predeterminado", "Guardar tema actual", "Efectos globales", "Restablecer plantilla"],
        correct: 0,
        fbCorrect: "¡Excelente conocimiento técnico! 'Establecer como predeterminado' modifica la plantilla global Normal.dotm de Word.",
        fbIncorrect: "Incorrecto. Guardar el tema solo lo almacena en el disco. Para obligar a Word a usarlo en cada archivo nuevo, debes presionar 'Establecer como predeterminado'."
    },
    {
        q: "20. Si aplicas una configuración de márgenes 'Reflejados' en la pestaña Disposición, ¿cuál es su propósito técnico principal?",
        options: ["Hacer que el texto se lea al revés como en un espejo.", "Configurar el documento para impresión a doble cara, donde los márgenes internos de las páginas pares e impares sean simétricos para la encuadernación.", "Invertir la posición de las imágenes automáticamente.", "Duplicar el contenido del encabezado en el pie de página."],
        correct: 1,
        fbCorrect: "¡Perfecto! Has completado las 20 preguntas con criterios de nivel experto. Los márgenes reflejados (interior y exterior) son indispensables para la edición de libros y revistas impresas.",
        fbIncorrect: "Incorrecto. No tiene que ver con un efecto espejo visual en las letras. Los márgenes reflejados sirven para preparar documentos destinados a encuadernación e impresión por ambas caras."
    }
];

function renderQuiz() {
    const container = document.getElementById('quiz-questions');
    quizData.forEach((item, qIndex) => {
        const card = document.createElement('div');
        card.className = 'question-card';
        
        const qText = document.createElement('div');
        qText.className = 'question-text';
        qText.innerText = item.q;
        card.appendChild(qText);
        
        const optionsContainer = document.createElement('div');
        optionsContainer.className = 'options-container';
        
        item.options.forEach((option, oIndex) => {
            const btn = document.createElement('button');
            btn.className = 'option-btn';
            btn.innerText = option;
            btn.onclick = () => checkAnswer(qIndex, oIndex, btn);
            optionsContainer.appendChild(btn);
        });
        
        card.appendChild(optionsContainer);
        
        const fbBox = document.createElement('div');
        fbBox.id = `fb-${qIndex}`;
        fbBox.className = 'feedback-box';
        card.appendChild(fbBox);
        
        container.appendChild(card);
    });
}

function checkAnswer(qIndex, selectedIndex, clickedBtn) {
    const item = quizData[qIndex];
    const card = clickedBtn.parentElement;
    const buttons = card.getElementsByClassName('option-btn');
    const fbBox = document.getElementById(`fb-${qIndex}`);
    
    // Deshabilitar todos los botones de esta pregunta para que no cambie la respuesta
    for (let btn of buttons) {
        btn.disabled = true;
    }
    
    if (selectedIndex === item.correct) {
        clickedBtn.classList.add('correct');
        fbBox.innerText = item.fbCorrect;
        fbBox.classList.add('feedback-correct');
        clickedBtn.setAttribute('data-points', '1');
    } else {
        clickedBtn.classList.add('incorrect');
        buttons[item.correct].classList.add('correct'); // Mostrar la correcta
        fbBox.innerText = item.fbIncorrect;
        fbBox.classList.add('feedback-incorrect');
        clickedBtn.setAttribute('data-points', '0');
    }
    fbBox.style.display = 'block';
}

function calculateFinalScore() {
    const correctButtons = document.querySelectorAll('.option-btn.correct[data-points="1"]');
    const score = correctButtons.length;
    const total = quizData.length;
    
    const resultPanel = document.getElementById('result-panel');
    const scoreText = document.getElementById('score-text');
    const performanceFeedback = document.getElementById('performance-feedback');
    
    scoreText.innerText = `Aciertos: ${score} / ${total} preguntas.`;
    
    if (score >= 18) {
        performanceFeedback.innerHTML = "🎯 <strong>NIVEL CAMPEÓN MUNDIAL (Puntaje estimado: >900 pts).</strong> Dominio impecable de la arquitectura, jerarquía y diseño del documento. Estás listo para competir por el podio en USA.";
    } else if (score >= 14) {
        performanceFeedback.innerHTML = "⚠️ <strong>NIVEL COMPETENTE (Puntaje estimado: 700-850 pts).</strong> Conoces las herramientas pero cometiste fallos en configuraciones complejas (saltos de sección o metadatos). Refuerza con Jasperactive.";
    } else {
        performanceFeedback.innerHTML = "🚨 <strong>NIVEL REPASO REQUERIDO (Puntaje estimado: <700 pts).</strong> Hay confusión crítica entre la aplicación estética manual y la automatizada. Es urgente repasar las guías antes de programar los simulacros oficiales.";
    }
    
    resultPanel.style.display = 'block';
    window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
}

// Inicializar el examen al cargar
renderQuiz();
</script>

</body>
</html>