import std.stdio;

void parse(char[] prog) {
    //flags
    bool comment;
    bool multiComment;
    //vars for storing stuff
    char last;
    foreach(c; prog) {
        //Comments
        if(multiComment) {
            if(last == '*' && c == '/') multiComment = false;
            last = c;
            continue;
        }
        else if(comment) {
            if(c == '\n') comment = false;
        }
        else if(last == '/') {
            if(c == '/') {
                comment = true;
            }
            else if(c == '*') {
                multiComment = true;
            }
        }
        else {
            //TODO: not sure what should be here
            write(c);
        }
        last = c;
    }
}