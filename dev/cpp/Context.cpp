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
    "precision mediump float;\n"    
    "varying vec2 v_texCoord;\n"    
    "uniform sampler2D texture1;\n"    
    "\n"
    "uniform float shadows;\n"
    "uniform float highlights;\n"
    "\n"
    "const vec3 luminanceWeighting = vec3(0.3, 0.3, 0.3);\n"
    "\n"
    "void main()     \n"
    "{  \n"
      "vec4 source = texture2D(texture1, v_texCoord);\n"
      "float luminance = dot(source.rgb, luminanceWeighting);\n"
    "\n"
      "float shadow = clamp((pow(luminance, 1.0/shadows) + (-0.76)*pow(luminance, 2.0/shadows)) - luminance, 0.0, 1.0);\n"
      "float highlight = clamp((1.0 - (pow(1.0-luminance, 1.0/(2.0-highlights)) + (-0.8)*pow(1.0-luminance, 2.0/(2.0-highlights)))) - luminance, -1.0, 0.0);\n"
      "vec3 result = vec3(0.0, 0.0, 0.0) + ((luminance + shadow + highlight) - 0.0) * ((source.rgb - vec3(0.0, 0.0, 0.0))/(luminance - 0.0));\n"
"\n"
      "float contrastedLuminance = ((luminance - 0.5) * 1.5) + 0.5;\n"
      "float whiteInterp = contrastedLuminance*contrastedLuminance*contrastedLuminance;\n"
      "float whiteTarget = clamp(highlights, 1.0, 2.0) - 1.0;\n"
      "result = mix(result, vec3(1.0), whiteInterp*whiteTarget);\n"
"\n"
      "float invContrastedLuminance = 1.0 - contrastedLuminance;\n"
      "float blackInterp = invContrastedLuminance*invContrastedLuminance*invContrastedLuminance;\n"
      "float blackTarget = 1.0 - clamp(shadows, 0.0, 1.0);\n"
      "result = mix(result, vec3(0.0), blackInterp*blackTarget);\n"
"\n"
      "gl_FragColor = vec4(result, source.a);\n"
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

Context::Context (int w, int h, char * id, GLuint texture1) {
    width = w;
    height = h;
    textureLoc1 = texture1;

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

    float shadowsUniform = glGetUniformLocation(programObject, "shadows");
    float highlightsUniform = glGetUniformLocation(programObject, "highlights");
    glUniform1f(shadowsUniform, 2.00);
    glUniform1f(highlightsUniform, 0.1);
    setupTexture("texture1", GL_TEXTURE0, textureLoc1, 0); 
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