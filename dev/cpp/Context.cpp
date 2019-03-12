#include "Context.h"

// Shaders
std::string vertex_source =
    "attribute vec4 position;   \n"
    "attribute vec2 texCoord;   \n"
    "varying vec2 v_texCoord;     \n"
    "void main()                  \n"
    "{                            \n"
    "   gl_Position = position; \n"
    "   v_texCoord = texCoord;  \n"
    "}                            \n";

std::string mix_images_fragment_source =
    "precision mediump float;                            \n"
    "varying vec2 v_texCoord;                            \n"
    "uniform sampler2D texture1;                        \n"
    "uniform sampler2D texture2;                        \n"
    "uniform float width;  \n"
    "uniform float height;  \n"
    "void main()                                         \n"
    "{        \n"
    "  vec4 pixel = texture2D(texture1, v_texCoord);              \n"
    "  vec4 n[9];\n"

    "  float w = 1.0 / width;\n"
    "  float h = 1.0 / height;\n"

    "  n[0] = texture2D(texture1, v_texCoord + vec2(0.0, 0.0) );\n"
    "  n[1] = texture2D(texture1, v_texCoord + vec2(w, 0.0) );\n"
    "  n[2] = texture2D(texture1, v_texCoord + vec2(2.0*w, 0.0) );\n"
    "  n[3] = texture2D(texture1, v_texCoord + vec2(0.0*w, h) );\n"
    "  n[4] = texture2D(texture1, v_texCoord + vec2(w, h) );\n"
    "  n[5] = texture2D(texture1, v_texCoord + vec2(2.0*w, h) );\n"
    "  n[6] = texture2D(texture1, v_texCoord + vec2(0.0, 2.0*h) );\n"
    "  n[7] = texture2D(texture1, v_texCoord + vec2(w, 2.0*h) );\n"
    "  n[8] = texture2D(texture1, v_texCoord + vec2(2.0*w, 2.0*h) );\n"

    "  vec4 sobel_x = n[2] + (2.0*n[5]) + n[8] - (n[0] + (2.0*n[3]) + n[6]);\n"
    "  vec4 sobel_y = n[0] + (2.0*n[1]) + n[2] - (n[6] + (2.0*n[7]) + n[8]);\n"

    "  float avg_x = (sobel_x.r + sobel_x.g + sobel_x.b) / 3.0;\n"
    "  float avg_y = (sobel_y.r + sobel_y.g + sobel_y.b) / 3.0;\n"

    "  sobel_x.r = avg_x;\n"
    "  sobel_x.g = avg_x;\n"
    "  sobel_x.b = avg_x;\n"
    "  sobel_y.r = avg_y;\n"
    "  sobel_y.g = avg_y;\n"
    "  sobel_y.b = avg_y;\n"

    "  vec3 sobel = vec3(sqrt((sobel_x.rgb * sobel_x.rgb) + (sobel_y.rgb * sobel_y.rgb)));\n"
    "  vec4 color1 = vec4( sobel, 1.0 ) * 0.5;   \n"  

    "  pixel = texture2D(texture2, v_texCoord);              \n"
    "  n[0] = texture2D(texture2, v_texCoord + vec2(0.0, 0.0) );\n"
    "  n[1] = texture2D(texture2, v_texCoord + vec2(w, 0.0) );\n"
    "  n[2] = texture2D(texture2, v_texCoord + vec2(2.0*w, 0.0) );\n"
    "  n[3] = texture2D(texture2, v_texCoord + vec2(0.0*w, h) );\n"
    "  n[4] = texture2D(texture2, v_texCoord + vec2(w, h) );\n"
    "  n[5] = texture2D(texture2, v_texCoord + vec2(2.0*w, h) );\n"
    "  n[6] = texture2D(texture2, v_texCoord + vec2(0.0, 2.0*h) );\n"
    "  n[7] = texture2D(texture2, v_texCoord + vec2(w, 2.0*h) );\n"
    "  n[8] = texture2D(texture2, v_texCoord + vec2(2.0*w, 2.0*h) );\n"

    "  sobel_x = n[2] + (2.0*n[5]) + n[8] - (n[0] + (2.0*n[3]) + n[6]);\n"
    "  sobel_y = n[0] + (2.0*n[1]) + n[2] - (n[6] + (2.0*n[7]) + n[8]);\n"

    "  avg_x = (sobel_x.r + sobel_x.g + sobel_x.b) / 3.0;\n"
    "  avg_y = (sobel_y.r + sobel_y.g + sobel_y.b) / 3.0;\n"

    "  sobel_x.r = avg_x;\n"
    "  sobel_x.g = avg_x;\n"
    "  sobel_x.b = avg_x;\n"
    "  sobel_y.r = avg_y;\n"
    "  sobel_y.g = avg_y;\n"
    "  sobel_y.b = avg_y;\n"

    "  sobel = vec3(sqrt((sobel_x.rgb * sobel_x.rgb) + (sobel_y.rgb * sobel_y.rgb)));\n"
    "  vec4 color2 = vec4( sobel, 1.0 ) * 0.5;   \n"                             
    "  gl_FragColor = color1 + color2;   \n"
    "}                                                   \n";

GLuint CompileShader (GLenum type, std::string *source) {
    // Create shader object
    const GLchar* sourceString[1];
    GLint sourceStringLengths[1];

    sourceString[0] = source->c_str();
    sourceStringLengths[0] = source->length();
    GLuint shader = glCreateShader(type);

    if (shader == 0) {
        return 0;
    }

    // Assign and compile the source to the shader object
    glShaderSource(shader, 1, sourceString, sourceStringLengths);
    glCompileShader(shader);

    // Check if there were errors
    int infoLen = 0;
    glGetShaderiv( shader, GL_INFO_LOG_LENGTH, &infoLen );

    if (infoLen > 1) {

        char infoLog[infoLen];

        // And print them out
        glGetShaderInfoLog( shader, infoLen, NULL, infoLog );

        free ( infoLog );
    }

    return shader;
}

void Context::setupTexture(const GLchar * name, GLenum texture, GLuint texId, int samplerNum) {
    GLint textureLoc = glGetUniformLocation(programObject, name);
    glUniform1i(textureLoc, samplerNum);
    glActiveTexture(texture);
    glBindTexture(GL_TEXTURE_2D, texId);
}

Context::Context (int w, int h, char * id, GLuint texture1, GLuint texture2) {

    width = w;
    height = h;
    textureLoc1 = texture1;
    textureLoc2 = texture2;

    // Context configurations
    EmscriptenWebGLContextAttributes attrs;
    attrs.explicitSwapControl = 0;
    attrs.depth = 1;
    attrs.stencil = 1;
    attrs.antialias = 1;
    attrs.majorVersion = 1;
    attrs.minorVersion = 0;

    context = emscripten_webgl_create_context(id, &attrs);
    emscripten_webgl_make_context_current(context);

    // Compile shaders
    fragmentShader = CompileShader(GL_FRAGMENT_SHADER, &mix_images_fragment_source);
    vertexShader = CompileShader(GL_VERTEX_SHADER, &vertex_source);

    // Build program
    programObject = glCreateProgram();

    glAttachShader(programObject, vertexShader);
    glAttachShader(programObject, fragmentShader);

    glBindAttribLocation(programObject, 0, "position");

    glLinkProgram(programObject);
    glValidateProgram(programObject);
    glUseProgram( programObject );

    float widthUniform = glGetUniformLocation(programObject, "width");
    float heightUniform = glGetUniformLocation(programObject, "height");
    glUniform1f(widthUniform, (float) width);
    glUniform1f(heightUniform, (float) height);
    setupTexture("texture1", GL_TEXTURE0, textureLoc1, 0);
    setupTexture("texture2", GL_TEXTURE1, textureLoc2, 1);    
    GLuint vertexObject;
    GLuint indexObject;

        // Get the attribute/sampler locations
    GLint positionLoc = glGetAttribLocation(programObject, "position");
    GLint texCoordLoc = glGetAttribLocation(programObject, "texCoord");

    // Vertex data of texture bounds
    GLfloat vVertices[] = { -1.0,  1.0, 0.0, 0.0, 0.0, -1.0, -1.0, 0.0, 0.0, 1.0,
                             1.0, -1.0, 0.0, 1.0,  1.0, 1.0, 1.0, 0.0, 1.0,  0.0};
    GLushort indices[] = { 0, 1, 2, 0, 2, 3 };

    glGenBuffers(1, &vertexObject);
    glBindBuffer(GL_ARRAY_BUFFER, vertexObject);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vVertices), vVertices, GL_STATIC_DRAW);

    glGenBuffers(1, &indexObject);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indexObject);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);

    // Set the viewport
    glViewport(0, 0, width, height);
    glClear(GL_COLOR_BUFFER_BIT);

    // Load and enable the vertex position and texture coordinates
    glVertexAttribPointer(positionLoc, 3, GL_FLOAT, GL_FALSE, 5 * sizeof(GLfloat), 0);
    glVertexAttribPointer(texCoordLoc, 2, GL_FLOAT, GL_FALSE, 5 * sizeof(GLfloat), (GLvoid*) (3 * sizeof(GLfloat)));

    glEnableVertexAttribArray(positionLoc);
    glEnableVertexAttribArray(texCoordLoc);
}

Context::~Context (void) {
    emscripten_webgl_destroy_context(context);
}

void Context::run () {
// Make the context current and use the program
    emscripten_webgl_make_context_current(context);

    // Draw
    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_SHORT, 0);
}