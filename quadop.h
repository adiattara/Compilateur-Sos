#ifndef QUADOP_H
#define QUADOP_H

#include <stdlib.h>
#include <stdio.h>


enum quadop_kind{
    QO_ADDR,QO_CST,QO_NAME,QO_EMPTY,QO_UNKN
};

struct quadop
{ 
    enum quadop_kind kind;
    union{
        int cst;
        char* name;
        size_t addr;
    } U;

};







enum quad_kind
{
    Q_ADD,Q_MULT,Q_MOINS, Q_DIV,Q_MOD,
    Q_IFEQ,Q_IFNE,Q_IFGT,Q_IFGE,Q_IFLT,Q_IFLE,Q_IFDIFF,Q_IFAFEC,
    Q_GOTO,

};


struct quad
{
    enum quad_kind kind;
    struct quadop q1,q2,q3;  
};



struct addrcell
{
    size_t addr;
    struct addrcell * next;
    
};
struct addrcell* crelist(size_t adresse);
struct addrcell *concat( struct addrcell* liste1,struct addrcell* liste2);
struct addrcell* complete(struct addrcell*liste, size_t adresse);

struct quadop quadop_cst(int v);
struct quadop quadop_name(char* name);
struct quadop quadop_addr(size_t ad);
char* newtemp();


#endif