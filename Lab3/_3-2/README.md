### 老师没给工程
原理上讲只需要改parser.y
所以只放了parser.y
需要修改的内容在345行  
```cpp
Stmt:   LVal ASSIGN Exp SEMICOLON {
                $$ = new StmtAST();
                $$->sType = ASS;
                $$->lVal = unique_ptr<LValAST>($1);
                $$->exp = unique_ptr<AddExpAST>($3);
        }
        | Exp SEMICOLON {
            $$ = new StmtAST();
            $$->sType = EXP;
            $$->exp = unique_ptr<AddExpAST>($1);
        }
        | SEMICOLON {
            $$ = new StmtAST();
            $$->sType = SEMI;
        }
        | Block {
            $$ = new StmtAST();
            $$->sType = BLK;
            $$->block = unique_ptr<BlockAST>($1);
        }
        | SelectStmt {
            $$ = new StmtAST();
            $$->sType = SEL;
            $$->selectStmt = unique_ptr<SelectStmtAST>($1);
        }
        | IterationStmt {
            $$ = new StmtAST();
            $$->sType = ITER;
            $$->iterationStmt = unique_ptr<IterationStmtAST>($1);
        }
        | BREAK SEMICOLON {
            $$ = new StmtAST();
            $$->sType = BRE;
        }
        | CONTINUE SEMICOLON {
            $$ = new StmtAST();
            $$->sType = CONT;
        }
        | ReturnStmt {
            $$ = new StmtAST();
            $$->sType = RET;
            $$->returnStmt = unique_ptr<ReturnStmtAST>($1);
        }
        ;

SelectStmt: IF LP Cond RP Stmt ELSE Stmt {
            $$ = new SelectStmtAST();
            $$->cond = unique_ptr<LOrExpAST>($3);
            $$->ifStmt = unique_ptr<StmtAST>($5);
            $$->elseStmt = unique_ptr<StmtAST>($7);
        }
        | IF LP Cond RP Stmt {
            $$ = new SelectStmtAST();
            $$->cond = unique_ptr<LOrExpAST>($3);
            $$->ifStmt = unique_ptr<StmtAST>($5);
        }
        ;

IterationStmt: WHILE LP Cond RP Stmt {
            $$ = new IterationStmtAST();
            $$->cond = unique_ptr<LOrExpAST>($3);
            $$->stmt = unique_ptr<StmtAST>($5);
        }
        ;

ReturnStmt: RETURN Exp SEMICOLON {
            $$ = new ReturnStmtAST();
            $$->exp = unique_ptr<AddExpAST>($2);
        } 
        | RETURN SEMICOLON {
            $$ = new ReturnStmtAST();
        }
        ;
```
### 捏嘿嘿