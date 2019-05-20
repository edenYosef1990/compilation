#ifndef ATTR_H
#define ATTR_H

#include <iostream>
#include "string"
#include "typeEnums.h"

typedef struct node {
        virtual std::string printNode();
} Node;

class Type : public Node {
    TypeNameEnum name;
    public:
        Type(TypeNameEnum _typeName) : name(_typeName) {}
};

class Op : public Node {
    opTypeEnum type;
    public:
        Op(opTypeEnum _opType) : type(_opType) {}
        Op(char * _opType) {
            std::string strType(_opType);
            if(strType == "=="){
                type = OP_EQU;
            }
            else if(strType == "!="){
                type = OP_NEQ;
            }
            else if(strType == "!="){
                type = OP_NEQ;
            }
            else if(strType == "<"){
                type = OP_RIGHTBIG;
            }
            else if(strType == ">"){
                type = OP_LEFTBIG;
            }
            else if(strType == "<="){
                type = OP_RIGHTBIGEQ;
            }
            else if(strType == ">="){
                type = OP_LEFTBIGEQ;
            }
        }
};

class BoolVal : public Node {
    ValBoolTypeEnum type;
    public:
        BoolVal(ValBoolTypeEnum _ValboolType) : type(_ValboolType) {}
};

class CmdWord : public Node {
    cmdTypeEnum type;
    public:
        CmdWord(cmdTypeEnum _cmdType) : type(_cmdType)  {}
};

class ScopeVal : public Node {
    scopeValEnum type;
    public:
        ScopeVal(scopeValEnum _scopeType) : type(_scopeType) {}

};

class NumVal : public Node {
    int val;
    public:
        NumVal(char * strNum) : val(atoi(strNum.c_str())) {}
};

class IdVal : public Node {
    std::string IdStr;
    public:
        IdVal(char * strId) : IdStr(strId) {}
};

class StrVal : public Node {
    std::string str;
    public:
        StrVal(char * strVal) : str(strVal) {}
};

#define YYSTYPE Node*

#endif