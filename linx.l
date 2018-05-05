/* $Id$

   linx.l -- Flexible link parser (version 0.1.1)

   Copyright (C) 2003-2014  Ole Aamot <oka@oka.no>
 
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

   $Log$
*/   
%{
%}
%%
http:\/\/[^ \n<>\"\'\)]*        printf("%s\n",yytext);
ftp:\/\/[^ \n<>\"\'\)]*        printf("%s\n",yytext);
.|\n                       ;
%%
int main(int argc, char **argv)
{
  yyin = fopen(argv[1], "r");
  yylex(); /* start the analysis*/
  fclose(yyin);
  return 0;
}
int yywrap()
{
  return 1;
}
