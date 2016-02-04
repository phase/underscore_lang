import std.stdio;
import std.ascii;
import std.conv;
import std.algorithm;

class Token {
    // Base Token Class
}

class Identifier : Token {
    string identifier;
    
    this(string s) {
        identifier = s;
    }
}

class IntegerNumeral : Token {
    int num;
    
    this(int n) {
        num = n;
    }
}

class Separator : Token {
    char separator;
    
    this(char c) {
        separator = c;
    }
}

void parse(char[] prog) {
    Token[] tokens;
    //flags
    bool comment;
    bool multiComment;
    //vars for storing stuff
    char last;
    for(int i = 0; i < prog.length; i++) {
        char c = prog[i];
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
        else if(isAlpha(c)) {
            char[] buf;
            buf ~= c;
            while(isAlpha(prog[i+1])) buf ~= prog[++i];
            tokens ~= new Identifier(to!string(buf));
        }
        else if(isDigit(c)) {
            char[] buf;
            buf ~= c;
            while(isDigit(prog[i+1])) buf ~= prog[++i];
            tokens ~= new IntegerNumeral(to!int(buf));
        }
        else if(isSeparator(c)) {
            tokens ~= new Separator(c);
        }
        else {
            //TODO: not sure what should be here
        }
        last = c;
    }
}
const char[] separators = {' ',';',',','.','`','@','(',')','{','}','[',']'}
bool isSeparator(char c) {
    return separators.canFind(c);
}