### 老师还是没给工程
理论上只需要修改genIR.cpp   
所以就放了他   
要改的地方在417行
```cpp
        case ASS: {
            // ******************* 代码填写处
            requireLVal = true;
            ast.lVal->accept(*this);
            auto Lvaladdr = recentVal;
            ast.exp->accept(*this);
            auto expValue = recentVal;
            if(Lvaladdr->type_->tid_ == Type::IntegerTyID && expValue->type_->tid_ == Type::FloatTyID) {
                expValue = builder->create_fptosi(expValue, INT32_T);
            }
            else if(Lvaladdr->type_->tid_ == Type::FloatTyID && expValue->type_->tid_ == Type::IntegerTyID) {
                expValue = builder->create_sitofp(expValue, FLOAT_T);
            }
            builder->create_store(expValue, Lvaladdr);


            // ******************* 代码结束
            break;
        }
```

### 捏嘿嘿