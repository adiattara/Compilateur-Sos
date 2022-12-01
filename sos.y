%{
#include <stdio.h>
extern int yylex ();
extern void yyerror (const char * msg);
%}


%token ';'  '?' double_virgule
%token  '|' '$' '!'
%token tiret_o tiret_a tiret_n tiret_z
%token ne eq gt ge lt le
%token '+' '-' '*' '/' '%' diff '='
%token IF THEN FOR DO DONE in WHILE UNTIL CASE ESAC Echo READ RETURN EXIT LOCAL ELIF
ELSE FI DECLARE TEST expr
%token '[' ']' '(' ')'  '{' '}'
%token id 
%token entier chaine





%start programme

%%

programme: 		liste_instructions;

liste_instructions :	liste_instructions ';' instruction
			| instruction ;
instruction : 		id '=' concatenation
			| id '[' operande_entier ']' '='  concatenation
			| DECLARE id '[' entier ']'
			| IF test_bloc THEN liste_instructions else_part FI
			| FOR id DO liste_instructions DONE
			| FOR id in liste_operandes DO liste_instructions DONE
			| WHILE test_bloc DO liste_instructions DONE
			| UNTIL test_bloc DO liste_instructions DONE
			| CASE operande in liste_cas ESAC
			| Echo liste_operandes
			| READ   id | READ id '[' operande_entier ']'
			| declaration_de_fonction
			| appel_de_fonction
			| RETURN | RETURN operande_entier
			| EXIT | EXIT operande_entier
			;
else_part     :		ELIF test_bloc THEN liste_instructions else_part
			|ELSE liste_instructions
			|
			;
liste_cas      :	liste_cas filtre ')' liste_instructions double_virgule
			| filtre ')' liste_instructions double_virgule
			;

filtre          :	id |chaine  // mot -> id
			| filtre '|' id // mot -> id
			| filtre '|'  chaine
			|'*'
			;
liste_operandes   :	liste_operandes operande
			| operande
			| '$' '{' id '[' '*' ']' '}'
			;

concatenation     :     concatenation operande
			|operande
			;
test_bloc         :     TEST test_expr ;

test_expr         :     test_expr  tiret_o test_expr2
			|test_expr2
			;

test_expr2        : 	test_expr2 tiret_a test_expr3
			| test_expr3
			;
test_expr3         : 	'(' test_expr ')'
			| '!' '(' test_expr ')'
			| test_instruction
			| '!' test_instruction
			;
test_instruction   : 	concatenation '=' concatenation
			|concatenation diff concatenation
			| operateur1 concatenation
			| operande operateur2 operande
			;
operande           :    '$' '{' id '}' | '$' '{' id '[' operande_entier ']' '}'
			|id | entier | '$' entier | '$' '*' | '$' '?' // mot -> entier
			|  chaine
			| '$' '('  expr somme_entiere ')'
			| '$' '(' appel_de_fonction  ')'
			;
operateur1         :  tiret_n| tiret_z;
operateur2         :   eq  | ne | gt | ge | lt | le ;
somme_entiere      :   somme_entiere plus_ou_moins produit_entier
			| produit_entier
			;
produit_entier     : produit_entier fois_div_mod operande_entier
			|operande_entier
			;

operande_entier     :	'$' '{' id '}' | '$' '{' id '[' operande_entier ']' '}' | '$' entier
			| plus_ou_moins '$' '{' id '}'
			| plus_ou_moins '$' '{' id '[' operande_entier ']' '}'
			| plus_ou_moins '$' entier
			| entier | plus_ou_moins entier
			|  '(' somme_entiere ')'
			;
plus_ou_moins       :   '+' | '-' ;

fois_div_mod	    :  	'*' |'/'| '%' ;

declaration_de_fonction:  id  '(' ')' '{' decl_loc liste_instructions '}' ;

decl_loc            :   decl_loc LOCAL id '=' concatenation ';'
			|
			;
appel_de_fonction	: id liste_operandes
			| id
			;

%%
void yyerror (const char * msg)
{
    fprintf (stderr, "%s\n", msg);
}