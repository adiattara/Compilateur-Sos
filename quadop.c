#include"quadop.h"




struct addrcell *concat( struct addrcell* liste1,struct addrcell* liste2)
{
    if(liste1==NULL) 
        return liste2;

    else{
        liste1->next=concat(liste1->next,liste2);
        return liste1;
    }
};

struct addrcell* crelist(size_t adresse)
{
    struct addrcell* list =malloc(sizeof(struct addrcell));
    
    if(list!=NULL)
    {
        list->addr=adresse;
        list->next=NULL;
        return list;
    }
    else
    {
        printf("allocation memoire list non reusit !!!");
        exit(0);
    }
}


struct quadop quadop_cst(int v){
    struct quadop qo;
    qo.kind=QO_CST;
    qo.U.cst=v;
    return qo;
};

struct quadop quadop_addr(size_t ad){
    struct quadop qo;
    qo.kind=QO_ADDR;
    qo.U.addr=ad;
    return qo;
};


struct quadop quadop_name(char* name){
    struct quadop qo;
    qo.kind=QO_NAME;
    qo.U.name=name;
    return qo;
};












