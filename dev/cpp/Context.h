

class Context {
public:
    Context (int width, int height, char * id, GLuint texture1, GLuint texture2);

    ~Context (void);

    void run ();

private:
void setupTexture(const GLchar * name, GLenum texture, GLuint texId, int samplerNum);

    int width;
    int height;

    GLuint programObject;
    GLuint vertexShader;
    GLuint fragmentShader;
    GLuint textureLoc1;
    GLuint textureLoc2;

    EMSCRIPTEN_WEBGL_CONTEXT_HANDLE context;

};