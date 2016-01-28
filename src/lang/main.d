import std.stdio;
import std.file;
import lexer;

void main(char[][] args) {
    if(args.length < 2) {
        writeln(args[0] ~ " <filename>");
    }
    else {
        char[] program = cast(char[]) read(args[1]);
        parse(program);
    }
}