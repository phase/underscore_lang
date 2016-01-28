import std.stdio;

class Token {
    // Base Token Class
}

class Identifier : Token {
    string identifier;
    
    this(string s) {
        identifier = s;
    }
}

void parse(char[] prog) {
    Token[] tokens;
    //flags
    bool comment;
    bool multiComment;
    //vars for storing stuff
    char last;
    char[] buf;
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
        else if(alphnum(c)) {
            buf ~= c;
        }
        else if(c == ' ') {
            if(buf != "") {
                tokens ~= new Identifier(buf);
            }
        }
        else {
            //TODO: not sure what should be here
            write(c);
        }
        last = c;
    }
}

bool alphnum(char c) {
    return (c>='a' && c<='z') || (c>='A' && c<='Z') || (ch>='0' && ch<='9'))
}